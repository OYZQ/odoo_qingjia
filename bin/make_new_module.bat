@call title.bat

COLOR 0A

@call logo.bat
@echo.
@echo.
@echo     �����ߵ���odoo�ٷ��Ľ��ּܹ��ߣ��Զ�������
@echo     ģ���ܣ����㲻֪����ε��ùٷ����ּܹ���
@echo     �Ŀ�����Ա��
@echo.
@echo.

SET BASEDIR=%CD%

:BEGIN
set /p m=������ģ�����ƣ�
if not "%m%X"=="X" goto OK
echo Ҫ������ģ�����Ʊ�������!
echo.
goto BEGIN

:OK 
set /p p=�����뱣��·����Ĭ������ %BASEDIR%\myaddons����

if "%p%X" == "X" set p=%BASEDIR%\myaddons

SET PATH=%BASEDIR%\runtime\pgsql\bin;%BASEDIR%\runtime\python;%BASEDIR%\runtime\win32\wkhtmltopdf;%PATH%.
@rem echo "PATH="%PATH%

if not exist %BASEDIR%\source\odoo-bin (
@echo odoo������odoo-bin�����ڣ������Ǹýű�����Ŀ¼���Ի�odoo10��ɫ�治���ڡ�
goto FINISH
)

@echo ���ڴ���ģ��...
python-oe %BASEDIR%\source\odoo-bin scaffold %m% %p%
if ERRORLEVEL EQU 0 @echo ģ��%m%�Ѿ���ȷ������%p%Ŀ¼��

:FINISH

@ping 127.0.0.1 > NUL
