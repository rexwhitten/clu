%;; Copyright	1984, 1989	Massachusetts Institute of Technology

_signal_block = cluster is
	size,
	offset,
	equal,
	get_except_chain,
	get_name,
	get_num_args

	rep = _obj
	size = proc () returns (int)
		end size

	offset = proc () returns (int)
		end offset

	equal = proc (sb1: cvt, sb2: cvt) returns (bool)
		end equal

	get_except_chain = proc (sb: cvt) returns (_obj)
		end get_except_chain

	get_name = proc (sb: cvt) returns (string)
		end get_name

	get_num_args = proc (sb: cvt) returns (int)
		end get_num_args

	end _signal_block
