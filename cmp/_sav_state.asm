;; Copyright	Barbara Liskov	1985

;; Dump the current state of Owns, Wvecs, Heaphi, Freecnt and the Heap
;; to a file.

_save_state = proc (fs: string, mode: int) signals (not_possible(string))
	movea	fs, rr
	ifeq	moveq	6, n1
		and	(rr), n1
	then	string$append(rr, '\000')	;; Append a null if necessary.
		end
	move	mode, n1
	asr	1, n1			;; De-integerize mode.
	move	n1, -(sp)		;; Push mode.
	move	#601, -(sp)		;; Push flags: WRONLY+CREATE+TRUNCATE
	pea	4(rr)			;; Push string address.
	clr	-(sp)			;; Hack pc.
	moveq	%open, n0
	move	n0, -(sp)
	trap	0			;; Do the open/create call.
	bcs	oops
	move	n0, 4(sp)		;; File descriptor.
	movea	segmap, r1
	lea	owncnt(r1), r1
	move	(r1)+, n3		;; Size (in bytes) of owns as CLU int.
	move	(r1)+, 8(sp)		;; Addr of start of owns.
	eorib	1, n3			;; Kill low bit of n1.
	add	(r1)+, n3		;; Add in size (in bytes) of wvecs as a CLU int.
	asr	1, n3			;; De-integerize total size.
	move	n3, 12(sp)		;; Put in stack as count for write().
	moveq	%write, n0
	move	n0, -(sp)
	trap	0			;; Write owns and wvecs.
	bcs	death
	cmp	n3, n0			;; Wrote everything?
	bne	death			;; If not, die.
	lea	heaphi, r1
	move	r1, 8(sp)		;; Heaphi.
	move	4, 12(sp)
	moveq	%write, n0
	move	n0, -(sp)
	trap	0			;; Write it.
	bcs	death
	cmpi	4, n0			;; Wrote everything?
	bne	death
	lea	freecnt, r1
	move	r1, 8(sp)		;; Freecnt.
	move	4, 12(sp)
	moveq	%write, n0
	move	n0, -(sp)
	trap	0			;; Write it.
	bcs	death
	cmpi	4, n0			;; Wrote everything?
	bne	death
	move	heaplo, 8(sp)		;; Heap.
	move	heaphi, n1
	sub	8(sp), n1
	move	n1, 12(sp)
	moveq	%write, n0
	move	n0, -(sp)
	trap	0			;; Write it.
	bcs	death
	cmp	12(sp), n0		;; Wrote everything?
	bne	death
	move	%close, n0
	move	n0, -(sp)
	trap	0			;; Close the file.
	addq	4, sp			;; Pop pc.
	clr	(sp)+			;; Clear nbytes and buf.
	clr	(sp)+
	addq	4, sp			;; Pop file desc.
	moveq	1, n0			;; Restore n0.
	movea	n0, r1			;; Make r1 a valid ref.
	return

death:	move	n0, n3			;; Save error code.
	moveq	%close, n0
	move	n0, -(sp)
	trap	0			;; Close the file.
	move	rr, 4(sp)
	addq	4, 4(sp)		;; File name address.
	moveq	%unlink, n0
	move	n0, -(sp)
	trap	0			;; Delete the file.
	move	n3, n0
oops:	movea	n0, r1			;; Save and integerize error code.
	lea	1(r1, r1), r1
	moveq	1, n0			;; Restore n0.
	addq	4, sp			;; Pop pc.
	clr	(sp)+			;; Pop and clear args.
	clr	(sp)+
	clr	(sp)+
	_erstr(r1)
	signal	not_possible(r1)
	end _save_state