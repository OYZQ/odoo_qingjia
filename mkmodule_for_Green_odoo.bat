@title GreenOdoo - www.GreenOdoo.com
@echo off
@COLOR 09


@echo ======================================
@echo.
@echo           �������������
@echo.
@echo            Odoo��������
@echo.
@echo            ����ģ����
@echo.
@echo ======================================
@echo.
@echo.


:BEGIN
set /p _m=������ģ�����ƣ�
if not "%_m%X"=="X" goto OK
echo.
echo Ҫ������ģ�����Ʊ�������!
goto BEGIN

:OK 
set /p _p=�����뱣��·����Ĭ�ϵ�ǰĿ¼��myaddons����

SET BASEDIR=%CD%

if "%_p%X"=="X" SET _p=%CD%\myaddons

:OK1
echo ����·��=%_p%

SET PATH=%BASEDIR%\runtime\pgsql\bin;%BASEDIR%\runtime\python;%BASEDIR%\runtime\win32\wkhtmltopdf;%PATH%.
@rem echo "PATH="%PATH%

@echo ���ڴ���ģ��...
python-oe %BASEDIR%\source\odoo-bin scaffold %_m% %_p%
@echo ģ��%_m%�Ѿ���ȷ������%_m%Ŀ¼��


@pause