@echo off

cd %~dp0
cd ../

echo Installing latest VSCode Extension Manager (vsce)...
call npm install -g vsce
echo Done

echo Publishing to marketplace...
call vsce publish
echo Done