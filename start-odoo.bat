@call bin\title.bat

COLOR 0A

@echo.
@echo.
@call bin\logo.bat
@echo.
@echo.

@echo      ��������odoo����...

@SET PATH="%CD%"\runtime\pgsql\bin;"%CD%"\runtime\python;%CD%\runtime\win32\wkhtmltopdf;%CD%\runtime\win32\nodejs;%PATH%.

@cls
@call bin\logo.bat
@echo.
@echo.
@echo      Ӧ�÷������Ѿ�������ϣ�����رմ˴��ڣ�����
@echo.
@echo.

"%CD%"\runtime\python\python "%CD%"\source\odoo-bin -c "%CD%"\bin\odoo.conf


