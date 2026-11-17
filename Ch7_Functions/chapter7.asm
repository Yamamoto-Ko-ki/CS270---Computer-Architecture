# CS270 Chapter 7 - study notes / code written while learning
# REFERENCE COLLECTION ONLY: individual snippets may redefine main/loop.
# This file is not intended to be assembled as a single program.
# Original source files are saved in _Original_Uploads.


# ========================================================================
# Function demo: print Hello
# Original: functions.asm, lines 1-17
# ========================================================================

	.data
msg:	.asciiz "Hello!\n"
	.text
	.globl main
main: 
	jal print_hello
	
	li $v0, 10
	syscall

print_hello:
	li $v0, 4
	la $a0, msg
	syscall
	
	jr $ra

# ========================================================================
# Function demo: multiply two numbers
# Original: functions.asm, lines 18-31
# ========================================================================

main:
	li $a0, 8
	li $a0, 3
	jal multiply_two
	
	li $v0, 10
	syscall
multiply_two:
	mul $a0, $a0, $t1
	li $v0, 1
	syscall
	
	jr $ra
	

# ========================================================================
# Function demo: add two numbers and return value
# Original: functions.asm, lines 32-49
# ========================================================================

main:
	li $a0, 7
	li $a1, 12
	
	jal add_numbers
	
	move $a0, $v0
	
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
	
add_numbers:
	add $v0, $a0, $a1
	jr $ra
	
