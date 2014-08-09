sqlite
======

SQLite autoconf 3080500 with custom Makefile

make options:

* BUILD_DIR: specify a custom build directory (potentially out of source)
    defaults to current directory

* INSTALL_DIR: specify an installation directory
    defaults to current directory

make targets:
    * `all`: builds static library and shell program
    * `sqlite3.a`: just builds the static library
    * `sqlite3`: just builds the shell program
    * `install`: builds static library and shell program and installs them
    * `clean`: deletes the build products
    * `distclean`: cleans, and deletes the installed files

You can do the typical:
    ```
    make install
    ```
or you can get more elaborate:
    ```
    make BUILD_DIR=build INSTALL_DIR=/usr/local/ sqlite3.a
    ```

