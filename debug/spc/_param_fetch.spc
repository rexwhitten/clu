%;; Copyright	1984, 1989	Massachusetts Institute of Technology

%;; Fetch use #indx out of the parameterized use list for the routine whose
%;; debug block is pointed to by rtn.  Indx starts from 1.
%;; (Maybe this should check to make sure that the routine is parameterized.)
_param_fetch = proc (rtn: _obj, indx: int) returns (_obj) signals (not_entry_vector)
	end _param_fetch
