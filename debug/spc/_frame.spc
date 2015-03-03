%;; Copyright 	1984, 1989	Massachusetts Institute of Technology

_frame = cluster is
	current, fetch, store, get_prev, get_addr, get_loop, iters,
	retry, mrtn, myld, msig, equal

        rep = null

	current = proc () returns (cvt)
		end current

	fetch = proc (f: cvt, i: int) returns (_obj) signals (bounds)
		end fetch

	store = proc (f: cvt, i: int, x: _obj) signals (bounds)
		end store

	get_prev = proc (f: cvt) returns (cvt) signals (bounds, none)
		end get_prev

	get_addr = proc (f: cvt) returns (_obj) signals (bounds)
		end get_addr

	get_loop = proc (f: cvt) returns (_obj) signals (bounds)
		end get_loop

	iters = iter (f: cvt, addr: _obj, rinf: _rtn_info) yields (int, cvt, _obj)
			signals (bounds, not_found)
		end iters

	retry = proc (f: cvt, rtn: _rtn_info) signals (bounds)
		end retry

	mrtn = proc (f: cvt, rtn: _rtn_info, vals: sequence[_obj])
					signals (bounds, illegal_results)
		end mrtn

	myld = proc (f: cvt, addr: _obj, rtn: _rtn_info, vals: sequence[_obj])
					signals (bounds, illegal_results)
		end myld

	msig = proc (f: cvt, addr: _obj, blk: _signal_block, vals: sequence[_obj])
					signals (bounds)
		end msig

	equal = proc (f1, f2: cvt) returns (bool)
		end equal

	end _frame
