import std.stdio;
import std.string;
import tcl;

/** Tcl driver
 *
 */
void main(char[][] argv)
{
	Tcl_Interp *interp = Tcl_CreateInterp();
	if( !interp )
	{
		writefln("No interp");
		return;
	}

	TclString fileName = "code.tcl";
	if( argv.length > 1 )
		fileName = std.string.toStringz(argv[1]);

	int status = Tcl_EvalFile(interp, fileName);
	if( status != TCL_OK )
		writefln("eval failed");
}

