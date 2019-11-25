.. _ex_http_server:

Example: Simple HTTP Server (Python 2)
======================================

Example of using Python and XlsxWriter to create an Excel XLSX file in an in
memory string suitable for serving via SimpleHTTPServer or Django or with the
Google App Engine.

Even though the final file will be in memory, via the StringIO object, the
module uses temp files during assembly for efficiency. To avoid this on
servers that don't allow temp files, for example the Google APP Engine, set
the ``in_memory`` constructor option to ``True``.

For a Python 3 example see :ref:`ex_http_server3`.


.. literalinclude:: ../../../examples/http_server_py2.py

