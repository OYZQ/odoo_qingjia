@call bin\title.bat

COLOR 8A

@echo.
@echo.
call bin\logo.bat
@echo.
@echo.

@echo      �����������ݿ�...

@SET PATH="%CD%"\runtime\pgsql\bin;"%CD%"\runtime\python;%CD%\runtime\win32\wkhtmltopdf;%CD%\runtime\win32\nodejs;%PATH%.

set log_dir="logs"
if not exist %log_dir% md %log_dir%

@"%CD%"\runtime\pgsql\bin\pg_ctl -D "%CD%"\runtime\pgsql\data -l "%CD%"\runtime\pgsql\logfile start > logs\db.log

@tasklist|find /i "postgres.exe" || GOTO DB_FAILED

@echo.
@echo      ���ݿ��Ѿ�������ϡ�
@echo.
@echo.
exit /b 0

:DB_FAILED
@echo      ���ݿ�����ʧ�ܣ������ԣ������������Ժ�����
exit /b 1000

