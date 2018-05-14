@echo off
:: This script is called from other scripts to activate the python environment.

:: First load user custom config
if exist "%~dp0..\env.bat" call "%~dp0..\env.bat"

:: Determine path of parent folder:
for %%a in (%~dp0..) do set "MADGUI_ROOT=%%~fa"


:: Make sure BeamOptikDLL.dll and other scripts can be found later on:
set "PATH=%MADGUI_ROOT%\bin;%PATH%"

:: Depend on python version/architecture
set "PY_SRC=%MADGUI_ROOT%\src"
set "PY_LIB=%MADGUI_ROOT%\lib\site-packages"
set "PY_PIP=%MADGUI_ROOT%\lib\wheelhouse"


:: Add 'lib' folder to PYTHONPATH, so sitecustomize.py will automatically
:: be imported whenever a python interpreter is fired:
if DEFINED PYTHONPATH (
    set "PYTHONPATH=%MADGUI_ROOT%\lib;%PYTHONPATH%"
) ELSE (
    set "PYTHONPATH=%MADGUI_ROOT%\lib"
)

echo on
