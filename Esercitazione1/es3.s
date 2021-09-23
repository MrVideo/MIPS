.data
VETT:       .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
MAX:        .space 4
I:          .space 4
P:          .space 4

.text
.globl MAIN
MAIN:
    lw		$t0, VETT		    # Load the first item of the array in $t0
    sw		$t0, MAX		    # Store that first item into MAX
    la		$t0, VETT		    # Load the starting address of the array in $t0
    sw      $t0, P              # Store that address in the pointer P
    sw      $zero, I            # Initialize I to 0
LOOP:
    lw		$t0, I		        # Load I into $t0
    li		$t1, 10		        # $t1 = 10
    bge		$t0, $t1, END_LOOP	# if $t0 >= $t1 then jump to END_LOOP
    lw		$t0, P		        # Load the pointer into $t0
    lw      $t0, ($t0)          # Load the Ith value of the array into $t0
    lw		$t1, MAX		    # Load MAX in $t1
    bge		$t1, $t0, END_IF	# if $t1 >= $t0 then END_IF
    sw		$t0, MAX		    # Store the value of the array in MAX
END_IF:
    lw		$t0, P	            # Load the pointer address in $t0
    addiu   $t0, $t0, 4         # Add 4 to the pointer address, which now points to the next item in the array
    sw		$t0, P		        # Store the new address in the pointer
    lw		$t0, I		        # Load I into $t0
    addi	$t0, $t0, 1			# $t0 = $t0 + 1
    sw		$t0, I		        # Store I++ into I
    j       LOOP                # Restart the loop
END_LOOP:
    li		$v0, 10		        # $v0 = 10
    syscall