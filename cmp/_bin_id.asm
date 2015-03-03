; Copyright    Barbara Liskov    1985

_bin_id = proc () returns (date)
	wvec	buf	{4}
	lea	buf,rr
	pea	8(rr)
	move	rr,-(sp)
	clr	-(sp)
	moveq	%gettimeofday,n0
	move	n0,-(sp)
	trap	0
	lea	12(sp),sp
	movea	(rr),rr
	lea	1(rr,rr),rr
	return(rr)
	end _bin_id
