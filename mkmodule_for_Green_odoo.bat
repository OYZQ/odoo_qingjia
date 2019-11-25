@title GreenOdoo - www.GreenOdoo.com
@echo off
@COLOR 09


@echo ======================================
@echo.
@echo           康虎软件工作室
@echo.
@echo            Odoo基础工具
@echo.
@echo            创建模块框架
@echo.
@echo ======================================
@echo.
@echo.


:BEGIN
set /p _m=请输入模块名称：
if not "%_m%X"=="X" goto OK
echo.
echo 要创建的模块名称必须输入!
goto BEGIN

:OK 
set /p _p=请输入保存路径（默认当前目录下myaddons）：

SET BASEDIR=%CD%

if "%_p%X"=="X" SET _p=%CD%\myaddons

:OK1
echo 保存路径=%_p%

SET PATH=%BASEDIR%\runtime\pgsql\bin;%BASEDIR%\runtime\python;%BASEDIR%\runtime\win32\wkhtmltopdf;%PATH%.
@rem echo "PATH="%PATH%

@echo 正在创建模块...
python-oe %BASEDIR%\source\odoo-bin scaffold %_m% %_p%
@echo 模块%_m%已经正确创建到%_m%目录下


@pause