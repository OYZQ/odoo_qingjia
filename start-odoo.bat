@call bin\title.bat

COLOR 0A

@echo.
@echo.
@call bin\logo.bat
@echo.
@echo.

@echo      正在启动odoo服务...

@SET PATH="%CD%"\runtime\pgsql\bin;"%CD%"\runtime\python;%CD%\runtime\win32\wkhtmltopdf;%CD%\runtime\win32\nodejs;%PATH%.

@cls
@call bin\logo.bat
@echo.
@echo.
@echo      应用服务器已经启动完毕，请勿关闭此窗口！！！
@echo.
@echo.

"%CD%"\runtime\python\python "%CD%"\source\odoo-bin -c "%CD%"\bin\odoo.conf


