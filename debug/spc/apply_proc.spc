%;; Copyright 1984, 1989	Barbara Lisk

apply_proc = proc (prc: _obj, args: objlist, rcnt: int) returns (objlist)
					signals (error (string, objlist))
        objlist = sequence[_obj]
	end apply_proc
	
		
		
	