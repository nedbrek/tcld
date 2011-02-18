D bindings for Tcl

The file tcl.d allows D programs to use Tcl, just like in a C program.

The test should compile with something like:
% cd test
% dmd -I.. test.d ../tcl85.lib
% ./test
Hello Cheese

On Windows, you will need an OMF version of the Tcl library (the normal one
is in COFF format).

You may be able to locate a program called "coffimplib".
It's usage is:
coffimplib tcl85.lib tcl85.omf.lib

