%;; Copyright 1984, 1989 Massachusetts Institute of Technology

_set_trace_to = proc (rtn_addr: _obj)
	end _set_trace_to

_set_trace_ranged = proc (rtn_addr: _obj)
	end _set_trace_ranged

_set_trace_normal = proc (rtn_addr: _obj)
	end _set_trace_normal

_set_trace_flag = proc (flag: bool)
	end _set_trace_flag

_get_callee = proc (frm: _frame, rinf: _rtn_info) returns (_obj)
	end _get_callee

_trace_uninitialized = proc ()
	end _trace_uninitialized

_untrace_uninitialized = proc ()
	end _untrace_uninitialized

