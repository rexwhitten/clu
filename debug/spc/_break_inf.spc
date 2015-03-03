%% Copyright 1980, 1989 Massachusetts Institute of Technology

_break_info = cluster is
	create,
	get_slots,
	get_call_addr,
	get_callee,
	get_callee_code,
	get_callee_rtrn,
	get_callee_frame,
	get_callee_info,
	get_caller,
	get_caller_frame,
	get_caller_info,
	get_resume_addr,
        get_pseudo_resume_addr,
	get_resume_frame,
	get_single_stepping,
	set_single_stepping,
	get_should_check,
	set_should_check,
	get_should_break,
	set_should_break,
	get_enter_trace,
	set_enter_trace,
	get_leave_trace,
	set_leave_trace,
	get_yield_break,
	set_yield_break,
	caller_is_traced,
	is_iter,
	adjust_iter_frame;

    rep = any

    Create = proc (Frm: _frame, Callee_Info: _rtn_info,
		   Break_Flag: bool, Is_Entry: bool) returns (cvt);
	end Create;

    Get_Slots = proc (BI: cvt) returns (_brk_slots);
	_brk_slots = variant[ a_All:     null,
			      b_Some:    sequence[_obj] ];
	end Get_Slots;

    Get_Call_Addr = proc (BI: cvt) returns (_obj)
	end Get_Call_Addr;

    Get_Callee = proc (BI: cvt) returns (_obj);
	end Get_Callee;

    Get_Callee_Code = proc (BI: cvt) returns (_obj);
	end Get_Callee_Code;

    Get_Callee_Rtrn = proc (BI: cvt) returns (_obj);
	end Get_Callee_Rtrn;

    Get_Callee_Frame = proc (BI: cvt) returns (_frame);
	end Get_Callee_Frame;

    Get_Callee_Info = proc (BI: cvt) returns (_rtn_info);
	end Get_Callee_Info;

    Get_Caller = proc (BI: cvt) returns (_obj);
	end Get_Caller;

    Get_Caller_Frame = proc (BI: cvt) returns (_frame);
	end Get_Caller_Frame;

    Get_Caller_Info = proc (BI: cvt) returns (_rtn_info);
	end Get_Caller_Info;

    Get_Resume_Addr = proc (BI: cvt) returns (_obj)
	end Get_Resume_Addr;

    Get_Pseudo_Resume_Addr = proc (BI: cvt) returns (_obj)
        end Get_Pseudo_Resume_Addr;

    Get_Resume_Frame = proc (BI: cvt) returns (_frame);
	end Get_Resume_Frame;

    Get_Single_Stepping = proc (BI: cvt) returns (bool);
	end Get_Single_Stepping;

    Set_Single_Stepping = proc (BI: cvt, F: bool);
	end Set_Single_Stepping;

    Get_Should_Check = proc (BI: cvt) returns (bool);
	end Get_Should_Check;

    Set_Should_Check = proc (BI: cvt, F: bool);
	end Set_Should_Check;

    Get_Should_Break = proc (BI: cvt) returns (bool);
	end Get_Should_Break;

    Set_Should_Break = proc (BI: cvt, F: bool);
	end Set_Should_Break;

    Get_Enter_Trace = proc (BI: cvt) returns (bool);
	end Get_Enter_Trace;

    Set_Enter_Trace = proc (BI: cvt, F: bool);
	end Set_Enter_Trace;

    Get_Leave_Trace = proc (BI: cvt) returns (bool);
	end Get_Leave_Trace;

    Set_Leave_Trace = proc (BI: cvt, F: bool);
	end Set_Leave_Trace;

    Get_Yield_Break = proc (BI: cvt) returns (bool);
	end Get_Yield_Break;

    Set_Yield_Break = proc (BI: cvt, F: bool);
	end Set_Yield_Break;

    Caller_Is_Traced = proc (BI: cvt) returns (bool);
	end Caller_Is_Traced;

    Is_Iter = proc (BI: cvt) returns (bool);
	end Is_Iter;

    Adjust_Iter_Frame = proc (BI: cvt, CFrm: _frame, Indx: int, Frm: _frame,
			      Rsm_Addr: _obj, Rsm_Frm: _frame)
			  signals (not_an_iter);
	end Adjust_Iter_Frame;
    end _break_info;