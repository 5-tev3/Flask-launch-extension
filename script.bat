@echo off
cd /d "%USERPROFILE%"
python -m venv test
cd /d "%USERPROFILE%\test\Scripts"
call activate.bat
python -m pip --no-cache-dir install flask
:znovu
for /f "delims=" %%i in ('powershell -noprofile -command "Add-Type -AssemblyName System.Windows.Forms; $dlg = New-Object System.Windows.Forms.OpenFileDialog; $dlg.Filter = 'All files (*.*)|*.*'; $dlg.ShowDialog() | Out-Null; $dlg.FileName"') do (
    set "soubor=%%i"
)
for %%I in ("%soubor%") do if /i "%%~xI"==".py" (
    python -m flask --app %soubor% run --debug
) else (
    echo Zvolte soubor s koncovkou .py
    pause
    goto znovu
)
cmd /k
