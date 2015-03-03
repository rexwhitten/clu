gc_read = proc [t: type] (fname: file_name) returns (t)
					    signals (not_possible(string))
   end gc_read


file_exists = proc (fn: file_name) returns (bool)
				   signals (not_possible(string))
   end file_exists


hash_obj = proc (o: _obj, max: int) returns (int)
   end hash_obj

connected_dir = proc () returns (string)
   end connected_dir
