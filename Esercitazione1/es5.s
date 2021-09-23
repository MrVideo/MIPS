.data
.equ         N, 3
VAL         .word 5
PTRLIST     .space 12
PTR         .space 4

.text
.globl MAIN
MAIN:
    li		$a0, 3		        # First function argument
    lw		$a1, VAL		    # Second function argument
    jal     PTRLOOP             # Jump to the function and save the return address in $ra
    sw		$v0, PTR		    # 
PTRLOOP:
    addiu   $sp, $sp, -12       # Makes space for the function in the Stack
    .equ    RA, 8               # $ra offset
    .equ    S0, 4               # $s0 offset
    .equ    S1, 0               # $s1 offset
    sw      $ra, RA($sp)        # 
    sw		$s0, S0($sp)	    # 
    sw		$s1, S1($sp)	    # 
    move 	$s1, $zero		    # $s1 = $zero
    move 	$s0, $zero		    # $s0 = $zero
FOR:
    beq		$s0, $a0, ENDFOR	# if $s0 == $a0 then ENDFOR
    la		$t0, PTRLIST		# 
    sll		$t1, $s0, 2			# $t1 = $s0 << 2
    addu    $t0, $t0, $t1       #
    lw		$t1, ($t0)		    # 
    lw		$t2, ($s1)		    # 
    beq		$t2, $a1, ENDFOR	# if $t2 == $a1 then ENDFOR
    addiu   $sp, $sp, -4        #
    sw		$a0, ($sp)		    # 
    move    $a0, $a1            #
    jal     STAMPA_DATO         #
    lw		$a0, ($sp)		    # 
    addiu   $sp, $sp, 4         #
    addi	$s0, $s0, 1			# $s0 = $s0 + 1
    j		FOR				    # jump to FOR
ENDFOR:
    move    $v0, $s1            #