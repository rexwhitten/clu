heap = cluster [t: type] is
    create,         % Create a heap with a particular sorting predicate
    top,            % Return the best element
    size,           % Return the number of elements
    empty,          % Return true if there are no elements
    insert,         % Insert an element of type t
    remove,         % Remove the best element and return it
    copy
    
    pt = proctype (t, t) returns (bool)
    rep = any
    
    copy = proc (x: heap[t]) returns (heap[t])
	end copy

    create = proc (p: pt) returns (heap[t])
	end create
    
    top = proc (x: heap[t]) returns (t) signals (empty)
	end top
    
    size = proc (x: heap[t]) returns (int)
	end size
    
    empty = proc (x: heap[t]) returns (bool)
	end empty
    
    insert = proc (x: heap[t], v: t)
	end insert
    
    remove = proc (x: heap[t]) returns (t) signals (empty)
	end remove
    
    end heap
