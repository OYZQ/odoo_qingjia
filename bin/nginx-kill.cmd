@call title.bat
@cls
@echo off

COLOR 8A

@call logo.bat
@echo.
@echo.
@echo     ����������ǿ��ɱ��nginx����
@echo.
@echo.

SET BASEDIR=%CD%

FOR /F "usebackq tokens=2" %%i IN (`TASKLIST /NH /FI "ImageName eq nginx.exe"`) DO (if not %%i == No taskkill /F /PID %%i)

echo nginx������ȫ��ɱ��

ping 127.0.0.1 > NUL