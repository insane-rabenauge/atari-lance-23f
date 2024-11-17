	section	text

	pea	sup_rout
	move.w	#$26,-(sp)
	trap	#14
	addq.l	#6,sp

	clr.w	-(sp)
	trap	#1

sup_rout:
	moveq	#3,d0	;50khz
	bsr	paula_init
	lea	mt_data,a0
	bsr	mt_init
	st	mt_Enable

main:
	bsr	wait_sync

	lea	$ffff8209.w,a6	;wait until the screen
	move.b	(a6),d0	;starts drawings
.clop	cmp.b	(a6),d0
	beq.s	.clop
	eor.w	#$123,$ffff8240.w	;invert pal
	bsr	paula_calc
	eor.w	#$123^$321,$ffff8240.w	;restore pal
	bsr	mt_music
	eor.w	#$321,$ffff8240.w	;restore pal
	cmp.b	#185,$fffffc02.w
	bne.s	main

	bsr	mt_end
	bsr	paula_done
	rts

wait_sync:
	move.l	$466.w,d0
.lp:	cmp.l	$466.w,d0
	beq	.lp
	rts

	include	"lancepaula.asm"
	include	"lancetracker.asm"

	section	data
mt_data:
	incbin	"4matwave.mod"
	ds.w	31*665	;for chip expansion - always needed!

