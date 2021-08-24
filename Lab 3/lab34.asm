############################################################################
#                       Lab 3
#                       EC413
#
#    		Assembly Language Lab -- Programming with Loops.
#
############################################################################
#  DATA
############################################################################
        .data           # Data segment
Hello:  .asciiz " \n Hello World! \n "  # declare a zero terminated string
Hello_len: .word 16
AnInt:	.word	12		# a word initialized to 12
space:	.asciiz	" "	# declare a zero terminate string
WordAvg:   .word 0		#use this variable for part 4
ValidInt:  .word 0		#
ValidInt2: .word 0		#
lf:     .byte	10, 0	# string with carriage return and line feed
InLenW:	.word   4       # initialize to number of words in input1 and input2
InLenB:	.word   16      # initialize to number of bytes in input1 and input2
        .align  4
Input1:	.word	0x01020304,0x05060708
	    .word	0x090A0B0C,0x0D0E0F10
        .align  4
Input2: .word   0x01221117,0x090b1d1f   # input
        .word   0x0e1c2a08,0x06040210
        .align  4
Copy:  	.space  0x80    # space to copy input word by word
        .align  4
 
Enter: .asciiz "\n"
Comma: .asciiz ","
############################################################################
#  CODE
############################################################################
        .text                   # code segment
#
# print out greeting
#
main:
        la	$a0,Hello	# address of string to print
        li	$v0,4		# system call code for print_str
        syscall                 # print the string

	
#Code for Item 2
#Count number of occurences of letter "l" in Hello string

	lw	$t0,Hello_len	# store the length of "Hello World" in register $t0
	li	$t1,0		# counter for keeping track of number of "l"s
	li	$t2,0		# register for keeping track of how many characters we've looked at
	li	$t3,'l'		# load character "l" into a register for comparison
TOP:	
	lb	$t4,0($a0)	# load new character into register $t4
	addi	$t2,1		# increment each time we look at a new character
	bne	$t4,$t3,NEXT	# if there is an l:
	addi	$t1,1		# increment counter
NEXT:				# otherwise skip counter increment and continue:
	addi	$a0,1		# index into next character of string
	bleu	$t2,$t0,TOP	# if we haven't reached the end of the string, loop back to top

	li	$v0,1
	move	$a0,$t1
	syscall

################################################################################
        la	$a0,Enter	# address of string to print
        li	$v0,4		# system call code for print_str
        syscall                 	# print the string
################################################################################

#
# Code for Item 3 -- 
# Print the integer value of numbers from 0 and less than AnInt
#

	lw	$t0,AnInt	# load integer 12 into register $t0
	li	$t1,0		# counter used to print integers up until 12
TOP1:
	li	$v0,1
	move	$a0,$t1
	syscall		# print statements
	la	$a0,space	# address of string to print
       li	$v0,4		# system call code for print_str
      	syscall      		# print the string

	addi	$t1,1		# increment counter
	blt	$t1,$t0,TOP1	# if counter is less than 12, loop to TOP

###################################################################################
        la	$a0,Enter	# address of string to print
        li	$v0,4		# system call code for print_str
        syscall                 	# print the string
###################################################################################
#
# Code for Item 4 -- 
# Print the integer values of each byte in the array Input1 (with spaces)
#

	li	$t0,0		# counter to keep track of how many bytes we've incremented the memory address by
	lw	$t1,InLenB	# store the number of bytes in Input1 for comparison
TOP2:
	lb	$t2,Input1($t0)	# load int into register $t2

	li	$v0,1
	move	$a0,$t2
	syscall

	la	$a0,space	# print statements
	li	$v0,4
	syscall	

	addi	$t0,1		# increment counter by 4 as we also increment memory address of Input1 by 4
	blt	$t0,$t1,TOP2	# if counter is less than 16, loop back to TOP2

###################################################################################
        la	$a0,Enter	# address of string to print
        li	$v0,4		# system call code for print_str
        syscall                 	# print the string
###################################################################################
#
# Code for Item 5 -- 
# Write code to copy the contents of Input2 to Copy
#

	li	$t0,0			# counter to keep track of how many words we've incremented the memory address by
	lw	$t1,InLenB		# store the number of bytes in Input2 for comparison
TOP3:
	lw	$t2,Input2($t0)	# load int into register $t2
	sw	$t2,Copy($t0)		# store int into memory address Copy + $t0

	lw	$a0,Input2($t0)	# print statements
	li	$v0,1
	syscall

	la	$a0,space
	li	$v0,4
	syscall

	li	$v0,1
	lw	$a0,Copy($t0)
	syscall			# print to check value

	la	$a0,space
	li	$v0,4
	syscall

	addi	$t0,4			# increment by 4 for next memory address
	blt	$t0,$t1,TOP3		# if counter is less than 16, loop back to TOP3

#################################################################################
        la	$a0,Enter	# address of string to print
        li	$v0,4		# system call code for print_str
        syscall                 # print the string
###################################################################################
#
# Code for Item 6 -- 
# Print the minimum, maximum, and integer average of the contents of array Input1
#

	li	$t0,4		# counter to keep track of how many words we've incremented the memory address by
	lw	$t1,InLenB	# store the number of bytes in Input1 for comparison
	lw	$t2,Input1	# initialize register $t2 to store minimum value
	lw	$t3,Input1	# initialize register $t3 to store maximum value
	lw	$t4,Input1	# initialize register $t4 to store a running sum for average calculation
	li	$t5,1		# initialize a "num counter" to keep track of how many elements are in the array (for calculating average)
TOP4:
	addi	$t5,1			# increment "num counter"
	lw	$t6,Input1($t0)	# load int into register $t2
	
	bgeu	$t6,$t2,NEXT1		# if next num in array is less than current minimum value, update minimum value in register $t2
	move 	$t2,$t6		# update minimum value in register $t2
NEXT1:
	bleu	$t6,$t3,NEXT2		# if next num in array is greater than current maximum value, update maximum value in register $t3
	move	$t3,$t6		# update maximum value in register $t3
NEXT2:
	add	$t4,$t4,$t6		# add next num to register $t4 for running sum for average calculation
	addi	$t0,4			# increment counter by 4 as we also increment memory address of Input1 by 4
	blt	$t0,$t1,TOP4		# if counter is less than 16, loop back to TOP4

	div	$t4,$t5		# divide running sum by number of elements for average calculation
	mfhi	$t0			# remainder (None in this case)
	mflo	$t1			# quotient

	li	$v0,1
	move	$a0,$t2		# print minimum value
	syscall

	li	$v0,4
	la	$a0,space
	syscall

	li	$v0,1
	move	$a0,$t3		# print maximum value
	syscall

	li	$v0,4
	la	$a0,space
	syscall

	li	$v0,1
	move	$a0,$t1		# print average
	syscall

#################################################################################
        la	$a0,Enter	# address of string to print
        li	$v0,4		# system call code for print_str
        syscall                 # print the string
##################################################################################
#
# Code for Item 7 -- 
# Display the first 30 integers that are divisible by either 7 and 13 (with comma)
#

	li	$t0,0			# num starting at 0
	li	$s0,7			# register $s0 will store 7 for comparison
	li	$s1,13			# register $s1 will store 13 for comparison
	li	$s2,30			# register $s2 will store 30 for loop comparison
	li	$t2,0			# counter for keeping track of how many numbers have been printed
TOP5:
	div	$t0,$s0		# divide current counter value by 7
	mfhi	$t1			# store remainder in register $t1
	bne	$t1,$zero,NEXT3	# if remainder is zero, then the value is divisible by 7 and we should print it:

	addi	$t2,1			# increment counter because we are printing a value
	
	li	$v0,1
	move	$a0,$t0		# print statements
	syscall

	li	$v0,4
	la	$a0,Comma
	syscall
	j	NEXT4
NEXT3:
	div	$t0,$s1		# divide current counter value by 13
	mfhi	$t1			# store remainder in register $t1
	bne 	$t1,$zero,NEXT4	# if remainder is zero, then the value is divisible by 13 and we should print it:

	addi	$t2,1			# increment counter because we are printing a value
	
	li	$v0,1
	move	$a0,$t0		# print statements
	syscall

	li	$v0,4
	la	$a0,Comma
	syscall
NEXT4:
	addi	$t0,1			# increment num
	blt	$t2,$s2,TOP5		# if counter value is less than or equal to 30, continue looping

#
# Code for Item 8 -- 
# Repeat step 7 but display the integers in 6 lines with 5 integers with spaces per line
# This must be implemented using a nested loop.
#

	li	$t0,0			# num starting at 0
	li	$s0,7			# register $s0 will store 7 for comparison
	li	$s1,13			# register $s1 will store 13 for comparison
	li	$s2,30			# register $s2 will store 30 for loop comparison
	li	$t2,0			# counter for keeping track of how many numbers have been printed
	li	$s3,5			# register $s3 will store 5 for loop comparison
	li	$t3,0			# counter for number of prints per line
TOP7:
	li	$t3,0			# re-initialize $t3 to 0
	li	$v0,4
	la	$a0,lf			# print new line
	syscall
	beq	$t2,$s2,Exit		# if 30 numbers have been printed, exit program
TOP6:
	div	$t0,$s0		# divide current counter value by 7
	mfhi	$t1			# store remainder in register $t1
	bne	$t1,$zero,NEXT5	# if remainder is zero, then the value is divisible by 7 and we should print it:

	addi	$t2,1			# increment number of prints counter
	addi	$t3,1			# increment number of prints per line counter
	
	li	$v0,1
	move	$a0,$t0		# print statements
	syscall

	li	$v0,4
	la	$a0,space
	syscall
	j	NEXT6
NEXT5:
	div	$t0,$s1		# divide current counter value by 13
	mfhi	$t1			# store remainder in register $t1
	bne 	$t1,$zero,NEXT6	# if remainder is zero, then the value is divisible by 13 and we should print it:

	addi	$t2,1			# increment number of prints counter
	addi	$t3,1			# increment number of prints per line counter
	
	li	$v0,1
	move	$a0,$t0		# print statements
	syscall

	li	$v0,4
	la	$a0,space
	syscall
NEXT6:
	addi	$t0,1			# increment num
	beq	$t3,$s3,TOP7		# if 5 nums have been printed, loop back to top to print new line
	bleu	$t2,$s2,TOP6		# if counter value is less than or equal to 30, continue looping

Exit:
	jr $ra