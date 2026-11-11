@echo off
set "soubor=~%1"
set "python_lokace=%USERPROFILE%\Virtual-flask\python"
set "installer=%TEMP%\python.exe"
set "python_install_adresa=https://www.python.org/ftp/python/3.11.9/python-3.11.9-amd64.exe"
if not exist "%python_lokace%\python.exe" (
    powershell -Command "Invoke-WebRequest -Uri '%python_install_adresa%' -Outfile '%installer%'"
    start /wait "" "%installer%" /quiet InstallAllUsers=0 TargetDir="%python_lokace%" Shortcuts=0 Include_test=0 Include_doc=0 PrependPath=0
    del "%installer%" >nul 2>&1
)
cd /d "%USERPROFILE%\Virtual-flask"
"%python_lokace%\python.exe" -m venv virtual-Flask
cd /d "%USERPROFILE%\documents\virtual-Flask\Scripts"
call activate.bat
python -m pip install flask
python -m flask --app "%soubor%" run --debug
cmd /k