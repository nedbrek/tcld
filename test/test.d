import std.stdio;
import std.string;
import tcl;

version(D_Version2)
{
	   mixin("alias immutable(char)* StringLiteral;");
}
else
{
	   alias char* StringLiteral;
}

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

	StringLiteral fileName = "code.tcl";
	if( argv.length > 1 )
		fileName = std.string.toStringz(argv[1]);

	int status = Tcl_EvalFile(interp, fileName);
	if( status != TCL_OK )
		writefln("eval failed");
}

