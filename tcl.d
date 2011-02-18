/// Interface to the Tcl C library
module tcl;
// ----------------------------------------------------------------------

extern (C) {
   alias void* ClientData;
   alias void (*Tcl_FreeProc)(char* blockPtr);
   alias void (*Tcl_CmdDeleteProc)(ClientData clientData);
   alias int (*Tcl_CmdProc)(ClientData clientData, Tcl_Interp * interp,
                            int argc, char* argv[]);
   alias void* Tcl_Command;

   struct Tcl_Interp {
      char* result;
      Tcl_FreeProc blockPtr;
      int errorLine;
   }

   enum {
      TCL_OK = 0,
      TCL_ERROR = 1,
      TCL_RETURN = 2,
      TCL_BREAK = 3,
      TCL_CONTINUE = 4,
   }

   const Tcl_FreeProc TCL_VOLATILE = cast(Tcl_FreeProc)1;
   const Tcl_FreeProc TCL_STATIC   = cast(Tcl_FreeProc)0;
   const Tcl_FreeProc TCL_DYNAMIC  = cast(Tcl_FreeProc)3;

	/// Create a Tcl interpreter
   Tcl_Interp* Tcl_CreateInterp();

	/// Register a new command in the interpreter
   Tcl_Command Tcl_CreateCommand(Tcl_Interp * interp, char * cmdName,
                                 Tcl_CmdProc proc,
                                 ClientData clientData,
                                 Tcl_CmdDeleteProc deleteProc);

	/// Evaluate a string or a file in the interpreter
   int Tcl_Eval    (Tcl_Interp* interp, char* string);
   int Tcl_EvalFile(Tcl_Interp* interp, char* fileName);

	/// Get the last string result from the interpreter
   char* Tcl_GetStringResult(Tcl_Interp* interp);

	/// Set the string result in the interpreter
   void Tcl_SetResult(Tcl_Interp* interp, char* str,
                      Tcl_FreeProc freeProc);
}

