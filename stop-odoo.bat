@call bin\title.bat

COLOR 0A

@echo.
@echo.
@call bin\logo.bat
@echo.
@echo.

@echo      ����ֹͣodoo����...
@echo.
FOR /F "usebackq tokens=2" %%i IN (`TASKLIST /NH /FI "ImageName eq python.exe"`) DO (if not %%i == No taskkill /F /PID %%i)

@echo.
@echo.
@echo      odoo�������Ѿ�ֹͣ��
@echo.
@echo.

@ping 127.0.0.1 > NUL

