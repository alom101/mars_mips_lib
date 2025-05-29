
.data
DISPLAY: .space  1048576 #4*512*256



.text 0x00400000
	la   $s0, DISPLAY
MAIN:
	move $a0, $s1
	move $a1, $s2
	move $a2, $s3
	#jal formatRGB
	jal formatGray
	sw   $v0, 0($s0)
	
	addi $s1, $s1, 1
	addi $s2, $s2, 1
	addi $s3, $s3, 1
	
	addi $s0, $s0, 4
	j    MAIN



.include "display.asm"

