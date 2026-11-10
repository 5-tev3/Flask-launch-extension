@echo off
set "soubor=~%1"
cd /d "%USERPROFILE%\documents"
python -m venv virtual-Flask
cd /d "%USERPROFILE%\documents\virtual-Flask\Scripts"
call activate.bat
python -m pip install flask
python -m flask --app %soubor% run --debug
cmd /k
