#EX2&3 Print First N Numbers, Add First N Numbers 
	.data
prompt: .asciiz "Enter N: "
askNumber: .asciiz "Enter number: "
printed_num: .word 1
num_to_print: .word 0
sum: .word 0

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
	lw $t0, printed_num
	lw $t1, num_to_print
	lw $t2, sum
	
	bgt $t0, $t1, endloop
	
	la $a0, askNumber
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	move $t3, $v0
	
	add $t2, $t2, $t3
	addi $t0, $t0, 1
	
	sw $t0, printed_num
	sw $t2, sum
	
	b loop
	
endloop:
	lw $t2, sum
	li $v0, 1
	move $a0, $t2
	syscall
	jr $ra
	
