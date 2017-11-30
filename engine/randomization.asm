AdvanceRNG:	
	ld a,[wRNGAdd]
	ld b,a	
	rra
	ld a,[wRNGSub]
	rra
	xor b
	ld [wRNGAdd],a
	ld a,[wRNGSub]
	ld c,a
	rra
	ld a,[wRNGAdd]
	ld b,a
	rra
	xor c
	ld [wRNGSub],a
	xor b
	ld [wRNGAdd],a
	ret
	
RandomizeTrainerMon:
	ld a, 1
	ld [wRNGSub], a
	ld [wRNGAdd], a	
	ld a, [wCurOpponent]
.countClass
	push af
	call AdvanceRNG	
	pop af
	sub 1
	jr nc, .countClass
	ld a, [wTrainerNo]
.countRoster	
	push af
	ld a, [wRNGAdd]
	rra
	ld [wRNGAdd], a
	pop af
	sub 1
	jr nc, .countRoster
	ld a, [wUnusedC000]
.countPartyMon	
	push af
	call AdvanceRNG	
	pop af
	sub 1
	jr nc, .countPartyMon
	jr IterateUntilValid
	
RandomizeWildMon:
	ld a, 1
	ld [wRNGSub], a
	ld [wRNGAdd], a	
	ld a, [wCurMap]
.countMap
	push af
	call AdvanceRNG	
	pop af
	sub 1
	jr nc, .countMap
	ld a, [wUnusedC000]
.countSlot	
	push af
	ld a, [wRNGAdd]
	rra
	ld [wRNGAdd], a
	pop af
	sub 1
	jr nc, .countSlot
	ld a, [wUnusedC000]
	jr IterateUntilValid
	
	
Done:	
	ld a, [wRNGAdd]
	ld [wcf91], a
	jp BankSwitchCall

IterateUntilValid:
	ld a, [wRNGAdd]
	ld hl, .validMonIdxs
	ld b, 0
	ld c, a
	add hl, bc
	ld a, [hl]
	cp 0
	jr nz, Done
	ld a, [wRNGAdd]
	rra
	ld [wRNGAdd], a
	call AdvanceRNG	
	jr IterateUntilValid
	jp BankSwitchCall	
		
.validMonIdxs:		
	db 0
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 0
	db 0
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 0
	db 1
	db 0
	db 1
	db 1
	db 1
	db 0
	db 1
	db 1
	db 1
	db 1
	db 0
	db 0
	db 0
	db 1
	db 1
	db 1
	db 0
	db 0
	db 0
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 0
	db 0
	db 0
	db 1
	db 1
	db 1
	db 1
	db 0
	db 0
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 0
	db 0
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 0
	db 1
	db 1
	db 1
	db 1
	db 1
	db 0
	db 0
	db 1
	db 1
	db 1
	db 1
	db 0
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 0
	db 0
	db 1
	db 0
	db 1
	db 1
	db 0
	db 1
	db 1
	db 1
	db 1
	db 1
	db 0
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 0
	db 1
	db 1
	db 0
	db 0
	db 0
	db 0
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 0
	db 1
	db 0
	db 0
	db 1
	db 1
	db 1
	db 1
	db 1
	db 0
	db 0
	db 0
	db 0
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0