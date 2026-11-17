#EX1 Repeated Greeting
	.data
prompt: .asciiz "Number of greetings: "
greeting: .asciiz "Hello!\n"
num_printed: .word 0
num_to_print: .word 0

	.text
	.globl main
main:
	la $a0, prompt
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	sw $v0, num_to_print

loop:
	lw $t0, num_printed
	lw $t1, num_to_print
	
	bge $t0, $t1, endloop
	
	la $a0, greeting
	li $v0, 4
	syscall
	
	addi $t0, $t0, 1
	sw $t0, num_printed
	
	b loop
	
endloop:
	jr $ra
