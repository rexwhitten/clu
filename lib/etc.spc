_anyize = proc [t: type] (x: t) returns (any)
	% create an ANY
	end _anyize

_change_mode = proc (fn: file_name, mode: int) signals (not_possible(string))
	% change file mode word
	end _change_mode

_change_signal = proc (sig: int, label: int) returns (int)
					     signals (not_possible(string))
	% change action for given signal (interrupt), return old action
	end _change_signal

_cvt = proc [from, to: type] (x: from) returns (to)
	% fake compiler out as to type of object (use with great care!)
	end _cvt

_dir_ent_size = proc () returns (int)
	% returns maximum size of a file name component
	end _dir_ent_size

_dtable_size = proc () returns (int)
	% returns maximum number of open files
	end _dtable_size

_environ = proc (name: string) returns (string) signals (not_found)
	% return environment variable
	end _environ

_ernum = proc(msg: string) returns (int) signals(not_found)
	% return error code for given error string
	end _ernum

_erstr = proc (num: int) returns (string)
	% return error string for given error code
	end _erstr

_exit = proc (status: int)
	% _cleanup_() and terminate process with particular status
	end _exit

_file_access = proc (fs: string, mode: int) returns (bool)
	% determine file accessibility
	% OR of read = 4, write = 2, execute = 1, existence = 0
	end _file_access

_file_exists = proc (fs: string, ftype: int) returns (bool)
					     signals (not_possible(string))
	% test if file is of given type
	% directory = 4, char special = 2, block special = 6, regular = 8
	% multiplexed char special = 3, multiplexed block special = 7
	end _file_exists

_file_facts = proc (fn: file_name) returns (int, int)
				   signals (not_possible(string))
	% return number of links, file mode of given file
	end _file_facts

_file_owner = proc (fn: file_name) returns (int, int)
				   signals (not_possible(string))
	% return user id and group id of given file
	end _file_owner

_free_space = proc () returns (int)
	% number of free (long) words left in heap
	end _free_space

_get_gid = proc () returns (int, int)
	% real group ID, effective group ID
	end _get_gid

_get_pid = proc () returns (int)
	% process ID
	end _get_pid

_get_pname = proc () returns (string)
	% return program name with directory, if any
	end _get_pname

_get_priority = proc (which, who: int) returns (int)
				       signals (not_possible(string))
	% do getpriority Unix system call
	end _get_priority

_get_runtime = proc () returns (int, int, int)
	% return seconds, milliseconds, microseconds of user+system time
	% for current process
	end _get_runtime

_get_uid = proc () returns (int, int)
	% real user ID, effective user ID
	end _get_uid

_get_version = proc () returns (int)
	% return program version number (set by #version option of LINK)
	end _get_version

_get_xjname = proc () returns (string)
	% return program name with directory removed
	end _get_xjname

_groups = proc () returns (sequence[int])
	% returns group access list
	end _groups

_heap_size = proc () returns (int)
	% current size of heap in (long) words
	end _heap_size

_host_id = proc () returns (int, int)
	% returns upper and lower halves of host id
	end _host_id

_host_name = proc () returns (string)
	% returns host name
	end _host_name

_ioctl = proc [t: type] (fdesc, reqh, reql: int, argp: t, disp: int)
						signals (not_possible(string))
	% issue REQ ioctl on given file descriptor with given argument(s)
	% REQ is given in halves, high and low
	% if ARGP is not an int, DISP should generally be 4
	end _ioctl

_lstat = proc (fn: file_name, buf: _wordvec)
					signals (bounds, not_possible(string))
	% do lstat Unix system call placing result in buf
	end _lstat

_page_size = proc () returns (int)
	% returns system page size in bytes
	end _page_size

_pause = proc ()
	% wait for signal (interrupt)
	end _pause

_read_link = proc (fn: file_name, buf: _bytevec) returns (int)
						 signals (not_possible(string))
	% read value of symbolic link into buf
	% returns number of characters read
	end _read_link

_real_time = proc () returns (int)
	% return real time in milliseconds since unknown event in past
	end _real_time

_round_real = proc (digs: _bytevec, num: int) returns (int, int)
	% round DIGS to NUM digits
	% used by e_form, f_form, g_form
	end _round_real

_rusage = proc (who: int, buf: _wordvec) signals (bounds, not_possible(string))
	% do getrusage Unix system call, placing result in buf
	end _rusage

_select = proc (cnt, reads, writes, excepts, millis: int)
						returns (int, int, int, int)
						signals (not_possible(string))
	% do select Unix system call
	% returns (number found, read mask, write mask, except mask)
	end _select

_set_alarm = proc (secs: int) returns (bool)
	% set alarm interrupt to go off in SECS seconds real time
	% (0 => no alarm)
	% cancels any previous alarm
	% returns true if alarm has gone off since last call
	end _set_alarm

_set_limit = proc (resource, value: int) signals (not_possible(string))
	% set soft resource limit via setrlimit Unix system call.
	end _set_limit

_set_priority = proc (which, who: int) returns (int)
				       signals (not_possible(string))
	% do setpriority Unix system call
	end _set_priority

_sleep = proc (millis: int)
	% sleep for MILLIS milliseconds.
	end _sleep

_stat = proc (fn: file_name, buf: _wordvec)
					signals (bounds, not_possible(string))
	% do stat Unix system call placing result in buf
	end _stat

_stop = proc ()
	% force SIGTSTP signal (interrupt) on this process
	% to stop in a continuable fashion
	end _stop

_system_root = proc () returns (string)
	% returns CLU system root directory name (no trailing slash)
	end _system_root

_umask = proc (mask: int) returns (int) signals (not_possible(string))
	% set umask and return previous value
	end _umask

_unparse_real = proc (x: real) returns (bool, _bytevec, int)
	% returns sign, digits, exponent
	% used by e_form, f_form, g_form
	end _unparse_real

create_directory = proc (fn: file_name, mode: int)
						signals (not_possible(string))
	end create_directory

delete_directory = proc (fn: file_name) signals (not_possible(string))
	end delete_directory

exp = proc (x: real) returns (real) signals (overflow, underflow)
	% e**X
	end exp

gc = proc () returns (int)
	% returns number of (long) words reclaimed
	end gc

get_argv = proc () returns (sequence[string])
	% returns command line arguments, not including program name
	end get_argv

get_jcl = proc () returns (string)
	% returns command line, not including program name, first time called
	end get_jcl

host_address = proc (host: string) returns (int, int)
		 signals (not_found, bad_address)
    % returns upper and lower halves of host address
    end host_address

istream2chan = proc (ist: istream) returns (_chan) signals (not_possible(string))
	% get the _chan out of an istream
	end istream2chan

link_file = proc (ofn, nfn: file_name) signals (not_possible(string))
	% make NFN a link to OFN
	end link_file

log = proc (x: real) returns (real) signals (undefined)
	% natural logarithm
	end log

set_connected_dir = proc (s: string) signals (bad_format, not_possible(string))
	% change connected directory
	end set_connected_dir

sleep = proc (secs: int)
	% sleep for SECS seconds
	end sleep

sqrt = proc (x: real) returns (real) signals (complex_result)
	% square root
	end sqrt

stream2chan = proc (st: stream) returns (_chan) signals (not_possible(string))
	% get the _chan out of a stream
	end stream2chan

symlink_file = proc (ofn, nfn: file_name) signals (not_possible(string))
	% make NFN a link to OFN
	end symlink_file
