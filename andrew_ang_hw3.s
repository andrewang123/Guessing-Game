# This is a guessing game program
.data

# Constant string to be outputted to terminal
secret1:    .word	 25	# integer variable with initial value 3
prompt1:    .asciiz "Welcome to the guessing game"
prompt2:    .asciiz "Please enter a number"
prompt3:    .asciiz "Thank you for using to program"
prompt4:    .asciiz "you lose"
prompt5:    .asciiz "you win"
linefeed:	.asciiz	"\n"

.text

main:

    #display “Welcome to the guessing game message”
        li	$v0,4			# code for print_string
        la	$a0,prompt1		# point $a0 to Welcome to guessing game string
        syscall

    # display prompt message
        li	$v0,4			# code for print_string
        la	$a0,prompt2		# point $a0 to prompt2 string
        syscall				# print the prompt

        addi $s2, $s2, 0 # int i = 0
        addi $s1, $s1, 10 #check the bounds of the do while loop

    # do while (total guess < 10) keep the user guessing
    # get an integer from the user
Repeat: li	$v0,5			# code for read_int
        syscall				# get an int from user --> returned in $v0
        move	$s0,$v0			# move the resulting int to $s0
        addi	$s0,$s0,1


# if statement, if user num = my num than print you win
# else increment $s2

        bne $s0,secret1, Increment # if they don’t equal jump to increment
# else it equals and display win message
# display “You Win“ message
Win: 	li	$v0,4			# code for print_string
        la	$a0,prompt5	# point $a0 to you win string
        syscall				# print the string
        j Exit

Increment: addi $s2, $s2, 1 # increment s2 by 1

        bne $s1, $s2, Repeat #keep looping as long as i < 10

# display “You Lose” message
Fail:   li	$v0,4			# code for print_string
        la	$a0,prompt4		# point $a0 to you lose string
        syscall			# print the string
# thank user for using program
Exit:	li	$v0,4			# code for print_string
        la	$a0,prompt3 	# point $a0 to hello world string
        syscall

# exit point - use this when program is done and should return to SPIM
        li	$v0,10			# code for exit
        syscall				# exit program






