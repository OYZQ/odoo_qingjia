@call title.bat
@echo off
COLOR 8A

@cls
@SETLOCAL

@SET BASEDIR=%CD%

@set _BIN_PATH=false
@echo %BASEDIR%|find "bin" > nul && set _BIN_PATH=true

if "%_BIN_PATH%"=="true" (
  @SET BASEDIR=%BASEDIR%\..
)

cd %BASEDIR%

@call bin\logo.bat
@echo.
@echo.
@echo     本工具通过命令行升级指定模块。
@echo.
@echo     在某些情况下，扩展了res.partner模块，但还未执行升级时，
@echo     登录odoo可能会报错，导致无法登录，则可以用该脚本升级模块。
@echo     另外，在开发过程中，使用该脚本升级模块也能避免在界面一步
@echo     步点击到升级界面，应该可以提高效率。
@echo.
@echo.
@echo   用法：
@echo.
@echo   把本文件放到康虎绿色版的bin目录下，然后执行：
@echo   bin\upgrade_module.bat ＜数据库名＞ ＜模块名（多模块用逗号分隔）＞
@echo   或
@echo   bin\upgrade_module.bat
@echo.
@echo.

:CHECK_ODOO
@echo %BASEDIR%\source\odoo-bin
if not exist %BASEDIR%\source\odoo-bin (
  echo odoo主程序odoo-bin不存在，可能是该脚本所在目录不对或不是odoo绿色版。
  goto FINISH
)

REM 接收命令行参数
SET _DB=%1
SET _MD=%2

echo 数据库=%_DB%， 模块=%_MD%

:DATABASE
if not "%_DB%X"=="X" goto MODULE

set /p _DB=请输入要升级的数据库名称：
if not "%_DB%X"=="X" goto MODULE
if not "%_DB%"=="quit" goto FINISH
echo 要升级的数据库名称必须输入!
echo.
goto DATABASE

:MODULE
if not "%_MD%X"=="X" goto OK

set /p _MD=请输入模块名称(多个模块用逗号分隔)：
if not "%_MD%X"=="X" goto OK
if not "%_MD%"=="quit" goto FINISH
echo 要升级的模块名称必须输入!
echo.
goto MODULE

:OK

@echo 正在升级模块...
runtime\python\python.exe source\odoo-bin -c bin\odoo.conf -d %_DB% -u %_MD% --stop-after-init --xmlrpc-port 8090

if %ERRORLEVEL% EQU 0 @echo 模块%_MD%已经升级完成

:FINISH
if not "%_BIN_PATH%"=="true" (
  cd bin
)

@ENDLOCAL

@ping 127.0.0.1 > NUL
