@echo off
set "soubor=~%1"
cd /d "%USERPROFILE%"
python -m venv test
cd /d "%USERPROFILE%\test\Scripts"
call activate.bat
python -m flask --app %soubor% run --debug
cmd /k
