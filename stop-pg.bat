@call bin\title.bat

COLOR 0A

@echo.
@echo.
@call bin\logo.bat
@echo.
@echo.

@echo      正在停止数据库...
@echo.

"%CD%"\runtime\pgsql\bin\pg_ctl -D "%CD%"\runtime\pgsql\data -l "%CD%"\runtime\pgsql\logfile --silent --mode fast

FOR /F "usebackq tokens=2" %%i IN (`TASKLIST /NH /FI "ImageName eq postgres.exe"`) DO (if not %%i == No taskkill /F /PID %%i)


@echo.
@echo      数据库已经停止。
@echo.
@echo.

@ping 127.0.0.1 > NUL

