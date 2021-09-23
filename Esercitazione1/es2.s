.data
VETT:       .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
MAX:        .space 4
I:          .space 4

.text
.globl MAIN
MAIN:
    lw		$t0, VETT		    # Load first array value
    sw      $t0, MAX            # Store that in MAX
    sw		$0, I		        # i = 0 in the for loop
LOOP:
    lw		$t0, I		        # Load I to check its value against
    li      $t1, 10             # 10, which is loaded here
    bge		$t0, $t1, END_LOOP	# if $t0 >= $t1 then jump to END_LOOP
    la		$t1, VETT		    # Load VETT's address in $t1
    lw		$t0, I		        # Load I in $t0
    sll		$t0, $t0, 2		    # $t0 = $t0 << 2. Now $t0 contains 4 x I
    addu    $t0, $t0, $t1       # $t0 now contains the Ith element of VETT
    lw		$t0, ($t0)		    # Loads the Ith element of the array in $t0
    ble		$t0, $t1, END_IF	# if $t0 <= $t1 then END_IF
    sw		$t0, MAX		    # Store the Ith element of the array in MAX
END_IF:
    lw		$t0, I		        # Load I
    addi	$t0, $t0, 1			# $t0 = $t0 + 1
    sw		$t0, I		        # Store I++
    j		LOOP				# jump to LOOP
END_LOOP:
    li		$v0, 10		        # Exit code
    syscall                     # System call