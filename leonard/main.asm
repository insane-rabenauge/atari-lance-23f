	section	text

	pea	sup_rout
	move.w	#$26,-(sp)
	trap	#14
	addq.l	#6,sp

	clr.w	-(sp)
	trap	#1

sup_rout:
	move.w	#$2300,sr
	moveq.l	#1,d0
	bsr	paulaInstall
	lea	mt_music,a0
	bsr	setUserRout
	lea	mt_data,a0
	bsr	mt_init
	st	mt_Enable

main:
	bsr	wait_sync

	lea	$ffff8209.w,a6
	move.b	(a6),d0
.clop	cmp.b	(a6),d0
	beq.s	.clop

	eor.w	#$123,$ffff8240.w	;invert pal
	jsr	paulaTick
	eor.w	#$123,$ffff8240.w	;invert pal
	cmp.b	#185,$fffffc02.w
	bne.s	main

	bsr	mt_end
	bsr	paulaClose
	rts

wait_sync:
	move.l	$466.w,d0
.lp:	cmp.l	$466.w,d0
	beq	.lp
	rts

ATARIPAULA=1
	include	"leonardpaula.asm"
	include	"leonardtracker.asm"

	even

	section	data
mt_data:
	incbin	"4matwave.mod"

