#!F:\Odoo\GreenPython_2.7_x86\python.exe
# EASY-INSTALL-ENTRY-SCRIPT: 'pip==9.0.1','console_scripts','pip2.7'
__requires__ = 'pip==9.0.1'
import re
import sys
from pkg_resources import load_entry_point

if __name__ == '__main__':
    sys.argv[0] = re.sub(r'(-script\.pyw?|\.exe)?$', '', sys.argv[0])
    sys.exit(
        load_entry_point('pip==9.0.1', 'console_scripts', 'pip2.7')()
    )