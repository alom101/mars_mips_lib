draw_pixel:
        addiu   $2,$4,-1       # _5, x,
        sltiu    $2,$2,511        # tmp207, _5,
        beq     $2,$0,$L1
        nop
        addiu   $2,$5,-1       # _15, y,
        sltiu    $2,$2,255        # tmp209, _15,
        beq     $2,$0,$L1
        nop
        sll     $5,$5,9    # _9, y,
        addu    $4,$5,$4         # _11, _9, x
        sll     $2,$4,2    # _12, _11,
        li      $3,268500992                        # 0x10010000     # tmp213,
        addu    $2,$2,$3         # _13, _12, tmp213
        sw      $6,0($2)     # color, *_13
$L1:
        jr      $31
        nop
min:
        move    $2,$4    # _3, a
        slt     $4,$5,$4   # tmp198, b, a
        beq     $4,$0,$L4
        nop
        move    $2,$5    # _3, b
$L4:
        jr      $31
        nop
max:
        move    $2,$4    # _3, a
        slt     $4,$4,$5   # tmp198, a, b
        beq     $4,$0,$L6
        nop
        move    $2,$5    # _3, b
$L6:
        jr      $31
        nop
draw_line_slow:
        jr      $31
        nop
main:
        addiu   $sp,$sp,-56    #,,
        sw      $31,52($sp)  #,
        sw      $21,48($sp)  #,
        sw      $20,44($sp)  #,
        sw      $19,40($sp)  #,
        sw      $18,36($sp)  #,
        sw      $17,32($sp)  #,
        sw      $16,28($sp)  #,
        move    $16,$0   # _2,
        li      $18,16711680                        # 0xff0000       # tmp209,
        li      $21,257           # 0x101  # tmp205,
        ori     $20,$18,0xff00     # tmp210, tmp209,
        li      $19,1024                    # 0x400  # tmp207,
$L9:
        move    $6,$18   #, tmp209
        sll     $5,$16,1   #, _2,
        move    $4,$16   #, _2
        jal     draw_pixel
        nop
        move    $17,$16  # i, _2
        addiu   $16,$16,1      # _2, _2,
        li      $6,65280                    # 0xff00         #,
        move    $5,$17   #, i
        move    $4,$16   #, _2
        jal     draw_pixel
        nop
        move    $6,$20   #, tmp210
        subu    $5,$21,$16       #, tmp205, _2
        move    $4,$17   #, i
        jal     draw_pixel
        nop
        bne     $16,$19,$L9
        nop
        move    $2,$0    #,
        lw      $31,52($sp)    #,
        lw      $21,48($sp)    #,
        lw      $20,44($sp)    #,
        lw      $19,40($sp)    #,
        lw      $18,36($sp)    #,
        lw      $17,32($sp)    #,
        lw      $16,28($sp)    #,
        addiu   $sp,$sp,56     #,,
        jr      $31
        nop
