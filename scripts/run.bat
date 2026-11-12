@echo off
set "soubor=%~1"
set "python_slozka=%USERPROFILE%\Virtual_flask\python"
set "venv_slozka=%USERPROFILE%\Test-prostredi"
set "zip_soubor=%TEMP%\python_embed.zip"
set "python_zip_url=https://www.python.org/ftp/python/3.11.9/python-3.11.9-embed-amd64.zip"
set "pip_url=https://bootstrap.pypa.io/get-pip.py"
set "pip_instalace=%TEMP%\get-pip.py"

if not exist "%python_slozka%\python.exe" (
    if not exist "%python_slozka%" mkdir "%python_slozka%"
        
    curl -sSL "%python_zip_url%" -o "%zip_soubor%"
    tar -xf "%zip_soubor%" -C "%python_slozka%"
    curl -sSL "%pip_url%" -o "%pip_instalace%"
        
    powershell -Command "(Get-Content '%python_slozka%\python311._pth') -replace '#import site', 'import site' | Set-Content '%python_slozka%\python311._pth'"
        
    "%python_slozka%\python.exe" "%pip_instalace%" --no-warn-script-location
    "%python_slozka%\python.exe" -m pip install --no-warn-script-location virtualenv
        
    del "%zip_soubor%" "%pip_instalace%" >nul 2>&1
)

if not exist "%venv_slozka%\Scripts\activate.bat" (
    "%python_slozka%\python.exe" -m virtualenv "%venv_slozka%"
)

call "%venv_slozka%\Scripts\activate.bat"
python -m pip --no-cache-dir install flask
python -m flask --app "%soubor%" run --debug
cmd /k