@call title.bat
@cls
@echo off

COLOR 8A

@call logo.bat
@echo.
@echo.
@echo     ��������nginx�������ļ�
@echo.
@echo.

SET BASEDIR=%CD%

if not exist %BASEDIR%\runtime (SET BASEDIR=%BASEDIR%\..)

cd %BASEDIR%\runtime\nginx

nginx.exe -s reload 

echo nginx�����ļ�����������

ping 127.0.0.1 > NUL