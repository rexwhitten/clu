%;copyright, 1989 Massachusetts Institute of Technology 1980

_get_word = proc(x:_obj, disp: int) returns (int)
	end _get_word

_get_addr = proc( x:_obj, disp: int) returns(_obj)
	end _get_addr

_get_disp = proc(x: _obj, addr: _obj) returns (int) signals (overflow)
	end _get_disp

_get_long = proc(x:_obj, disp: int) returns (_obj)
	end _get_long

_get_byte = proc(x:_obj, disp:int) returns (int)
	end _get_byte

_get_xword = proc(x:_obj, disp: int) returns (int)
	end _get_xword

_get_low_byte = proc (word: int) returns (int)
	end _get_low_byte

_get_high_byte = proc (word: int) returns (int)
	end _get_high_byte



	