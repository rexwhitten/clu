 To make ted.hlp:	unexpand -a ted.lpt >ted.hlp
.fo 0 timesroman10
.fo 3 timesroman12b
.fo 4 symbol10
.fo 5 timesroman7
.sr lasthdr
.if lpt
. eo 0
. oo 0
. ll 79
. pl 10000
.ef
. so r.macros
. sr left_heading 5Vax TED*
. sr right_heading 5date*
. nr chapter_starts_page 0
. tr - 
. tc 0 * 4*
.en
.nr len
.de hdr
. if lpt
.  sl len lasthdr
.  if len
.   br
**** \lasthdr ****
.   if nargs
.    bp
.    rs
.    sp 2
.    en
.   en
.  sr lasthdr \0
.  if nargs
**** \lasthdr ****
.   en
. ef nargs
.  chapter "\0"
. en
. fi
. em
.de para
. sp
. ne 3l
. em
.de def
. in 0
. ne 2l
\0	
' in 8
. em
.de edef
. in 0
. em
.de s
. nr tab_pos\0 hpos
. em
.de t
. if hpos>tab_pos\0
.  tm Tabbed backwards with tab \0 at \lineno
. ef
.  hs (tab_pos\0-hpos)m
. en
. em
.de b
. br
. hs (tab_pos\0-hpos)m
. em
.nc \
.tr ` 
.
.if lpt
.hdr "Menu for TED help"
.nf
A: Introduction				L: Multiple buffers
B: Characters				M: Multiple windows
C: Short examples			N: Incremental search
D: Keypad and function keys		O: Macros
E: Moving the cursor			P: Pattern matching
F: Moving and deleting text		Q: Pattern matching summary
G: Searching				R: Sorting
H: Init files				S: Miscellaneous options
I: Running programs			T: TED variables
J: Adjusting text			U: Indenter variables
K: Multi-file buffers			V: File names/backup/protection
					X: XTED features
.ef
3TED*
.sp
.en
.hdr "Introduction"
TED is a real-time editor written in CLU.  It was inspired by the real-time
TECO developed at MIT.  TED will work with just about any display terminal.
(However, TED seems to push terminals harder than Emacs, so you may find that
/etc/termcap does not specify enough padding for scrolling or insert/delete
line.)  Originally written by Russ Atkinson, TED has been extensively modified
by Bob Scheifler (RWS) and Eliot Moss (EBM) at MIT-XX, and is currently
maintained by Bob Scheifler.
.para
To start a TED, just type
	ted
.br
at CSH level.  TED will start up, clear the screen, and indicate that you are
using the Main buffer.  If you want to edit an existing file (or group of
files), type
	ted filespec
.br
or
	ted filespec ... filespec
.br
Filespecs can only be given the first time you start up a TED.
.para
To get out of TED and back to CSH temporarily, type ^C.  To continue TED from
CSH, use the FG command.  To get out of TED permanently, type ^U0^C.
.para
TED is intended to manipulate ASCII text files.  Files can be copied to a
buffer; the buffer can be changed by commands; and the buffer can be copied
back to files, possibly many times.
.para
While editing the buffer, a cursor is kept and displayed to indicate the
current position in the buffer.  Common actions include inserting characters at
the cursor, deleting characters at the cursor, and moving the cursor.  TED
attempts to display a portion of the buffer around the cursor to show the user
the text being edited.  The displayed portion of the buffer is called the
window.
.para
Most characters typed are normally self-inserting.  That is, as the character
is typed it is immediately inserted into the buffer and the display is changed
to show the insertion.  All control characters (except ^M) are commands that
change the current position, change the buffer, or have more complicated
effects.  For example, control-N (usually written as ^N) causes the cursor to
move to the start of the next line.  Control characters can be inserted by
typing ^Q before typing the control character.
.para
Commands that take numeric arguments (the numeric argument is indicated by #)
usually have their numeric arguments set by the ^U command.  ^U may be followed
by a signed number to explicitly specify the argument.  If ^U is not followed
by a signed number then # becomes the previous # * 4.  The default for # is 1.
A lone minus sign is equivalent to -1.  As the number is typed it will be
displayed at the top of the screen.  A number is terminated by a non-digit.
Most simple commands, and all self-inserting characters, will take a numeric
argument.  For example, ^U10_ will cause ten underscores to be inserted, and
^U^N will cause the cursor to move down four lines.  For some commands, the
exact value of the numeric argument is not important, but whether it is greater
than one, or less than zero, or some similar condition.  For example, ^A will
move the cursor to the start, but ^U^A (in fact, any numeric argument greater
than one) will move the cursor to the start of the buffer.
.para
Some commands require string or file name arguments, and will request them at
the bottom of the screen.  String arguments and file names are terminated by
carriage return, with most control characters having normal editing effects
while typing in arguments.  To insert a newline into the argument, type a
linefeed.  A default string or file name is usually supplied, which will be
used if no argument is typed.  ^R replaces the current argument with the
default, ^U^R inserts the default before the cursor, ^U-^R inserts the default
after the cursor, ^W replaces the default with the current argument, ^U^W
deletes the default, and ^G quits from the command.
.para
For file name arguments, the default is used to fill in any missing parts of
the file name(s).  A file name is considered to consist of four components in
the form "dir/name.suffix.other", where the name and suffix parts do not
contain periods.  The defaults are always used when modifying a file.  When
reading a file, first all of the defaults are tried, then just the directory
default, then all but the directory default, and finally with no defaults.
Empty or relative directory fields are completed from the connected directory,
which is settable via ^\W.  The last string or file name argument is always
remembered, and can be inserted at any time via ^VG.  For example, if you try
to read in a file, but misspell its name, you can save typing the whole name
again by typing ^R^VG.  Similarly, in the ^Z command, if the replace string is
similar to the search string, you can use ^VG in typing the replace string to
insert the search string.
.para
Some commands require a 1-character option (preceded by an optional numeric
argument).  Examples of these are ^V, ^X, ^\, ^], and ^_.  The optional numeric
argument defaults to 1 where applicable, and has an optional minus sign.  The
actual numeric argument used will be the implicit argument (from a preceding
^U) times any explicit argument given after the option.  ^G will quit from the
option, ^L will re-display, and ? will type help for the options.  The case of
the option character does not matter.
.para
Some commands require a Yes/No confirmation.  A question will be displayed at
the top of the screen, to be answered by typing Y or N (case is unimportant).
^G can also be typed to abort the command, so that no action is taken.
.para
Long lines are not displayed on multiple lines of the screen.  If a line is
longer than the width of the screen, TED will display an exclamation mark (!)
in the last column to indicate that the line is too long to display completely.
^V! can be used to (find and) display more of a long line.
.para
Every so often the buffer is saved to the file "_ted.sav.#" (where # is your
process id) in your login directory if the buffer has been changed.  This is
intended to allow recovery from system crashes.  In addition, if TED receives a
SIGHUP signal, a save will be performed if the buffer has been changed.
However, it is still a good idea to periodically write out your buffer
manually.  The ^U-^H command can be used to turn saving on or off.
.para
Suppose that you want to create a text file from scratch.  When TED starts up
you have an empty buffer.  To insert normal text into the buffer, just type as
you would on a typewriter.  The delete key (usually represented here as ^?)
will allow you to undo minor errors quickly.  Then, to save the results of your
typing, use the ^W command to write the buffer to a file.  For a new file you
must give a file name in order to save your work.
.para
If you want to edit an old file, use the ^R command to read it into the buffer
(the old contents of the buffer will be deleted).  To insert (at the cursor)
the text of a file into the text of the existing buffer, use the ^U^R command.
To find a place that you want to change, you can search for text (using the ^S
command) that precedes the place you want changed.  Then you can use ^D to
delete characters, or ^K to kill entire lines, and insert the correct text.
Again, to save the results of your editing, use the ^W command to write the
buffer to a file.  If you do not give a file name in this case, the ^W command
will write out a new version of the file.  To append the text of the buffer
onto the end of an existing file, use the ^U^W command.
.para
The best way to learn TED is to start a TED up and practice manipulating text.
Experimenting is encouraged, since you can see the effects of most characters
directly on the screen.  TED has a built-in help command, ^H, which allows you
to view pieces of this file by selecting from a simple menu.
.hdr "Characters"
.nf
Char:	Effect: (# is a numeric arg (default 1), % is a string arg)

^@	(#=1: escape to shell, #=0: terminate to shell, else: garbage collect)
^A	go to start of line (#>1: go to start of buffer)
^B	move back # chars
^C	(#=1: escape to shell, #=0: terminate to shell, else: garbage collect)
^D	delete # chars forward
^E	go to end of line (#>1: go to end of buffer)
^F	move forward # chars
^G	quit from numeric/string argument or subcommand option
^H	help command (s(1)#<0: toggle buffer saving,
b(1)#=0: flush help buffers,
b(1)#=1: TED help,
b(1)#>1: User-defined help)
^I	(TAB) insert # tabs
^J	(LF) run/continue interactive inferior (#>1: kill inferior)
^K	kill # lines (#=0: kill to end of line, #=-1: kill to start of line)
^L	clear screen & redisplay (#<1: redisplay, #>1: save buffer(s))
^M	(CR) insert # newlines before cursor (terminates %)
^N	move down # lines
^O	insert # newlines after cursor
^P	move up # lines
^Q	insert next char typed # times
^R	read file(s) from % (s(1)#<1: insert new file(s),
b(1)#=1: discard current file(s) and read new file(s),
b(1)#>1: insert text of file(s))
^S	search for % # times (#<0: search backwards, #=0: set case mode)
^T	set the mark at current cursor (#>1: swap mark & cursor)
^U	multiply # by number (default 4)
^V	text/cursor mover/saver
^W	write file(s) (s(1)#<0: write changed files of current buffer,
b(1)#=0: write current file if changed,
b(1)#=1: write current file to %,
b(1)#>1: append current file onto %)
^X	multiple buffers/windows, move by indent/region/list, pattern search,
	  macros, mail check, restrict buffer, draw, box, set modes/variables
^Y	^Y^@c or ^U0^Yc to define macro for char 'c', ^Yc to execute
^Z	replace %1 by %2 in rest of current file (#>1: rest of buffer)
^[	(ESC) escape for VT52 and Heath function and alternate keypad keys
^\	compile, indent, format, mail
^]	adjust lines/marked-text/paragraph/comments
^^	edit/scan/type/list matching files
^_	delete/link/change-mode/rename files
^?	(DEL) delete # chars backwards (usually can't be typed as CTRL-?)
other	chars insert themselves # times before cursor (#<0: after cursor)
.hdr "Short examples"
.nf
('$' stands for carriage-return)

User types:	Effect:

ABC		Insert "ABC" at cursor, move cursor over 3 characters.
^Rfoo.clu$	Read the file foo.clu to the buffer, place cursor at buffer
		start, display the current window.
^Wfoo.clu$	Write the buffer to the file foo.clu, no change to the cursor.
^W$		Write buffer to current file.
^U^F		Move cursor 4 characters forward.
^U56^N		Move cursor 56 lines forward.
^U^V3F		Move cursor 12 words forward.
^A		Move cursor to line start.
^U^A		Move cursor to buffer start.
^E		Move cursor to line end.
^U^E		Move cursor to buffer end.
^Siter$		Search forward for "iter" 1 time.  Sets default to "iter".
^U-^S$		Search backward 1 time for the default.
.hdr "Keypad and function keys"
On VT52's, Heath's, and many other terminals the alternate keypad and function
keys can be used.  Their corresponding escape sequences can also by typed
explicitly.  (The keys listed below are for Heath's in shifted keypad mode.)

.nf
.ne 6l
.if press
. ta 12 20 28 36 44
. en
Key:	Seq:	 Meaning:

	esc esc	 redefine escape sequence (see below)
7	esc @	 move to end of # previous word (^V[)
8,UP	esc A	 move backward # pages (^V^P)
2,DOWN	esc B	 move forward # pages (^V^N)
6,RIGHT	esc C	 move forward # words (^V^F)
4,LEFT	esc D	 move backward # words (^V^B)
5,HOME	esc H	 enter alternate keypad mode
ERASE	esc J	 pattern search # times for default (^X^P^M)
1	esc L	 delete backward to end of # previous word (^V<)
3	esc M	 delete forward to start of # next word (^V>)
9	esc N	 move to start of # next word (^V])
BLUE	esc P	 delete # words forward (^V^D)
RED	esc Q	 delete # words backwards (^V^?)
GREY	esc R	 string search forward # times for default (^S^M)
f1	esc S	 string search backward # times for default (^U-^S^M)
f2	esc T	 set case mode for searches (^U0^S)
f3	esc U	 scroll window up # lines (^V-^J)
f4	esc V	 scroll window down # lines (^V^J)
f5	esc W	 reposition window at cursor (^U0^L)
	esc ? ?	 print help
ENTER	esc ? M	 garbage collect address space (^U^C)
.	esc ? n	 exit to CSH (^C)
0	esc ? p	 search backward # times for default (^U-^S^M)
	esc ? q	 delete backward to end of # previous word (^V<)
	esc ? r	 move forward # pages (^V^N)
	esc ? s	 delete forward to start of # next word (^V>)
	esc ? t	 move backward # words (^V^B)
shft 5	esc ? u	 exit alternate keypad mode (when in alternate keypad mode)
	esc ? v	 move forward # words (^V^F)
	esc ? w	 move to end of # previous word (^V[)
	esc ? x	 move backward # pages (^V^P)
	esc ? y	 move to start of # next word (^V])
.if press
. rtabs
. en
.fi
.para
The sequences "esc`[`char" and "esc`O`char" are interpreted the same as
"esc`?`char" when "char" is a lowercase letter, and otherwise are interpreted
the same as "esc`char".
.para
It is also possible to redefine any escape sequence (and hence any function or
keypad key), to execute an arbitrary string.  The string is executed just like
a macro definition, and has basically the same effect as if you typed the
characters of the string directly on the keyboard.  An escape sequence can be
"undefined" back to its original meaning by defining it to the empty string.

.ne 2l
	esc esc char		to redefine	esc char
	esc esc ? char		to redefine	esc ? char
.para
Note that a function or keypad key can be redefined by typing ESC and then the
function or keypad key.
.para
Sequences which are "equivalent" to ^V deletion commands are not completely
equivalent, in that they do not save the deleted text in the implicit kill
area.  If saving is important, these sequences can be redefined to explicitly
execute the appropriate ^V command.
.hdr "Moving the cursor"
There are many commands for moving the cursor around, almost all of which take
a numeric argument as a repetition count:

.nf
.ne 4l
.if press
. ta 12
. en
^U^A	moves to the start of the buffer
^U^E	moves to the end of the buffer
^A	moves to the start of the current line
^B	moves to the previous character, wrapping to end of previous line
^E	moves to the end of the current line
^F	moves to the next character, wrapping to start of next line
^N	moves to the start of the next line
^P	moves to the start of the previous line
^V^B	moves to the start of the previous word
^V^F	moves to the end of the next word
^V]	moves to the start of the next word
^V[	moves to the end of the previous word
^Vspace	skips forward over blanks
^V#L	moves to line #
^V^N	moves to the next screenful of text
^V^P	moves to the previous screenful of text
^V!	moves to the next (or current) line which extends off the screen
^X^B^P	moves to the previous start of paragraph
^X^E^P	moves to the next end of paragraph
^X^F^P	moves to the next start of paragraph
^X^B^S	moves to the previous start of sentence
^X^E^S	moves to the next end of sentence
^X^F^S	moves to the next start of sentence
.fi
.if press
. rtabs
. en
.para
Normally, paragraphs are separated by "formatter" lines.  Formatter lines are
blank lines, and any lines starting with a character in the "no_fill_starters"
string variable.  This variable contains period and single quote by default,
for R20 text formatter command lines.  It is also often useful to consider a
new paragraph to start at every line with leading spaces or tabs.  This can be
obtained by setting the "pindent" number variable to a non-zero value (it is
zero by default).
.para
A sentence is terminated by a period, exclamation point, or question mark,
optionally followed by a single quote, double quote, or right "bracket" (round,
square, curly, or angle), followed by a newline, a tab, two spaces, a space and
a tab, or a space and a newline.  Formatter lines also separate sentences.
.para
A word consists of letters and digits, plus certain special characters.  By
default, the only special character is underscore.  You can specify what the
special characters are by changing the "word_chars" string variable.
.para
The following commands move the cursor based on the indentation (amount of
leading space consumed by spaces and tabs) of lines in the buffer.  These are
particularly useful in moving around in (reasonably formatted) CLU and Argus
code, but are useful for other languages and documents as well.  Most move by
comparing the indentation of previous or following lines with the indentation
of the current line, and most take a numeric argument as a repetition count:

.if press
. ta 12 20 28 36 44
. en
.nf
.ne 5l
^X^I^B	moves back to the next line with a different indentation
^X^I^D	moves to the next line with a greater indentation, provided
	no line with a lesser indentation intervenes
^X^I^E	moves to the next line with a lesser indentation
^X^I^F	moves to the next line with a different indentation
.ne 2l
^X^I^H	moves back to the next line with a greater indentation, provided
	no line with a lesser indentation intervenes
.ne 2l
^X^I^N	moves to the next line with the same indentation, provided
	no line with a lesser indentation intervenes
.ne 2l
^X^I^P	moves back to the next line with the same indentation, provided
	no line with a lesser indentation intervenes
^X^I^U	moves back to the next line with a lesser indentation
^X^I#^S	moves to the next line indented # spaces
^X^I#^^	moves back to the next line indented # spaces
.fi
.para
The following commands move the cursor based on nested "list" structure, i.e.,
based on nested matching ()'s, []'s, {}'s, and <>'s, ignoring the contents of
string and character literals.  The string variable "list_chars" should be some
subset of the characters (), [], {}, <>, ", and ', and defines the active list
and literal delimiters, with the default being all but <>.

.nf
.ne 7
^X^Z^A	moves backward up # list levels
^X^Z^B	moves backward over # lists at the current nesting level
^X^Z^D	moves (#>0: forward, #<0: backward) down # list levels
^X^Z^E	moves forward up # list levels
^X^Z^F	moves forward over # lists at the current nesting level
^X^Z^N	moves forward up and down (^X^Z^E^X^Z^D) # times
^X^Z^P	moves backward up and down (^X^Z^A^X^Z-^D) # times
.if press
. rtabs
. en
.hdr "Moving and deleting text"
The following commands delete text, and take a numeric argument as a repetition
count:

.nf
.ne 9l
^D	deletes the next character
^?	(DEL) deletes the previous character
^K	deletes to the start of the next line
^VK	deletes the text between the mark and the cursor
^V^D	deletes to the end of the next word
^V^?	deletes to the start of the previous word
^V^@	deletes blanks from the cursor forward
^V>	deletes to the start of the next word
^V<	deletes to the end of the previous word
.fi
.para
^D and ^? do not save the deleted text, but the others do.  The text deleted
by the last such command, or by the last sequence of ^K commands, is retained
in an invisible kill area, and can be reinserted anywhere by moving the cursor
to the point of insertion and typing ^V^R (to insert after the cursor) or ^V-^R
(to insert before the cursor).  This is a simple way of moving text.
.para
^V^Z deletes all lines in the buffer.
.para
Moving text from one portion of the buffer to another can also be done by
copying the text from where it is to an invisible save area using one of the
text-saving options of the ^V command, moving the cursor to the point of
insertion, and typing ^V^I (to insert after the cursor) or ^V-^I (to insert
before the cursor).  The text-saving commands are:

.nf
.ne 5l
.if press
. ta 10
. en
^V#C	saves the next # words following the cursor
^V#^S	saves the next # lines following the cursor
^VS	saves the text between the mark and the cursor
^V#^W	saves and deletes the next # lines following the cursor
^VW	saves and deletes the text between the mark and the cursor
.if press
. rtabs
. en
.fi
.para
The ^T command is used to set an invisible mark in the buffer, which will
remain there until a subsequent ^T command moves it, or a ^U^T command
exchanges it with the cursor.
.para
Note that, as with the kill area, there is only one save area for ^V commands,
so that the second time a text-saving command is used the text saved by the
first command will no longer be in the save area.  The ^V^R and ^V^I commands,
however, can be used to insert the same text as many times as desired in as
many places as desired.
.para
Multiple named save/kill areas can be obtained with multiple buffers commands.
.hdr "Searching"
Simple string searching is performed with the ^S command.  Searching can be
done either forwards or backwards, depending on the numeric argument.  For
example, ^U5^S will search forward for the fifth occurrence of some string, and
^U-^S will search backwards for the first occurrence.  A newline can be
included in the search string by typing linefeed.  Upper/lower case
distinctions normally make a difference when searching, but can be ignored by
setting a flag with the ^U0^S command.  This flag controls all searching
commands, not just ^S.
.para
Changing all (or some) occurrences of some string to another string is done by
the ^Z command.  It will ask for the text string to change, and the string to
change it to.  Then for each occurrence of the search string you can type Y to
change it to the default, or N to avoid changing it, or U to update all
remaining occurrences to the default.  There are many other options as well.
At the end, you can either install the changes or leave the buffer as it was
originally.
.para
Various options of the ^^ command allow you to peruse or search a list of
files.  The list is just like that for ^R when making a multi-file buffer.  ^^T
simply displays the files one at a time, with commands for moving by pages,
searching, editing, and moving to the next or previous file.  ^^S only displays
those files containing a particular string.  ^^P only displays those files
containing a particular pattern.  ^^R reads all of the files into a temporary
recursive editing buffer.  ^^L simply lists the names of the files, and allows
you to select a particular one at a time for editing by placing the cursor on
the name of a file and typing ^R.  Typing ^R on a directory file will cause a
recursive ^^L.  ^^I simply inserts the names of the files into the current
buffer.
.para
There are also incremental searching modes and pattern matching search modes,
described separately.
.hdr "Init files"
TED executes the file ".ted_init" in your login directory when it first starts
up.  That is, it executes the characters in ".ted_init" just as if you typed
them at the keyboard.  This allows you to set up various options any way you
want automatically.
.para
A typical ".ted_init" might be:
.para
^X^SS^X^KS^V25%^]64W^]64B
.para
This particular example turns on incremental search mode and alternate ^K mode,
forces the last screenful of a file to display 25% blank (it is normally
displayed 70% blank), sets the paragraph fill width to 64 characters, and turns
on auto-break mode by setting the break limit at 64 characters.
.para
For readability, your ".ted_init" can be split into several lines.  Newlines
are discarded, except that a blank line is converted to ^J.  Hence, a ^J must
be represented by two ^J's.
.para
Note that these files must contain all of the ^Q's you would normally have to
type to get control characters into string arguments such as macro bodies and
search patterns.  For example, to define ^Y^L to be ^U-^L, a file would have
to contain the following:
.para
^Y^@^L^Q^U-^Q^L^M
.hdr "Running programs"
The ^J command allows the user to run programs interactively from TED without
leaving the editor environment, so that TED can be used like a primitive shell.
The ^J command asks for a program name, and if there is currently no inferior
for the program, asks for a command line and then starts the program.  If there
is an inferior for the program, the inferior is continued.  The default program
name is the most recently stopped inferior.  If there are no stopped inferiors,
the value of the string variable "default_fork" is used, with default value
"debug".  The ^U^J command can be used to kill an inferior that cannot
otherwise be terminated.
.para
If the "pause" number variable is non-zero, TED will not clear the screen after
an inferior terminates until the next command is typed.  This allows you to
look over the output of inferiors that you do not actually interact with.
.para
The ^\ command also allows the user to run certain kinds of programs from TED
without leaving the editor environment.  The options of this command provide a
simple interface to allow the user to do the following:

.ne 11l
	I,Q:		 Indent current file.
	C,H,J,K,O,U:	 Compile files.
	D,L,P,R,V,X:	 Format current file using R20.
	E:		 Format current file using Scribe.
	M:		 Makefile.
	S:		 Send contents of current file as mail.
	Y:		 Run arbitrary program with the contents of
			 the current file as input.
	Z:		 Run arbitrary program with the name of
			 the current file as JCL, or with arbitrary JCL.
	A,B:		 Type or insert the last report from the above.
	W:		 Change working directory.
.para
Many of the options run separate programs.  While a separate program is running
TED prints the amount of real time that has elapsed.  A ^G typed at TED can
abort a runaway program (the user will be asked for definite confirmation).  In
general, before running a separate program, if the current file has been
changed since it was last read or written, then the file is automatically
written to a new version.  After executing an option, any results are
automatically displayed.  These results are retained in a buffer named
"Result", and may be redisplayed later with the A option or inserted in the
current buffer with the B option.  If the results contain errors keyed by line
number, you can move to a particular line with the ^V#L command.
.para
The CLU/Argus indenter operates either on the whole file (the I option) or on
the text starting to the right of the current cursor (the Q option), performing
fairly complete syntax checking of programs as well as attempting to indent
code attractively.  Errors are reported as if a separate program were run,
although a separate program is not run.  The Q option will indent a specified
number of textual "units", where a unit is basically a module, routine, equate,
statement, expression list, or expression.  The text to the right of the cursor
should start such a unit.  The indentation of the current line is assumed to be
correct; it is not derived from context.  Indentation is controlled by a number
of variables, settable via ^XI.
.para
The CLU or Argus compiler can be run as an inferior process to compile
programs.  The most common usage (the C option) is to compile the current
buffer contents, first writing them out if the buffer has been changed since it
was last read or written.  The O option is like C, but causes an optimizing
compilation.  The U option will write out all changed files and then run the
compiler on just those, all files, or all files with out-of-date binary files,
or files with out-of-date binaries from a specified list.  There are a number
of options under the U option to specify the compilation mode (normal
compilation, optimization, type-check, etc.)  Explicit compiler commands can be
passed to the compiler via the J option.  Giving a zero argument with the J
option prevents the current file from being written out.  For the C and O
options, the suffix must be "clu" (or "arg"), "equ", "xfile", "spc", or "";
these cause COMPILE, CE, XFILE, SPECS, and COMPILE compiler commands,
respectively.  The K option either keeps or kills a compiler.  If the compiler
is kept, the type-checking will usually be more complete.  The compiler should
generally be kept while compiling files from the same program.  When finding
out-of-date binaries, the default suffix "bin", although this can be controlled
with the "binary_suffix" variable; the default directory is the source
directory, but this can be controlled with the "binary_dir" variable, which can
specify a directory relative to the source directory.  The N option can be used
to change the name of the compiler.
.para
The text formatter "R" can be used to format the current file in six ways.  The
D option formats it for the DIABLO, the L option formats it for the line
printer, the P option produces PRESS format, the X option formats it for the
XGP, the V options formats it for the Varian, and the R option allows the user
to give explicit commands.  Giving a zero argument with the R option prevents
the current file from being written out.  The name of the program R is defined
by the string variable "r_name", default value "r".  The program name can
contain a directory specification.  In addition, "r_name" can specify a
constant prefix to be added to the command line, by appending the prefix,
separated by a space, to the program name.
.para
The E option can be used to run the text formatter "Scribe".  The name of the
program Scribe is defined by the string variable "scribe_name", default value
"scribe".  The program name can contain a directory specification.
.para
The M option can be used to execute a "make" command.
.para
TED can be used to compose and send mail.  Just type the text of the message
into the buffer, and then use ^\S.  If you want a subject heading, just start
the first line of the message with "Subject:`".  You will be prompted for the
addresses to send the message to.  The name of the mail program is defined by
the string variable "mail_name", default value "/usr/lib/sendmail".  The
program name can contain a directory specification.  In addition, "mail_name"
can specify a constant prefix to be added to the command line, by appending the
prefix, separated by a space, to the program name.
.para
An (almost) arbitrary program can be run with the name of the current file as
JCL (but with no primary input) via the Z option.  The program can be run with
arbitrary JCL via ^\0Z.  The name of the program is defined by the string
variable "progz_name".  The program name can contain a directory specification.
In addition, "progz_name" can specify a constant prefix to be added to the
command line, by appending the prefix, separated by a space, to the program
name.
.para
An (almost) arbitrary program can be run with arbitrary JCL and the contents of
the current file as primary input via the Y option.  The name of the program is
defined by the string variable "progy_name".  The program name can contain a
directory specification.  In addition, "progy_name" can specify a constant
prefix to be added to the command line, by appending the prefix, separated by a
space, to the program name.  Beware that a single process is sending input to
the program and collecting output, so it is possible to deadlock.
.hdr "Adjusting text"
Text can be adjusted simply in TED using the ^] command.  The user can adjust a
marked region of text (M), a region of comments (contiguous lines with the same
initial non-blank character) (C), a paragraph (P), or a region of the next N
lines (N).  In addition, the width to use when adjusting can be set (by default
it is 64) (W).  The text is justified "ragged right" by default, in that no
extra spaces are inserted to align the text on the right margin.  However, the
justification mode can be changed to insert extra spaces to produce even left
and right margins (J).  Formatter lines (blank lines and lines starting with a
character in the "no_fill_starters" string variable) will not be adjusted.
Paragraph justification works only on non-indented paragraphs, i.e., only the
first line of the paragraph may contain leading spaces or tabs.
.para
Text (or comments) may also be justified as it is being entered.  This is
auto-break mode, and may be set by specifying a width to break at when entering
text (B).  A fill prefix may also be specified (A).
.para
The marked text can be left (L), right (R), or center (E) justified within a
fixed width field.  The absolute value of the numeric argument specifies the
field width.  When right or center justifying multiple lines, or when center
justifying the end of a single line, the field will not be padded out on the
right with spaces unless a negative argument is specified.
.para
There is also an auto-indent mode (I), in which typing carriage return causes
blank space, equal in width to the leading blank space of the current line, to
be inserted at the beginning of the new line.  Blank space is also inserted at
the beginning of new lines created by auto-break mode.  In addition, ^V#^U will
change the leading blank space of the current line to be equal in width to the
leading blank space of the previous line, plus # additional (or fewer, if # is
negative) spaces.
.para
The text between the mark and the cursor can be indented or "undented" with
^V#H, where # is the number of spaces to add or subtract.  ^V0H has the effect
of converting leading spaces to tabs where possible.  The remainder of a line
starting at the cursor can be moved to start at a particular column with ^V^H.
.hdr "Multi-file buffers"
^R, ^U^R, and ^U-^R can be used to read several files in to the buffer.  The
argument to these commands is basically a list of file specifications, which
can have *'s in them, where * matches zero or more characters.  A real * in a
file name can be represented with ^@.  The specifications can be separated by
commas, spaces, tabs, or newlines.  These separators can be included in
specifications be preceding them with a backslash (\).  All files matching the
specifications are read in.  Alternatively, a file name (with no *'s in it) may
be preceded by an @, in which case the named file is expected to contain a list
of file specifications (which can also have @'s in from of them).  For ^R, if
there is only one matching file, it replaces the current file (the one the
cursor is in) in the buffer; if there is more than one matching file, the
entire buffer is first flushed.  For ^U-^R, all matching files are simply
inserted into the buffer.  For ^U^R, the text of each matching file is inserted
into the current file of the buffer.  Note that the default file name applies
to all file specifications, including those in @-files.
.para
.ne 4l
Each file appears in the buffer with a 3 line heading of the form:
	^L
	% <file name>
	<blank line>
.br
These lines cannot be modified.
.para
Most TED commands work as before, with (at least) the following exceptions.
Text withdrawal only works within a given file; that is, one cannot withdraw
text containing parts (or all) of different files.  (^U)^R, (^U)^W, and ^\I
only affect the current file, i.e., the file containing the cursor.  ^Z acts on
the current file, and ^U^Z acts on the entire buffer.
.para
^U-^W can be used to write out (only) changed files, with options of using the
existing file names or specifying new ones.  There are a number of ^V options
related to multi-file buffers.  ^VA moves to the start of the current file, ^VE
move to the end of the current file, ^VN moves to the start of the next file,
^VP moves to the start of the previous file, ^V#@ moves to line # of the
buffer, ^V^K deletes the current file from the buffer, and ^VO inserts space
for a new file.  ^VV displays the file number and name of the current file, the
file and buffer line numbers of the current cursor position, and the column and
character numbers of the current cursor position.  There is also a ^\ option
related to multi-file buffers.  ^\G takes the current file, which should be a
CLU or Argus file, and splits it into a several files, each containing one
module.
.para
While working on a multi-file buffer, all changed files will be written to the
ted save file.  If the system crashes, simply reading in your ted save file
will not get you back to a multi-file buffer.  To separate out individual
files, see "~CLU/restore.macro".
.hdr "Multiple buffers"
When you first start up a TED, you are working in a buffer named "Main".  It is
possible to have multiple named buffers around, and to switch between them.
Only one buffer is displayed in a window at one time, and any buffer can have
multiple files in it.  Multiple buffers are an alternative to multi-file
buffers, and both are useful on occasion.
.para
The multiple buffer commands are under ^X^H.  There are commands for creating
and destroying buffers and for switching between them, for moving text between
buffers, and for displaying the status of all buffers.  All buffers are kept in
a ring structure, and several commands work on the basis of ring order.

.def ^B
asks for a buffer name, and displays that buffer if it exists, else creates and
displays a new empty buffer of that name.
.def ^D
displays a list of all buffers and the files in those buffers, and indicates if
they have been modified since last written.
.def ^F
flips to the buffer previously displayed in the window, if any, else the
previous buffer in the ring.
.def ^H
asks for a string and displays the next buffer in the ring whose name contains
that string as a substring.
.def ^K
asks for a buffer name and kills the specified buffer unless it is being
displayed by another window.  Confirmation must be given if the buffer has been
modified.  If the buffer is being displayed in the current window, a new buffer
is chosen for display.
.def ^N
displays the #'th next buffer in the ring
.def ^P
displays the #'th previous buffer in the ring
.def ^R
asks for a list of files, creates (if necessary) a buffer whose name is derived
from the list, reads the files into the buffer, and displays the buffer.  If
the buffer already exists and has been modified, confirmation must be given.
For a single file specification, the buffer name is the name.suffix pair of the
file specification.  For a list of file specifications, a new buffer is always
created, and will be "Main" followed by digits.
.def ^S,S
appends text from the current buffer to the end of a named buffer (default
"Temp").  ^S appends # lines, S appends the marked text.  The text is not
deleted from the current buffer.  The named buffer is created if it does not
exist.
.def ^W,W
withdraws text from the current buffer and appends it to a named buffer
(default "Temp").  ^W withdraws # lines, W withdraws the marked text.  The
named buffer is created if it does not exist.
.def C
writes out all changed files in all buffers, prompting for a new name for
each file.  Typing ^G for a particular file will not write it out.  If #
is zero, existing names for files will be used with no prompting.
.def I
inserts the text of the named buffer at the cursor of the current buffer.  The
text is not removed from the named buffer.
.edef
.hdr "Multiple windows"
In addition to multiple buffers, it is also possible to have multiple windows.
Each window displays a single buffer, but different windows can display the
same buffer if desired.  Editing can only be done in one window at a time,
though other windows can be scrolled.  The "cursor" is a per buffer notion, not
a per window notion.
.para
One possible use of multiple windows is during compilation or formatting.  The
result of a ^\ command is saved in a buffer named "Result".  When you get error
messages, you can create a second window and display the Result buffer in it.
Then you can fix the errors in one window while scrolling to new error messages
in the other window.  This is often much more convenient than constantly
flipping back and forth with ^\A.
.para
The multiple window commands are under ^X^W.  There are commands for splitting
the current window and killing the current window, for moving to a new window,
for changing the size of existing windows, and for scrolling windows.  Windows
are kept in a ring structure, and several commands work on the basis of ring
order.

.def ^B
moves the bottom boundary of current window down # lines.  A negative # means
move up.  Fails on bottom window.
.def ^K
kills the current window (but not the buffer it displayed).  The new editing
window is the window above, if any, else the window below.  Space from the
killed window is added to the new editing window.  The cursor will be moved if
necessary to reside in the part of the buffer currently displayed in the new
editing window.
.def ^N
selects a new editing window by moving down (and around) # windows.  The cursor
will be moved if necessary to reside in the part of the buffer currently
displayed in that window.
.def ^P
selects a new editing window by moving up (and around) # windows.  The cursor
will be moved if necessary to reside in the part of the buffer currently
displayed in that window.
.def ^R
asks for a list of files, creates (if necessary) a buffer whose name is derived
from the list, reads the files into the buffer, splits the current window, and
displays the new buffer in the new, lower window.  The new window contains |#|
text lines if # is not 0 or 1, otherwise the current window is split in half.
The new window becomes the editing window.  If the buffer already exists and
has been modified, confirmation must be given.  For a single file
specification, the buffer name is the name.suffix pair of the file
specification.  For a list of file specifications, a new buffer is always
created, and will be "Main" followed by digits.
.def ^S
asks for a buffer name, creates a new empty buffer of that name if one does not
exist, splits the current window, and displays the named buffer in the new,
lower window.  The new window contains |#| text lines if # is not 0 or 1,
otherwise the current window is split in half.  The new window becomes the
editing window.
.def ^T
moves the top boundary of the current window up # lines.  A negative # means
move down.  Fails on the top window.
.def D
selects a new editing window by moving down (and around) # windows.  The part
of the buffer displayed in that window will be changed if necessary to include
the cursor.
.def N
scrolls the next window down (and around) by # lines if |#|~=1, or by a
screenful if |#|=1.  Does not move the cursor in any window, and does not
change windows.
.def P
scrolls the previous window up (and around) by # lines if |#|~=1, or by a
screenful if |#|=1.  Does not move the cursor in any window, and does not
change windows.
.def U
selects a new editing window by moving up (and around) # windows.  The part of
the buffer displayed in that window will be changed if necessary to include the
cursor.
.edef
.hdr "Incremental search"
Incremental search changes ^S so that it searches for a match dynamically as
you type the search string.  It is also useful for counting occurrences of a
string.
.para
^X^SS changes the search mode to incremental.  ^S starts incremental search in
Initial mode.  This displays a line at the bottom announcing incremental
search, and showing you the default.  You now have a number of options, based
on what character you type:

.def ^D
asks for a new default search string.
.def ^H
flips the search direction.
.def ^L
clears the screen and redisplays.
.def ^O
asks for a string and counts the number of occurrences of that string in the
rest of the buffer in the search direction.
.def ^S
searches forward for the default and enters Search mode.
.def ^U
reads a numeric argument as usual, to be applied to the next command whether or
not it exits incremental search.
.def ^Y
flips sense of whether case is ignored in searches.
.def CR
exits incremental search, leaving the cursor where it is.
.def ?
displays help.
.edef
.para
All other control characters (except ^I and ^J) exit incremental search and
execute normally.  Any other character becomes the first character of the
search string and enters Search mode.
.para
Once Search mode is entered, ^D and ^O no longer have their special meaning,
and ^H and ^Y additionally initiate a search.  The only new functions are:

.def ^?
(DEL) deletes # characters from the search string and restores the cursor and
search direction to their previous values.
.def ^G
exits incremental search if the search string is empty, else clears the search
string and restores the cursor and search direction to their initial values.
.edef
.para
As characters are typed in, they are added to the end of the search string, and
searching in the current direction is continued.  If the desired string is not
found, the bell is rung, and the character left in the search string, with an
indication that search failed.
.para
When incremental search is exited, the search default is set according to the
current search string if it is non-empty.
.hdr "Macros"
TED has a simple macro facility.  A macro is simply a string of characters;
executing a macro has basically the same effect as if you typed the characters
of the macro directly on the keyboard.  There are no conditional or iteration
constructs.  Commonly used sequences of commands can be turned into macros and
defined in your ".ted_init" file, and special macros can be defined on the fly.
.para
Macros can be given either string or character names.  A character-named macro
is defined by typing ^Y^@c (or ^U0^Yc), where 'c' is the character to be used
as the name of the macro, followed by the text of the macro.  The macro is
executed by typing ^Yc, where c is the character naming the macro.  ^U#^Yc,
with #>0, will execute the macro # times.  A string-named macro is defined by
typing ^X0^Y, followed by the macro name, followed by the macro body.  The
macro is executed by typing ^X^Y, followed by the macro name.  Typing ^X#^Y,
followed by the macro name, will execute the macro # times.
.para
During macro execution, an error (anything that would display an "Oops:..." at
the top of the screen) will cause the rest macro to be ignored.  This is also
true of failing searches in incremental search mode.
.para
You can also place a macro body in a file, and execute it via the ^X^X command.
The format of such a file is the same as your ".ted_init" file, i.e., newlines
are discarded, except that a blank line is converted to ^J.  Hence, a ^J must
be represented by two ^J's.
.hdr "Pattern matching"
In addition to searching for strings, TED has a pattern matching search
command, ^X^P.  There is also a command, ^^P, for scanning multiple files for a
pattern.  Within a pattern, it is possible to specify textual deletions,
substitutions, and insertions.  The grammar for a pattern is as follows:

.nf
.ne 7l
prim	::=	sequence of "normal" and quoted characters (^Q char)
	   |	^A | ^B | ^D  | ^F | ^J | ^L | ^P | ^X | ^Y | ^Z
	   |	^E^A | ^E^B | ^E^D | ^E^F | ^E^J | ^E^L | ^E^P | ^E^Y
	   |	^R char char  |  ^K char char  |  ^\ char ... char ^\
	   |	^V char
	   |	^T text [^T]
	   |	^U name [^U]
	   |	^[ pattern ^]
expr	::=	prim [^@ | ^^ | ^? | ^_]
.ne 4l
unit	::=	expr
	   |	expr ^S text [^S] [^@ | ^^ | ^? | ^_]
	   |	expr ^W char [^@ | ^^ | ^? | ^_]
	   |	expr ^G macro-body ^G [^@ | ^^ | ^? | ^_]
	   |	^N unit
group	::=	unit [group]
pattern	::=	group [^O pattern]
.fi
.para
Things in square brackets ([]) are optional.  All special characters are
defined below.  All other characters are "normal" characters.  Normal
characters match themselves.  In addition, the case flag for searches also
applies to normal characters.

.def ^A
matches any alphanumeric character (0-9, A-Z, _, a-z).
.def ^B
matches any blank character (space, tab).
.def ^D
matches any digit (0-9).
.def ^E
can be followed by one of (^A, ^B, ^D, ^F, ^J, ^L, ^P, ^Y), and matches any
character not in the range specified by that character.  For example, ^E^Y will
match only newline.
.def ^F
matches any formatting characters (space, tab, formfeed, newline).
.def ^G
specifies arbitrary actions to be performed on the part of the buffer matching
the previous pattern, in the form of a sequence of characters to be executed
just as if they were typed from the terminal.  A ^G within the macro-body must
be quoted with a ^Q, which will not be removed.  Note that the macro-body will
not be executed unless the overall pattern matches, and in no way affects the
success or failure of matching.  The macro-body is executed on a separate
buffer containing the match, with the cursor initially at the start of the
buffer and the mark at the end of the buffer.  The contents of this buffer will
be used to replace the match.  Note that the macro-body need not modify the
buffer; it could, for example, copy the buffer to the end of some other buffer.
The macro-body should not generate any errors.  If an error does occur within
the macro-body, the rest of the macro-body will be ignored, and you will be
left in a restricted buffer named Pattern.  You should then type ^^ to
continue.
.def ^J
matches itself, the newline character.  Note that newline is not considered a
text character, and must be quoted inside ^S and ^T text strings.
.def ^K
matches any character not in the range specified by the next two characters.
For example, ^Kab would match any character except 'a' and 'b'.  The range must
be specified with the smallest character first.
.def ^L
matches any "letter" (A-Z, _, a-z).
.def ^N
NOT construct.  This will not actually match anything.  It simply guarantees
that the following pattern will not match at this point.  Note that any text
deletion or insertion specified within this construct will be ignored.
.def ^O
separates elements of an OR construct.  The elements of an OR construct are
tried in parallel for the "closest" match.  The possible matches for a
particular element are always tried in order.  The possible matches for all
elements are shuffled such that a match M from element E is tried before a
match M' from element E' if and only if M is at least as close as M' and E is
less than E'.  Closeness is determined by the starting position of the match.
Thus, if the OR construct must match the immediately following text, the
elements are simply tried in order.
.def ^P
matches any punctuation (non-alphanumeric) character except newline.
.def ^Q
quotes the next character for use as a text character.  For example, ^Q^Q will
match the character ^Q.  Quoting can also be done inside ^G, ^S, ^T, and ^U
arguments.
.def ^R
matches any character in the range specified by the next two characters.  For
example, ^R^@^_ matches any control character.
.def ^S
substitutes text for the part of the buffer matching the previous pattern.  The
text can be explicitly terminated with ^S, but will be terminated implicitly by
any other special character except ^Q.  Note that no substitutions occur unless
the overall pattern matches.  Substitutions in no way affect the success or
failure of matching.
.def ^T
inserts text into the buffer.  The text can be explicitly terminated with ^T,
but will be terminated implicitly by any other special character except ^Q.
Note that no insertions occur unless the overall pattern matches.  Insertions
in no way affect the success or failure of matching.
.def ^U
matches the string which is the value of the named string environment variable.
If no such variable exists, or is not a string variable, then matches the empty
string.  The variable name can be explicitly terminated with ^U, but will be
terminated implicitly by any other special character except ^Q.
.def ^V
inserts the last partial match saved under the label defined by the next
character.  If no match has been saved, the overall pattern is aborted.
.def ^W
deletes and saves the part of the buffer matching the previous pattern under
the label defined by the next character.  The text can then be inserted using
^V with the same character as the label.  Any character can be used as a label.
Note that no deletions occur unless the overall pattern matches.  Deletions in
no way affect the success of failure of matching.
.def ^X
matches any character.
.def ^Y
matches any character except newline.
.def ^Z
matches the end of the buffer.
.def ^@
P^@ matches smallest possible sequence of the pattern P.  That is, the patterns
<empty>, P, PP, PPP, PPPP, ...  are tried in order for the first match that
allows the overall pattern to match.  For example, ^Y^@ can be used to specify
that the remainder of the overall pattern must start matching somewhere on the
current line.  ^X^@ can be used to specify that the remainder of the overall
pattern can start matching arbitrarily far forward in the buffer.
.def ^^
P^^ matches smallest possible non-empty sequence of the pattern P.  That is,
the patterns P, PP, PPP, PPPP, ...  are tried in order for the first match that
allows the overall pattern to match.  P^^ is equivalent to ^[^[P^]P^@^].
.def ^?
(DEL) P^? matches the largest sequence of the pattern P.  P^? will match
either the longest sequence of P's, or the empty string, but nothing else.  For
example, ^Y^? will match the rest of the line, and ^X^? will match the rest
of the buffer.  In situations where ^? and ^@ could both be used, ^? is much
more efficient.
.def ^_
P^_ matches the largest non-empty sequence of the pattern P.  P^_ will match
only the longest sequence of P's.  P^_ is equivalent to ^[^[P^]P^?^].  In
situations where ^_ and ^^ could both be used, ^_ is much more efficient.
.def "^\ ^\"
delimits a set of characters; matches any character in the set.  For example,
^\+-*/^\ matches '+', '-', '*', or '/'.
.def "^[ ^]"
are parentheses used to delimit patterns.  Used when the normal precedence is
not sufficient.
.edef
.para
Overall, pattern matching retry is performed depth first, right to left.  For
example, matching the pattern ^[A^OB^]^[X^OY^] would involve, for each match of
^[A^O^B^], trying all possible matches of ^[X^OY^].
.para
^X^P with a positive argument will always add a prefix of ^X^@ (i.e., the match
can start arbitrarily far forward in the buffer), and will search # times.
^X^P with a negative argument will always force the match to start at the
cursor, and will search |#| times.
.para
^X0^P can be used to turn on/off buffer change confirmation.  When turned on,
every change to the buffer made under pattern search will have to be confirmed.
.para
Beware that it is quite easy to specify patterns that will go either
indefinitely or for a very long time before failing or matching the empty
string at the end of the buffer.  ^G can be used to abort long pattern
searches, but you may have to wait a bit before the ^G will be noticed.
.para
As an example of the use of pattern matching, the following pattern, when
searched via ^X^P, will change the buffer to single spacing:
.para
^[^J^J^_^S^X^@^]^?
.para
The following pattern, when searched via ^X-^P, will delete all lines not
containing the string "begin_list" or the string "end_list" (providing the
first line does not contain either string):
.para
^[^[^X^@^J^]^S^Y^@^[begin_list^Oend_list^]^Y^?^J^]^?^X^?^S
.para
The following pattern, when searched via ^X^P, will change the next occurrence
of
	if <expr1> cor <expr2>
.br
as a complete single line with arbitrary spacing to
	if <expr2> cand <expr1>
.br
with the same spacing:
.para
^B^?if^B^_^Y^^^W1^[^B^_cor^Scand^B^_^]^W2^Y^_^V2^V1
.hdr "Pattern matching summary"
.nf
^A	alphanumeric (0-9, A-Z, _, a-z)
^B	blank (space, tab)
^D	digit (0-9)
^E	exclusive of (^A, ^B, ^D, ^F, ^J, ^L, ^P, ^Y)
^F	format (space, tab, formfeed, newline)
^G	execute macro-body
^J	newline
^K	exclusive of range
^L	letter (A-Z, _, a-z)
^N	not
^O	or
^P	punctuation (non-alphanumeric/non-newline)
^Q	quote
^R	range
^S	substitute text
^T	insert text
^U	variable value
^V	insert text saved under label
^W	withdraw and save text under label
^X	any char
^Y	non-newline
^Z	end of buffer
^@	zero or more
^^	one or more
^_	all in a row
^?	all in a row or none
^\ ^\	char set
^[ ^]	parentheses
.hdr "Sorting"
The ^XX command performs a TECO-like sort of the current file of the buffer.
The file is divided into records of arbitrary length, each of which contains a
sort key, again of arbitrary length and positioned anywhere within the record.
The records may be sorted in increasing lexicographic order with ^XX, or in
decreasing order with ^X-X.  Case distinctions are ignored if the search flag
is set to ignore case.  The sort is stable (i.e., records with equal keys will
remain in the same relative order), so multi-key sorting can be accomplished by
sorting a key at a time, least significant key first.
.para
Records and keys are determined using three command strings, given as arguments
to the sort command.  The first command string is executed to get from the
start of the current record to the start of its key.  The sort will be aborted
if this command string generates any errors.  The second command string is
executed to get from the start of the key to the end of the key (i.e., one
character beyond the end of the key).  In a failing string or pattern search,
the end of the key (and the end of the record) is assumed to be the end of the
file; any other errors will abort the sort.  The third command string is
executed to get from the end of the key to the start of the next record (and is
only executed if the previous command string did not generate an error).  In a
failing string or pattern search, the end of the record is assumed to be the
end of the file; any other errors will abort the sort.
.para
The start of the first record is assumed to be the start of the file.  The
command strings are repeatedly executed until the entire file has been divided
into records.  The command strings can contain arbitrary commands.  The
defaults are (1) the empty string, meaning the key starts at the beginning of
the record, (2) ^E, meaning the end of the key is the end of the first line of
the record, and (3) ^F, meaning the start of the next record is the start of
the next line.  This gives a line by line sort of the file.
.para
Sorting part of a file can be done using the restricted buffer option, ^XR.
.hdr "Miscellaneous options"
String and file name arguments normally appear at the bottom of the current
window.  Setting the "arg_display_mode" number variable to a non-zero value
will force these arguments to always appear at the bottom of the screen.  The
size of the argument window is normally 2 lines.  This can be controlled with
the "arg_display_size" number variable.
.para
Help displays (from ^H and ?) and ^\ result displays normally occupy the entire
screen.  Setting the "sub_display_mode" number variable to 1 will cause only
the current window to be used.  Setting the variable to 2 will cause the larger
of the two areas above and below the current window to be used, or the entire
screen if there is only one window.  Setting the variable to 3 or higher will
cause that many lines at the bottom of the screen to be used.  Setting the
variable to 0 or a negative value will restore the use of the full screen.
.para
You can check the spelling of a word with ^XW.  The default argument is the
word containing the cursor, or the word to the left of the cursor if the cursor
is between words.  If the word appears to be misspelled, a list of suggested
spellings will be displayed at the top of the screen.  Spelling is checked
using ISPELL.  The ISPELL process is normally kept around for subsequent
spelling checks, but may be killed off with the ^X0W command.
.para
^_D will delete a list of files with a yes/no confirmation on each file, ^_0D
will delete a list of files without confirmation, ^_L will make a link to a
file, ^_S will make a symbolic link to a file, ^_M will change the mode of a
list of files, and ^_R will rename a file.
.para
^VT displays the current date and time, and ^V0T inserts the current date and
time into the buffer. ^V^T displays the total CPU time used by TED so far,
and the CPU time used since the last ^V^T command.
.para
The restricted buffer option (^XR) gives you the piece of the current buffer
between the mark and the cursor as a separate buffer to work on.  The changes
get reflected in the original buffer when you exit (via ^^) from this mode.
.para
There is an alternate mode for ^K, settable via ^X^K, that will only delete to
the end of the line (not through it), unless you are already at the end of the
line or #~=1.  There are alternate modes for ^N and ^P, settable via ^XM, that
place the cursor after leading spaces and tabs in the line, a mode for trying
to stay at a fixed column position, and a mode for trying to stay at the column
you were at before the last sequence of ^N and ^P commands.
.para
There is a mode for text type-in (^XO) that will overwrite characters in the
buffer, rather than inserting characters into the buffer.  Type-in
automatically reverts to insertion mode when at the end of a line.  Newlines
never overwrite characters; they are always inserted.
.para
There is a mode for making simple straight line drawings (^X^D).  To draw a
line, move the cursor (with ^A, ^E, ^F, ^B, ^N, ^P, ^Z) to the starting point
and set the mark with ^T.  Then move the cursor to the ending point and type
the printing character (octal 40 to 176) you want to draw the line with.  This
will draw a line from the mark to the cursor, and set the mark to be the end of
the line.  To erase a line, just redraw the line with a blank.  Drawing a line
will overwrite previous characters unless you type ^U before typing the
printing character.
.para
There is a command for drawing a box around a group of lines (^XB).  The box
can be centered or indented a fixed amount from the left.  The shape of the box
is controlled by various "box_*" string and number variables.
.para
^XCU and ^XCL change the case of the marked to text to upper and lower case,
respectively.  ^XCC capitalizes the first letter of every word in the marked
text.
.para
The meanings of the RED and BLUE function keys on Heaths and VT52s can be
swapped with ^XE.
.para
New mail can be tested for with ^X^M.
.para
^X#^R will force the # line down (up if negative) from the current (with
respect to where the cursor ought to be, not with respect to where it really
is) line to be redisplayed, and correctly repositions the cursor.  This can be
used to clean up lines that have been garbled by system messages or a noisy
terminal line, and is particularly useful over a slow terminal line.
.para
When editing over a slow line where the system does not know the line speed,
^XT#B can be used to inform TED that the line speed is # baud.  This will
automatically adjust padding appropriately.  This number will only be used when
the system does not know the line speed.  You can turn padding off with ^XT0P,
and you can prevent TED from using full screen scrolling and insert/delete line
with ^XT0S, although you should never have to do either of these.  You can tell
TED your terminal has a meta key with ^XTM, or doesn't have a meta key with
^XT0M; this controls whether the high bit of each character typed gets masked.
Again, you should never have to do either of these, as the termcap entry should
define this.
.para
The default position of the cursor on redisplay is 75% up from the bottom of
the window.  This percentage can be set with the ^V#^ command, with #<0
restoring the default.  When displaying the end of the buffer, the default is
to keep the window 70% blank.  This percentage can be set with the ^V#%
command, with #<0 restoring the default.  When the cursor moves outside the
current window, the default is to choose a new window around the cursor based
on the above percentages.  However, the ^V#= command can be used to alter this,
so that the window will instead be scrolled until the cursor comes into view
(at the top or bottom), provided that # percent of the original window will
remain on the screen.  ^V#= with #<0 restores the default (100%).
.para
You can create your own help file, to be displayed with the ^U^H command.  The
string variable "help_file" defines the name of this file, the default being
"~/.ted_hlp".  The file can be either a simple text file or a menu-driven file.
For a menu-driven file, the first line must start with "****`Menu`for`".  The
following lines, up to the next line starting with "****`Menu`for`", make up
the menu.  Each line of the menu consists of one or more menu items, separated
by tabs.  Each menu item consists of an upper-case letter (for selection)
followed by a colon and a space, followed by the name of the selection (e.g.,
"Multiple`buffers").  The body of the selection is placed anywhere in the file,
beginning and ending with a line of the form "****`N`****", where N is the name
of the selection.
.para
The ^X#Z command can be used to control the frequency of garbage collections,
setting a GC to go off every 2**(#-4) megabytes.
.hdr "TED variables"
The following list names the TED variables, their types, and what they are used
for.  Number and string variables can be set by ^XN and ^XS, respectively.

.ne 6l
.nf
.de k
. if lpt
(18)
. ef
(25)
. en
.em
.de u
. if lpt
(25)
. ef
(35)
. en
.em
Namek!Typeu!Usage

adjust_widthk!Nu!width to use in adjusting text (^]W).
.ne 2l
arg_display_modek!Nu!N=0: string arguments at bottom of current window.
u!N~=0: string arguments at bottom of screen.
arg_display_sizek!Nu!string argument window size.
backup_namek!Su!directory and extension for backup file names (^W).
binary_suffixk!Su!default suffix for compiled binaries (^\U*M,L).
binary_dirk!Su!default directory for compiled binaries (^\U*M,L).
box_hspacek!Nu!space between sides and text of box (^XB).
.ne 2l
box_hwidthk!Nu!N<0: fill field if centered box (^XB).
u!N>=0: width of sides of box (^XB).
.ne 2l
box_indentk!Nu!N<0: center box in field of -N (^XB).
u!N>=0: indent box N from left (^XB).
box_stringk!Su!string to draw box with (^XB).
box_vspacek!Nu!lines between top/bottom and text of box (^XB).
box_vwidthk!Nu!width of top/bottom of box (^XB).
carefulk!Nu!N~=0: confirm if buffers modified (^C).
change_limitk!Nu!# of changes to buffer between saves.
comment_sepk!Su!placed between comment symbol and comment (^]C).
compiler_namek!Su!name of compiler (^\).
defaultk!Su!default for string/filename arguments.
default_forkk!Su!default program name (^J).
esc-*k!Su!escape sequence redefinitions (ESC ESC).
.ne 2l
exit_msgk!Nu!N~=0: clear screen & type message when exiting (^C).
u!N=0: leave as much text on screen as possible (^C).
fill_prefixk!Su!fill prefix to use in auto-break mode (^]A).
help_filek!Su!user-defined help file (^U^H).
help_queryk!Nu!N~=0: confirm help request (^H,^U^H).
hostk!Su!host name.
ignore_casek!Nu!N=0: upper/lower case matters in searches (^U0^S).
justifyk!Nu!N~=0: justify right margin (^]J).
keep_countk!Nu!# of old versions to keep, #<0: includes oldest (^W).
keypadk!Nu!N~=0: should be in alternate keypad mode (^[H).
last_argk!Su!last string/filename arg (^VG).
last_resultk!Su!name of last result buffer from ^\ command.
list_charsk!Su!list and literal delimiters (^X^Z).
mail_boxk!Su!name of spooled mail file (^X^M).
mail_namek!Su!name of mail program (^\S).
max_widthk!Nu!maximum width of non-long lines (^V!).
no_fill_startersk!Su!initial chars on line that inhibit adjusting (^]).
pausek!Nu!N~=0: pause at inferior termination (^J).
pconfirmk!Nu!N~=0: confirm pattern search buffer changes (^X0^P).
pindentk!Nu!N~=0: indented lines start new paragraphs (^]).
progy_namek!Su!name of program to run under ^\Y.
progz_namek!Su!name of program to run under ^\Z.
psearchk!Su!last pattern search string (^X^P).
r_namek!Su!name to use for R (^\).
save_filek!Su!save file name.
save_modek!Nu!octal mode bits for save file (^U^L).
scribe_namek!Su!name to use for Scribe (^\).
searchk!Su!default search object (^S).
.ne 4l
sub_display_modek!Nu!N<=0: help and ^\ results use entire screen.
u!N=1: use current window.
u!N=2: use largest area above or below current window.
u!N>2: use bottom N lines of screen.
terminalk!Su!terminal name.
umaskk!Nu!octal umask for inferior processes (^\,^J).
word_charsk!Su!special chars included in words.
write_checkk!Nu!check when using long file names (^W).
write_modek!Nu!octal mode bits for new files (^W).
write_stylek!Nu!backup-on-write mode (^W,^X^C).
^X^Y-*k!Su!macro definitions (^X^Y).
^Y-*k!Su!macro definitions (^Y).
.hdr "Indenter variables"
Indenter variables can be set via ^XI.  All variables can be reset to their
default values via ^XI*.  The CLU variables are:

.ne 6l
.nf
Name		Value		Indents when starting line (unless noted)

begin_body	4		BEGIN-END body
.ne 4l
bracket		4		(,{,[ if starts line but does not start expr
				elts of () {} [] if first element starts line
				right side of :=
close_bracket	1		),},] if starts line
.ne 2l
cluster_body	4		CLUSTER body
				Argus: GUARDIAN
do		2		DO
elseif		1		ELSEIF
end		0		END (0: indent END, ~0: don't indent END)
except		3		EXCEPT
for_body	4		FOR body
head		2		RETURNS, SIGNALS, YIELDS
.ne 2l
is		8		IS
				Argus: HANDLES
op		2		infix operators
.ne 2l
routine_body	4		PROC, ITER body
				Argus: CREATOR, HANDLER, BACKGROUND, RECOVER
.ne 2l
tag		3		TAG
				Argus: WTAG
.ne 2l
tag_body	4		TAG body
				Argus: WTAG
then		3		THEN
.ne 2l
then_body	5		THEN body (if THEN also starts line)
				ELSE body
thenx_body	3		THEN body (if THEN does not start line)
when		3		WHEN
when_body	5		WHEN body
where		8		WHERE
while_body	4		WHILE body

The additional variables for Argus are:

.ne 6l
.nf
Name		Value		Indents when starting line (unless noted)

argus		0		indenter mode (0: CLU, ~0: Argus)
coenter_body	4		coarm body (if first coarm key starts line)
coenter_key	4		ACTION, TOPACTION, PROCESS
.ne 2l
coenterx_body	4		coarm body
				(if first coenter_key does not start line)
enter_body	4		ENTER body (if enter key starts line)
enter_key	4		ACTION, TOPACTION
enterx_body	4		ENTER body (if enter_key does not start line)
foreach		7		FOREACH
seize_body	4		SEIZE body

A negative indentation step value means "go to next tab stop".
.hdr "File names/backup/protection"
TED accepts ~-form directory specifications and does *-matching.  However,
*-matching is a little different than the way the shell does it, in that "."
and ".." are always ignored but other entries beginning with period are not
ignored.
.para
You can define path name abbreviations with string variables.  In file name and
directory arguments, a prefix ending with two slashes (//) is taken to be the
name of a string variable, and is replaced by the value of the variable.  For
example, if the string variable "man1//" is defined to be "/usr/man/man1/",
then the file name "man1//csh.1" becomes "/usr/man/man1/csh.1".  In ^\J, ^\M,
^\R, ^\Y, ^\Z, and ^J command lines, words ending with two slashes are also
expanded this way.
.para
Since Unix does not support version numbers, there are a number of different
ways of creating backup files when files are written.  The particular method is
set by the ^X^C command.  The options are (N) do not create a backup, and
(over)write directly to the file, (T) do not create a backup, but write to a
temporary file and then rename it (R) always rename the current version of the
file, (^R) rename the current version of the file if a backup does not exist,
otherwise (over)write directly, (^T) rename the current version of the file if
a backup does not exist, otherwise write to a temporary file and then rename
it, (C) always copy the current version of the file before (over)writing
directly, (^C) copy the current version of the file if a backup does not exist
before (over)writing directly, (X) rename the current version of the file
unless there are links to it, in which case copy the current version, and then
(over)write directly, and (^X) if a backup does not exist, rename the current
version of the file unless there are links to it, in which case copy the
current version, and then (over)write directly.  The initial mode is N.  The
name of the backup file generally is obtained by appending the value of the
"backup_name" string variable to the current file name, with the default being
".old".  However, the current file name may have to be truncated before
appending if the new name exceeds 255 characters.  Also, "backup_name" may
contain a (possibly relative) directory where the backup file should be placed.
So "backup_name" should have one of the forms "str", "dir/str", or "dir/".
.para
If the backup file extension is ".^V", then version numbered backup files are
maintained.  When version numbering, the backup-on-write modes ^R, ^T, ^C, and
^X are equivalent to R, T, C, and X respectively.  The "keep_count" number
variable specifies how many backup versions to maintain, with default value 1.
If "keep_count" is N, the N highest versions are kept.  If "keep_count" is -N,
then the oldest version and the N-1 highest versions are kept.
.para
When writing to a file, if you specify a name longer than 255 characters, the
number variable "write_check" controls what happens.  If the variable is 0 (the
default), the name is truncated in the usual way.  If the variable is negative,
the file is not written and an error message is generated.  If the variable is
positive, the part before the first dot is truncated, unless the part after the
first dot is longer than 254 characters, in which case the file is not written
and an error message is generated.
.para
The mode bits for new files are given by the "write_mode" octal number
variable, the default being 666 masked by the initial umask.  The umask is then
cleared, but its value is saved in the "umask" octal number variable, for use
when running inferiors.  The mode bits for ted save files is given by the
"save_mode" octal number variable, with the default being 600.
.hdr "XTED features"
This section is for those using the version of TED that runs under the
X window system.
.para
The following are options that can be specified at the beginning of the
command line when starting an XTED:
	-fn=FONT
	[-HOST]:DISPLAY
	=[WIDTH][xHEIGHT][{+-}XOFF[{+-}YOFF]]
	-rv       (reverse video)
	-i        (miniature icon)
	-fg=COLOR     (text color)
	-bg=COLOR     (background color)
	-cr=COLOR     (text cursor color)
	-hl=COLOR     (highlight color)
	-ms=COLOR     (mouse cursor color)
.para
The []'s denote optional stuff, the {}'s surround alternatives.  The default
font is 8x13, the default display is controlled by the DISPLAY environment
variable.  WIDTH and HEIGHT are in number of characters, XOFF and YOFF are in
pixels.  WIDTH defaults to 80, HEIGHT to 24, XOFF and YOFF to 1.  If you don't
give XOFF and/or YOFF, then you must use the mouse to create the window.
Pressing left button will give you a WIDTHxHEIGHT window that you can then move
around to place until you release the button.  Pressing the right button gives
you a window WIDTH wide and to the bottom of the screen.  Pressing the middle
button defines one corner of the window, releasing the button defines the
opposite corner.  If you give XOFF and/or YOFF, then a WIDTHxHEIGHT window will
automatically be creating without intervention.  XOFF and YOFF specify deltas
from a corner of the screen to the corresponding corner of the window, as
follows:
	+XOFF+YOFF(25)upper left to upper left
	-XOFF+YOFF(25)upper right to upper right
	+XOFF-YOFF(25)lower left to lower left
	-XOFF-YOFF(25)lower right to lower right
.para
The following options are also read from the .Xdefaults file: BodyFont,
BorderWidth, ReverseVideo, Foreground, Background, Cursor, Highlight, and
Mouse.
.para
The ^C command does not suspend XTED, as suspending is useless.  Instead, ^C
should be typed after resizing the window, to reconfigure things.  (Someday
maybe this will be automatic.)
.para
The ^J command for interactive programs does not exist: run them in another
window!
.para
The command ^XT0C will change the window to white text on a black background.
The command ^XTC restores the window to black text on a white background.
.para
The escape sequences generated by mouse button events are as follows:

.def &l
left-down
.def &L
left-up
.def &a
CONTROL-left-down
.def &A
CONTROL-left-up
.def &b
SHIFT-left-down
.def &B
SHIFT-left-up
.def &d
META-left-down
.def &D
META-left-up
.def &e
CONTROL-SHIFT-left-down
.def &E
CONTROL-SHIFT-left-up
.def &f
META-SHIFT-left-down
.def &F
META-SHIFT-left-up
.def &g
CONTROL-META-left-down
.def &G
CONTROL-META-left-up
.edef
.sp
.def &m
middle-down
.def &M
middle-up
.def &h
CONTROL-middle-down
.def &H
CONTROL-middle-up
.def &i
SHIFT-middle-down
.def &I
SHIFT-middle-up
.def &j
META-middle-down
.def &J
META-middle-up
.def &k
CONTROL-SHIFT-middle-down
.def &K
CONTROL-SHIFT-middle-up
.def &n
META-SHIFT-middle-down
.def &N
META-SHIFT-middle-up
.def &o
CONTROL-META-middle-down
.def &O
CONTROL-META-middle-up
.edef
.sp
.def &r
right-down
.def &R
right-up
.def &p
CONTROL-right-down
.def &P
CONTROL-right-up
.def &q
SHIFT-right-down
.def &Q
SHIFT-right-up
.def &s
META-right-down
.def &S
META-right-up
.def &u
CONTROL-SHIFT-right-down
.def &U
CONTROL-SHIFT-right-up
.def &v
META-SHIFT-right-down
.def &V
META-SHIFT-right-up
.def &x
CONTROL-META-right-down
.def &X
CONTROL-META-right-up
.edef
.para
Note that META-L is shown as &L, etc.  (On a VS100 keyboard, the Symbol key is
the META key, so for example you type META-l by holding down the Symbol key and
pressing the L key, and META-L by holding down the Shift key and the Symbol key
and pressing the L key.)
.para
The default action for these escape sequences is to do nothing, but you can
define them as any sequence of characters in the same way you would (re)define
any escape sequence.  Additional escape sequences are available for defining
the buttons:
.def &c
scrolls the window so that the cursor ends up on the same line as the
last/current button event.  This line must be within the same window as the
cursor or an error will result.
.def &C
sets the cursor to the position of the last/current button event.  This
position must be within the same window as the cursor or an error will result.
.def &t
turns on tracking of the mouse and highlighting of the text between the cursor
and the mouse if #>0, and turns tracking off if #<=0.  Highlighting is
performed by underlining if #=1, and by inverse video if #>1.
.def &T
sets the mark to the position of the last/current button event.  This position
must be within the same window as the cursor or an error will result.
.def &w
is equivalent to doing a ^X^W#D into the window containing the last/current
button event position.  This position must be within some window or an error
will result.
.def &W
is equivalent to doing a ^X^W#^N into the window containing the last/current
button event position.  This position must be within some window or an error
will result.
.def &Y
inserts the window system global cut buffer |#| times at the cursor (#<0
inserts before the cursor
.def &z
stores the current saved text in the window system global cut buffer.
.def &Z
stores the current deleted text in the window system global cut buffer.
.edef
.para
For example, with the following lines in your .ted_init, you can delete a
highlighted region of text by placing the mouse on the first character of the
text, pressing the left button down, moving to just after the last character of
the text, and raising the button:

^[^[&l^Q^[^Q&W^Q^[^Q&C^Q^[^Q&t^M
.br
^[^[&L^Q^U0^Q^[^Q&t^Q^[^Q&T^Q^VW^M

.para
By default, the various function and keypad keys transmit the following
characters.  Note that the character META-c as a command gets interpreted the
same as the sequence "ESC c".
.sp
.nf
F1	&X
F2	&T
F3	&U
F4	&V
F5	&W
F6	&a
F7	&b
F8	&c
F9	&d
F10	&e
F11	esc
F12	^H
F13	^J
F17	&f
F18	&g
F19	&h
F20	&i
E1	&1
E2	&2
E3	&3
E4	&4
E5	&5
E6	&6
,	&l
-	&m
.	&n
0	&p
1	&q
2	&r
3	&s
4	&t
5	&u
6	&v
7	&w
8	&x
9	&y
UP	&A
DOWN	&B
RIGHT	&C
LEFT	&D
ENTER	&M
PF1	&P
PF2	&Q
PF3	&R
PF4	&S
.hdr