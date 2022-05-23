.eqv    N, 10

.data
VETT:   .space 40

.text
F_RIC:
    addiu $sp, $sp, -12
    sw    $fp, 8($sp)
    addiu $fp, $sp, 8
    .eqv  RA, -4
    .eqv  J, -8
    sw    $ra, RA($fp)
    sw	   $a1, J($fp)
IF:
    lw    $t0, J($fp)
    li    $t1, -1
    bne   $t0, $t1, ELSE
THEN:
    move  $v0, $0
    j     END_IF
ELSE:
    la    $t0, VETT
    sll   $t1, $a1, 2
    addu  $t0, $t0, $t1
    lw    $t1, ($t0)
    sw    $t1, ($a0)
    addiu $sp, $sp, -4
    sw    $a1, ($sp)
    addi  $a1, $a1, -1
    jal   F_RIC
    lw    $a1, ($sp)
    addiu $sp, $sp, 4
END_IF:
    lw    $ra, RA($fp)
    lw    $fp, ($fp)
    addiu $sp, $sp, 12
    jr    $ra