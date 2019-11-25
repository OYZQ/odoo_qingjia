@call bin\title.bat

COLOR 0A

@echo.
@echo.
@call bin\logo.bat
@echo.
@echo.

@echo      正在停止odoo服务...
@echo.
FOR /F "usebackq tokens=2" %%i IN (`TASKLIST /NH /FI "ImageName eq python.exe"`) DO (if not %%i == No taskkill /F /PID %%i)

@echo.
@echo.
@echo      odoo服务器已经停止。
@echo.
@echo.

@ping 127.0.0.1 > NUL

