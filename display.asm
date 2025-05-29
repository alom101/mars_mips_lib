# Utils for the display
# created by Arthur Osorio, 25/04/25


# From documentation:
#	red: bytes 16-23 
#	green: bytes 8-15
#	blue: bytes: 0-7

.text
# formatRGB( RED, GREEN, BLUE) -> formatedWord
formatRGB: 
	andi $v0, $a0, 0xff
	andi $a1, $a1, 0xff
	andi $a2, $a2, 0xff
	#move $v0, $a0		#modified the first line to remove this
	sll  $v0, $v0, 8
	or   $v0, $v0, $a1
	sll  $v0, $v0, 8
	or   $v0, $v0, $a2
	jr   $ra
	

#formatGray( byte) -> formatedWord
formatGray:
	andi $a0, $a0, 0xff
	sll  $v0, $a0, 8
	or   $v0, $v0, $a0
	sll  $v0, $v0, 8
	or   $v0, $v0, $a0
	jr   $ra
	

#
	
	
	
	
