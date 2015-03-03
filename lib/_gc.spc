_gc = cluster is count, control, gc

rep = any

count = proc () returns (int)
	% return number of garbage collections so far
	end count

control = proc (add, mask: int) signals (illegal)
	% after a GC, new GC point is (heap_size+ADD)&~MASK
	% ADD > 0, MASK lssu ADD
	% default: ADD = 2**20-2**17, MASK = 2**19-1
	end control

gc = proc ()
	% force a garbage collect
	end gc

end _gc
