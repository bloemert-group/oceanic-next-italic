@echo off

cd %~dp0
cd ../

echo ## Copying theme to root of this package...
copy "..\Oceanic Next Italic.tmTheme" ".\Oceanic Next Italic.tmTheme" >nul 2>&1
echo Done

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
del ".\Oceanic Next Italic.tmTheme"
echo Done
