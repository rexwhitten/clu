%;; Copyright  1989  Massachusetts Institute of Technology

_signal_block = cluster is
	size,
	offset,
	equal,
	get_except_chain,
	get_name,
	get_num_args;

    rep = any;

    Size = proc () returns (int);
	end Size;

    Offset = proc () returns (int);
	end Offset;

    Equal = proc (SB1: cvt, SB2: cvt) returns (bool);
	end Equal;

    Get_Except_Chain = proc (SB: cvt) returns (_obj);
	end Get_Except_Chain;

    Get_Name = proc (SB: cvt) returns (string);
	end Get_Name;

    Get_Num_Args = proc (SB: cvt) returns (int);
	end Get_Num_Args;

    end _signal_block;