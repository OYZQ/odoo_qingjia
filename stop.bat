@echo off
@call bin\title.bat

COLOR 0A

@echo.
@echo.
@call bin\logo.bat
@echo.
@echo.

@call stop-odoo.bat

@call stop-pg.bat

