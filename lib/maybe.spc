% this data type is similar to oneof[exists: t, none: null]
% but it doesn't require any additional storage
% however, its operations also aren't optimized by the compiler

maybe = cluster [t: type] is none, make, exists, value, equal, similar, copy

rep = any

none = proc () returns (cvt)
    % return the object with the NONE tag
    end none

make = proc (x: t) returns (cvt)
    % return a maybe with tag EXISTS and value X
    end make

exists = proc (m: cvt) returns (bool)
    % test if M has tag EXISTS
    end exists

value = proc (m: cvt) returns (t) signals (wrong_tag)
    % return the value of M if the tag is EXISTS, else signal wrong_tag
    end value

equal = proc (m1, m2: cvt) returns (bool)
	    where t has equal: proctype (t, t) returns (bool)
    % true if both have tag NONE or
    % both have tag EXISTS and the values are t$equal
    end equal

similar = proc (m1, m2: cvt) returns (bool)
	    where t has similar: proctype (t, t) returns (bool)
    % true if both have tag NONE or
    % both have tag EXISTS and the values are t$similar
    end similar

copy = proc (m: cvt) returns (cvt)
	    where t has copy: proctype (t) returns (t)
    % if M has tag NONE, return it
    % else return a maybe with tag EXISTS and value t$copy(value(m))
    end copy

end maybe
