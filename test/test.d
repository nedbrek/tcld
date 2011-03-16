import std.stdio;
import std.c.stdio;
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

void getLine(out char[] buf)
{
	readln(buf);
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
	{
		fileName = std.string.toStringz(argv[1]);
		int status = Tcl_EvalFile(interp, fileName);
		if( status != TCL_OK )
			std.c.stdio.fprintf(stdout, "%s\n", Tcl_GetStringResult(interp));
	}

	char[] buf;
	while( 1 )
	{
		writef("%% ");
		getLine(buf);
		int status = Tcl_Eval(interp, std.string.toStringz(buf));
		std.c.stdio.fprintf(stdout, "%s\n", Tcl_GetStringResult(interp));
	}
}

