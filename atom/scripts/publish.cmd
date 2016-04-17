@echo off

cd %~dp0
cd ../

echo ## Copying package.json to root folder of this repo...
move ".\package.json" "..\package.json" >nul 2>&1
echo Done

cd ..

:: TODO: check if  is already installed
echo ## Installing latest Atom Package Manager (APM)...
call npm install -g apm
echo Done

echo ## Publishing to atom.io...
call apm publish patch :: Default to patch update
echo Done

echo ## Copying package.json back to atom folder of this repo...
move ".\package.json" ".\atom\package.json" >nul 2>&1
echo Dne

echo ## Committing version bump...
call git commit -am "Version bump for Atom"
echo Done
