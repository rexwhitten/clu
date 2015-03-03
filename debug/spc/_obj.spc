%; Copyright, 1989    Massachusetts Institute of Technology    1980


_obj = cluster is is_ref, is_int_, is_real_, is_raw, is_proc_, is_iter_,
		  is_vec, is_bvec, is_cell, is_anyize, is_wvec, is_adv,
                  is_uninit, is_routine, is_compactcell, is_null_or_false, 
                  is_char_, get_obj, is_code_addr,
		  is_entry_vector, is_overloaded, get_entered_routine,
		  get_reftag, set_reftag, get_value,
		  get_addr, get_left, get_right,
		  lt, le, ge, gt, equal, similar, copy, print

    rep = null

get_obj = proc (x: cvt) returns (cvt)
    end get_obj

is_null_or_false = proc (x: cvt) returns (bool)
	end is_null_or_false

is_char_ = proc (x: cvt) returns (bool)
    end is_char_

is_compactcell = proc (x: cvt) returns (bool)
	end is_compactcell

is_ref = proc (x: cvt) returns (bool)
	end is_ref

is_int_ = proc (x: cvt) returns (bool)
	end is_int_

is_real_ = proc (x: cvt) returns (bool)
	end is_real_

is_raw = proc (x: cvt) returns (bool)
	end is_raw

is_routine = proc (x: cvt) returns (bool)
	end is_routine

is_proc_ = proc (x: cvt) returns (bool)
	end is_proc_

is_iter_ = proc (x: cvt) returns (bool)
	end is_iter_

is_vec = proc (x: cvt) returns (bool)
	end is_vec

is_bvec = proc (x: cvt) returns (bool)
	end is_bvec

is_cell = proc (x: cvt) returns (bool)
	end is_cell

is_anyize = proc (x: cvt) returns (bool)
	end is_anyize

is_wvec = proc (x: cvt) returns (bool)
	end is_wvec

is_adv = proc (x: cvt) returns (bool)
	end is_adv

is_uninit = proc (x: cvt) returns (bool)
	end is_uninit

is_code_addr = proc (x: cvt) returns (bool)
	end is_code_addr


is_entry_vector = proc (x: cvt) returns (bool)
	end is_entry_vector

is_overloaded = proc (x: cvt) returns (bool)
	end is_overloaded

get_entered_routine = proc (x: cvt) returns (cvt) signals (not_entry_vector)
	end get_entered_routine

get_reftag = proc (x: cvt) returns (int)
	end get_reftag

set_reftag = proc (x: cvt, rtag: int) returns (cvt)
	end set_reftag

get_value = proc (x: cvt) returns (cvt)
	end get_value

get_left = proc (x: cvt) returns (int)
	end get_left
	
get_right = proc (x: cvt) returns (int)
	end get_right

get_addr = proc (x: cvt) returns (int)
	end get_addr

lt = proc (x, y: cvt) returns (bool)
	end lt

le = proc (x, y: cvt) returns (bool)
	end le

ge = proc (x, y: cvt) returns (bool)
	end ge

gt = proc (x, y: cvt) returns (bool)
	end gt

equal = proc (x, y: cvt) returns (bool)
	end equal

similar = proc (x, y: cvt) returns (bool)
	end similar

copy = proc (x: cvt) returns (cvt)
	end copy

print = proc (x: cvt, ps: pstream)
	end print

end _obj
