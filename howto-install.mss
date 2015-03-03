@make(report)
@style (spacing 1.25, fontfamily timesroman, spread 0.5,indent 0.25in)
@device (Postscript)
@textform (tilde = "@r<~>")
@heading<SUN CLU Release 1.5>
@center (@b<for Sun Workstations running Sun UNIX 4.2 and 4.3>)
@center(@i(Distribution of 26 May 1989))
@set(page=1)
@section(Notes)

CLU is no longer licensed.  See @tilde()CLU/COPYRIGHT for distribution
information.

If you have problems with this distribution, you can call Paul
Johnson or Dorothy Curtis at (617) 253-1945 to get help.  If you
find bugs, please tell us about them, either in writing or by
sending network mail to PRJ@@PM-PRJ.LCS.MIT.EDU and/or
DCurtis@@MESON.LCS.MIT.EDU.  We do not
have the time or the staff for "releases"; you will have to
either FTP a new copy or request a distribution tape (for a fee) periodically.
The sytem is quite stable; no changes other than bug fixes are
contemplated.  We are now hard at work on Argus, the distributed
computing successor to CLU.

SUN CLU was been developed on a SUN-2 Workstation running Sun UNIX 4.2,
release 1.3 and release 2.0. It will work under other versions of
the operating system but it has not been tested under all of them. Let us know if
you encounter problems with this distribution that seem to be caused by
operating system version incompatibilities.

The released version is for a SUN-3 Workstation.
See the file @tilde()CLU/sun3.install for additional instructions
on installing changed files and building new executables.

The @i(CLU Reference Manual) is currently published by Springer-Verlag as a
monograph, ISBN 0-387-91253-3 or ISBN 3-540-91253-3. Formerly it was in
their @i(Lecture Notes in Computer Science) series, Number 114.

Real numbers are not implemented yet. There is currently a dummy ``real''
cluster. The compiler and linker will handle code which uses reals without
any complaints. However invoking ``real'' operations in a running program will
not produce the expected results. There is some chance that we may eventually
incorporate an outside implementation of reals but we do not have the staff
to develop the code ourselves at this time.

CLU modules cannot be linked into programs in other languages, nor can modules
written in other languages be linked with CLU programs. The parts of the CLU
system which are not written in CLU itself are written in 68000 assembly
language using a special assembler developed for CLU. The assembler, called
@t(asm), is included with this distribution. If it were absolutely
necessary you could hand-code  CLU-compatible assembly routines. But BEWARE!
There is little or no documentation of the assembler or the system, but there
are a large number of rules that must be obeyed if the integrity of the
system is to be maintained. Avoid writing assembly language at all costs!


@section(Installation)

The system files and directories are set up to live under a
single root directory, and most system programs will not work
reasonably if the files live elsewhere.  (The executable files
in the exe directory may live anywhere, however).  There is some
flexibility in where the CLU root directory can be installed.
The possibilities (in the order searched) are

@Begin<Enumerate>
the directory specified by the environment variable CLUHOME

the home directory, as listed in @t(/etc/passwd), of user name @t(CLU)

/usr/local/lib/clu

/usr/lib/clu

/usr/clu
@End<Enumerate>

Any such directory can, of course, be a symbolic link to the real directory.
In the file/directory names in this and other CLU documents,
@t(@tilde()CLU) is used to represent the CLU root directory.  (In fact,
this can be used within any CLU program to refer to the root.)

There is one tar file on the tape.  If you are using a tape device
connected directly to the SUN, you can extract the files by creating @t(@tilde()CLU), 
mounting the tape, connecting to @t(@tilde()CLU), and issuing the command @t(tar x)

If the compiler and assembler do not work right off the tape:

@begin(itemize)
To get the compiler to work, delete @t(@tilde()CLU/cmp/state.???) and then run
@t(@tilde()CLU/exe/clu).  When you get the prompt "command(s): ", type "kill".  Check
the file @t(@tilde()CLU/cmp/basic.junk) to make sure there are no errors (gcd_tab
being undefined is OK), then delete it.  To get the assembler to work,
delete @t(@tilde()CLU/asm/state.???) and then run @t(@tilde()CLU/exe/asm).  When you get
the prompt "FILE(S) = ", type "^D".

If the debugger doesn't work off the tape, try recreating the basic run-time
system by deleting @t(@tilde()CLU/sys/basesys) and @t(@tilde()CLU/sys/basesys.dump) and then
issuing the command @t(@tilde()CLU/exe/link #init)
@end (itemize)

If you want the executables in @t(@tilde()CLU/exe) to live elsewhere, move them.

The entire system totals about 10Mb.  If you only want a minimum configuration,
about 2Mb, only the following directories and files are necessary:

@begin (example)
@tilde()CLU
	clu.hacks	Information about special CLU features.
	clu.info	Information about the CLU compiler.
	clu.opts	Information about code optimizations.
	clu.order	Simple compiler command list.
	linker.help	Linker documentation.
	stream.changes	Additional stream operations.
	system.intro	Introduction to the debugging system.
	system.names	Names of modules used in the CLU system.
	trace.cmnd_help Brief help message for trace package.
@end(example)
@begin(example)
@tilde()CLU/bin
	*		Binaries for the run-time system.
@end(example)
@begin(example)
@tilde()CLU/cmp
	basic.types	Only needed to recreate state.??? file.
	state.???	Compiler state file.
@end(example)
@begin(example)
@tilde()CLU/exe
	clu		The CLU compiler.
	debug		The CLU linker (debugging interface).
	link		The CLU linker (production interface).
@end(example)
@begin(example)
@tilde()CLU/lib
	short.help	Brief description of library modules.
	*.spc		Interface specifications for many modules.
	*.lib		Compiler interface libraries.
@end(example)
@begin(example)
@tilde()CLU/link
	spcl_syms.txt	Linker global symbols.
@end(example)
@begin(example)
@tilde()CLU/sys
	basesys		Run-time system for DEBUG.
	basesys.dump	Database for DEBUG.
@end(example)

If you wish to hand-code CLU-compatible assembly routines, then the following
directories and files are necessary or useful (but see warning in
Section 1):


@begin(example)
@tilde()CLU/asm
	addr.defs	Only needed to recreate state.?? file.
	opcode.defs	Ditto.
	perm.defs	Ditto.
	state.??	ASM state file.
@end(example)
@begin(example)
@tilde()CLU/dbg
	dbg.doc		DBG documentation.
@end(examle)
@begin(example)
@tilde()CLU/exe
	asm		The CLU assembler.
	dbg		CLU-oriented version of ADB.
@end(example)

Note: The sources to @t(dbg) are not included in this distribution.  Contact
us if you need them.  We may require a copy of your Unix source license.

If a real-time display editor with some special CLU features is desired,
then the following files are necesary or useful:

@begin(example)
@tilde()CLU
	ted.chart	TED command chart.
	ted.hlp		Documentation about TED.
	ted.press	PRESS file of ted.hlp.
	ted.vt100	VT100 termcap entries we use with TED.
@end(example)
@begin(example)
@tilde()CLU/exe
	ted		A real-time editor written in CLU.
@end(example)

A few utilities that may be useful:

@begin(example)
@tilde()CLU
	calc.hlp		CALC documentation.
	compare.hlp		COMPARE documentation.
@end(example)
@begin(example)
@tilde()CLU/exe
	calc			Simple calculator.
	compare			Text/binary file comparison program.
	gcdprt			Print gc_dump and compiler binary files.
	liblst			List modules in compiler library files.
@end(example)

For more system information:

@begin(example)
@tilde()CLU/
	howto.cons	How to recreate system programs.
	system.files	More directory/file information.
@end(example)

@section (Bugs)

There appears to be a bug in the vadvise() system call. Normally the call
vadvise(VA_ANON) is issued prior to garbage collection.  This informs the
system that the paging behavior of the program will not be easily
predictable and that a different page replacement algorithm should be used.
A call to vadvise(VA_NORM) is issued after garbage collection to return to a
"normal" paging strategy. Adding these calls to the SUN CLU garbage
collector causes non-deterministic failures due to random corruptions of the
heap.  The calls are currently commented out in the garbage collector code.
The result of eliminating the vadvise() calls is that performance during
garbage collection--particularly when the heap is very large--may be much
poorer than it ought to be.

