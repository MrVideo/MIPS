.data
A:      .word 1
B:      .word 2
C:      .word 3

.text
.globl MAIN
MAIN:
    lw		$t0, A		    # Load A in temporary registry
    lw		$t1, B		    # Load B in temporary registry
    bne		$t0, $t1, ELSE	# if $t0 != $t1 then jump to ELSE
    lw		$t1, C		    # Load C in temporary registry
    bne		$t0, $t1, ELSE	# if $t0 != $t1 then jump to ELSE
THEN:
    lw		$t0, A		    # Load A in temporary registry
    addi	$t0, $t0, 1		# $t0 = $t0 + 1
    sw		$t0, A		    # Store the new value in A
    j		END_IF			# jump to END_IF
ELSE:
    lw      $t0, B          # Load B in temporary registry
    addi    $t0, $t0, 1     # $t0 = $t0 + 1
    sw      $t0, B          # Store the new value in B
END_IF:
    li		$t0, 12		    # $t0 = 12
    sw      $t0, C          # Store 12 in C
    li      $v0, 10         # Exit code in MIPS = 10
    syscall                 # Tells the OS to stop the program