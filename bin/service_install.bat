@call title.bat

COLOR 0A

call backup\logo.bat
@set SVC_NAME=CF_RECEIPT_MAN
@echo.
@echo.
@echo      ���ڰѿ�������ͨ��װΪϵͳ����...
cd ..
"%CD%"\runtime\bin\nssm.exe install %SVC_NAME% "%CD%"\bin\start.bat

@cls
@echo.
@echo      ����������������ͨ����...

net start %SVC_NAME%

@echo.
@echo      ���û���ִ�����Ϣ��������������ͨ�����Ѿ�������
@echo.
@echo      ��򿪳�IE֮�������������ʣ�http://localhost:8069
ping 127.0.0.1 > NUL

