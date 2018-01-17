:: Build MAD-X in the local src folder, you need to download MAD-X first.
@setlocal
@echo off
call "%~dp0\setvars"

:: Find MAD-X in `src/`, must be downloaded before.
for /f "tokens=*" %%A in ('dir /b "%~dp0\MAD-X*"') do (
    set MADX_SRC=%~dp0\%%A
)

set builddir="%MADX_SRC%\build%PY_ARCH%"
if exist "%builddir%" ( rd /s /q "%builddir%" )
mkdir "%builddir%"
cd "%builddir%"

cmake .. -G "MinGW Makefiles" ^
    -DCMAKE_INSTALL_PREFIX="%MADX_BIN%" ^
    -DBUILD_SHARED_LIBS=OFF ^
    -DMADX_NTPSA=OFF ^
    -DUSE_GC=ON ^
    -DMADX_STATIC=ON

mingw32-make

if exist "%MADX_BIN%" ( rd /s /q "%MADX_BIN%" )
mingw32-make install

pause
endlocal
