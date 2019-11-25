@call title.bat
@cls
@echo off

COLOR 8A

@call logo.bat
@echo.
@echo.
@echo     重新载入nginx的配置文件
@echo.
@echo.

SET BASEDIR=%CD%

if not exist %BASEDIR%\runtime (SET BASEDIR=%BASEDIR%\..)

cd %BASEDIR%\runtime\nginx

nginx.exe -s reload 

echo nginx配置文件已重新载入

ping 127.0.0.1 > NUL