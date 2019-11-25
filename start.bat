@echo off
@call bin\title.bat

COLOR 0A

@echo.
@echo.
call bin\logo.bat
@echo.
@echo.

@call start-pg.bat

if %errorlevel% equ 0 (
  @cls
  @call start-odoo.bat
)

@ping 127.0.0.1 > NUL