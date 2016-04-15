@echo off

cd %~dp0
cd ../

echo Installing latest VSCode Extension Manager (vsce)...
call npm install -g vsce
echo Done

echo Publishing to marketplace...
call vsce publish patch :: Default to patch update
echo Done

echo Committing version bump...
call git commit -am "Version bump"
echo Done
