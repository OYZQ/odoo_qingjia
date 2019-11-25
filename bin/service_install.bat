@call title.bat

COLOR 0A

call backup\logo.bat
@set SVC_NAME=CF_RECEIPT_MAN
@echo.
@echo.
@echo      正在把康虎单据通安装为系统服务...
cd ..
"%CD%"\runtime\bin\nssm.exe install %SVC_NAME% "%CD%"\bin\start.bat

@cls
@echo.
@echo      正在启动康虎单据通服务...

net start %SVC_NAME%

@echo.
@echo      如果没出现错误信息，表明康虎单据通服务已经启动、
@echo.
@echo      请打开除IE之外的浏览器，访问：http://localhost:8069
ping 127.0.0.1 > NUL

