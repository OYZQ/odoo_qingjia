@call title.bat
@cls
@echo off

COLOR 8A

@call logo.bat
@echo.
@echo.
@echo     本工具用以强制杀掉nginx进程
@echo.
@echo.

SET BASEDIR=%CD%

FOR /F "usebackq tokens=2" %%i IN (`TASKLIST /NH /FI "ImageName eq nginx.exe"`) DO (if not %%i == No taskkill /F /PID %%i)

echo nginx进程已全部杀掉

ping 127.0.0.1 > NUL