@echo off

cd %~dp0
cd ../

echo ## Creating themes folder in root of this package...
mkdir ".\themes"
echo Done

echo ## Copying theme to themes folder of this package...
copy "..\Oceanic Next Italic.tmTheme" ".\themes\Oceanic Next Italic.tmTheme" >nul 2>&1
echo Done

:: TODO: check if  is already installed
echo ## Installing latest VSCode Extension Manager (vsce)...
call npm install -g vsce
echo Done

echo ## Checking the contents of the package...
call vsce ls

set /p Answer=Does this look okay? (y/n)
if "%Answer%" NEQ "y" ( echo Exiting... & exit /b )

echo ## Publishing to marketplace...
call vsce publish patch :: Default to patch update
echo Done

echo ## Committing version bump...
call git commit -am "Version bump for VS Code"
echo Done

echo ## Cleaning up...
del /F/Q/A ".\themes\Oceanic Next Italic.tmTheme"
rmdir /S/Q ".\themes"
echo Done
