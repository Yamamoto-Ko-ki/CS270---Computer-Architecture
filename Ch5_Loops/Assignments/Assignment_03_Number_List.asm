	     .data
upper_bound: .word 0
special_num: .word 0
current_num: .word 0

upper_prompt: 	.asciiz "Upper bound: "
special_prompt: .asciiz "Special number: "
exclamation: 	.asciiz "!"
	.text
	.globl main
main:
	la $a0, upper_prompt
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	sw $v0, upper_bound
	
	la $a0, special_prompt
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	sw $v0, special_num
	
	lw $t4, current_num
	addi $t4, $t4, 1
	sw $t4, current_num

loop:
	lw $t0, upper_bound
	lw $t1, special_num
	lw $t2, current_num
	
	bgt $t2, $t0, endloop
	
	li $v0, 1
	move $a0, $t2
	syscall
	
	beq $t2, $t1, ifTrue
	
	addi $t2, $t2, 1
	
	sw $t2, current_num
	
	b loop
ifTrue:
	la $a0, exclamation
	li $v0, 4
	syscall
	
	addi $t2, $t2, 1
	
	sw $t2, current_num
	
	b loop

endloop:
	jr $ra
