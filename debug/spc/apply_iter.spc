%;; Copyright	1984, 1989	Massachusetts Institute of Technology

apply_iter = iter (itr: _obj, args: objlist, rcnt: int) yields (objlist)
					signals (error(string, objlist))
        objlist = sequence[_obj]
	end apply_iter
