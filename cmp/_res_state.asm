;; Copyright	Barbara Liskov	1985

;; Restore the Owns, Wvecs, Heaphi, Freecnt and the Heap from the file created
;; previously by _save_state.

_restore_state = proc (fs: string) returns (bool)
	ifeq	moveq	6, n1
		and	(rr), n1
	then	string$append(rr, '\000')	;; Append a null if necessary.
		end
	clr	-(sp)			;; Push mode.
	clr	-(sp)			;; Push flags (read only).
	pea	4(rr)			;; Push file name address.
	clr	-(sp)			;; Hack pc.
	moveq	%open, n0
	move	n0, -(sp)
	trap	0			;; Open the state file.
	bcs	oops
	move	n0, 4(sp)		;; File descriptor.
	movea	segmap, r1
	lea	owncnt(r1), r1
	move	(r1)+, n3		;; Size (in bytes) of owns as CLU int.
	move	(r1)+, 8(sp)		;; Addr of start of owns.
	eorib	1, n3			;; Kill low bit of n1.
	add	(r1)+, n3		;; Add in size of wvecs as CLU int.
	asr	1, n3			;; De-integerize total size.
	move	n3, 12(sp)		;; Put in stack as count for read().
	moveq	%read, n0
	move	n0, -(sp)
	trap	0			;; Read the owns and wvecs.
	bcs	death
	cmp	n3, n0			;; Read everything?
	bne	death
	lea	heaphi, r1
	move	r1, 8(sp)		;; Heaphi.
	move	4, 12(sp)
	moveq	%read, n0
	move	n0, -(sp)
	trap	0			;; Read it.
	bcs	death
	cmpi	4, n0			;; Read everything?
	bne	death
	lea	freecnt, r1
	move	r1, 8(sp)		;; Freecnt.
	move	4, 12(sp)
	moveq	%read, n0
	move	n0, -(sp)
	trap	0			;; Read it.
	bcs	death
	cmpi	4, n0			;; Read everything?
	bne	death
	move	heaplo, 8(sp)		;; Heap.
	move	heaphi, n1
	sub	8(sp), n1
	move	n1, 12(sp)
	moveq	%read, n0
	move	n0, -(sp)
	trap	0			;; Read it.
	bcs	death
	cmp	12(sp), n0		;; Read everything?
	bne	death
	moveq	%close, n0
	move	n0, -(sp)		;; Close the file.
	trap	0
	_chan$%forget()			;; Forget nul dev
	moveq	1, n0			;; Restore n0.
	addq	4, sp			;; Pop pc.
	clr	(sp)+			;; Pop and clear args.
	clr	(sp)+
	clr	(sp)+
	movea	n0, r1
	movea	n0, r2
	movea	n0, r3
	movea	n0, r4
	clr	fs
	return (true)

death:	moveq	%close, n0
	move	n0, -(sp)
	trap	0			;; Close the file.
	movea	"state restoration failed!\n", rr
	move	2, 4(sp)		;; File descriptor (error output)
	move	(rr), n1		;; Size of string.
	asr	1, n1			;; De-integerize.
	move	n1, 12(sp)		;; Length of write.
	lea	4(rr), rr
	move	rr, 8(sp)		;; String address.
	moveq	%write, n0
	move	n0, -(sp)
	trap	0
	move	15, 4(sp)		;; Exit code.
	moveq	%exit, n0
	move	n0, -(sp)
	trap	0			;; Exit.

oops:	moveq	1, n0			;; Restore n0.
	addq	4, sp			;; Pop pc.
	clr	(sp)+			;; Pop and clear args.
	clr	(sp)+
	clr	(sp)+
	return(false)
	end _restore_state