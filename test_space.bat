H:
cd /d "H:\Test_space"
python -m venv test
cd /d "H:\Test_space\test\Scripts"
call activate.bat

echo set PATH=H:\Test_space\test\Node\node-v26.13.0-win-x64;%PATH%
cmd /k
