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
@echo     ������ͨ������������ָ��ģ�顣
@echo.
@echo     ��ĳЩ����£���չ��res.partnerģ�飬����δִ������ʱ��
@echo     ��¼odoo���ܻᱨ�������޷���¼��������øýű�����ģ�顣
@echo     ���⣬�ڿ��������У�ʹ�øýű�����ģ��Ҳ�ܱ����ڽ���һ��
@echo     ��������������棬Ӧ�ÿ������Ч�ʡ�
@echo.
@echo.
@echo   �÷���
@echo.
@echo   �ѱ��ļ��ŵ�������ɫ���binĿ¼�£�Ȼ��ִ�У�
@echo   bin\upgrade_module.bat �����ݿ����� ��ģ��������ģ���ö��ŷָ�����
@echo   ��
@echo   bin\upgrade_module.bat
@echo.
@echo.

:CHECK_ODOO
@echo %BASEDIR%\source\odoo-bin
if not exist %BASEDIR%\source\odoo-bin (
  echo odoo������odoo-bin�����ڣ������Ǹýű�����Ŀ¼���Ի���odoo��ɫ�档
  goto FINISH
)

REM ���������в���
SET _DB=%1
SET _MD=%2

echo ���ݿ�=%_DB%�� ģ��=%_MD%

:DATABASE
if not "%_DB%X"=="X" goto MODULE

set /p _DB=������Ҫ���������ݿ����ƣ�
if not "%_DB%X"=="X" goto MODULE
if not "%_DB%"=="quit" goto FINISH
echo Ҫ���������ݿ����Ʊ�������!
echo.
goto DATABASE

:MODULE
if not "%_MD%X"=="X" goto OK

set /p _MD=������ģ������(���ģ���ö��ŷָ�)��
if not "%_MD%X"=="X" goto OK
if not "%_MD%"=="quit" goto FINISH
echo Ҫ������ģ�����Ʊ�������!
echo.
goto MODULE

:OK

@echo ��������ģ��...
runtime\python\python.exe source\odoo-bin -c bin\odoo.conf -d %_DB% -u %_MD% --stop-after-init --xmlrpc-port 8090

if %ERRORLEVEL% EQU 0 @echo ģ��%_MD%�Ѿ��������

:FINISH
if not "%_BIN_PATH%"=="true" (
  cd bin
)

@ENDLOCAL

@ping 127.0.0.1 > NUL
