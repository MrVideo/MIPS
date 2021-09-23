.data
A:      .word 5
B:      .word 7
C:      .word 12
RES1:   .space 4
RES2:   .space 4
RES3:   .space 4

.text
.globl MAIN
MAIN:
    lw		$t0, A
    lw      $t1, B
    add     $t0, $t0, $t1
    lw      $t1, C
    sub		$t0, $t0, $t1
    lw      $t1, A
    sub     $t0, $t0, $t1
    sw	    $t0, RES1

    lw      $t0, A
    lw      $t1, B
    lw      $t2, C
    lw      $t3, A
    sub     $t2, $t2, $t3
    sub     $t1, $t1, $t2
    add     $t0, $t0, $t1
    sw      $t0, RES2

    lw      $t0, A
    lw      $t1, B
    lw      $t2, C
    mul     $t1, $t1, $t2
    add     $t0, $t0, $t1
    lw      $t1, A
    sub     $t0, $t0, $t1
    sw      $t0, RES3

    lw      $v0, 10
    syscall