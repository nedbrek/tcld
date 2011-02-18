import std.stdio;
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

	int status = Tcl_EvalFile(interp, "code.tcl");
	if( status != TCL_OK )
		writefln("eval failed");
}

