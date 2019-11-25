@call title.bat

COLOR 0A

@call logo.bat
@echo.
@echo.
@echo     本工具调用odoo官方的脚手架工具，自动生成新
@echo     模块框架，方便不知道如何调用官方脚手架工具
@echo     的开发人员。
@echo.
@echo.

SET BASEDIR=%CD%

:BEGIN
set /p m=请输入模块名称：
if not "%m%X"=="X" goto OK
echo 要创建的模块名称必须输入!
echo.
goto BEGIN

:OK 
set /p p=请输入保存路径（默认则是 %BASEDIR%\myaddons）：

if "%p%X" == "X" set p=%BASEDIR%\myaddons

SET PATH=%BASEDIR%\runtime\pgsql\bin;%BASEDIR%\runtime\python;%BASEDIR%\runtime\win32\wkhtmltopdf;%PATH%.
@rem echo "PATH="%PATH%

if not exist %BASEDIR%\source\odoo-bin (
@echo odoo主程序odoo-bin不存在，可能是该脚本所在目录不对或odoo10绿色版不存在。
goto FINISH
)

@echo 正在创建模块...
python-oe %BASEDIR%\source\odoo-bin scaffold %m% %p%
if ERRORLEVEL EQU 0 @echo 模块%m%已经正确创建到%p%目录下

:FINISH

@ping 127.0.0.1 > NUL
