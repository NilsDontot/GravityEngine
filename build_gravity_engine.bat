@echo off
python -m PyInstaller --onefile --noconsole ^
--icon="C:\Users\donto\Documents\Projects\Programming\GravityEngine\assets\icon.ico" ^
--name "GravityEngine" ^
--distpath "C:\Users\donto\Documents\Projects\Programming\GravityEngine\app" ^
"C:\Users\donto\Documents\Projects\Programming\GravityEngine\gravity_engine.py"

pause
