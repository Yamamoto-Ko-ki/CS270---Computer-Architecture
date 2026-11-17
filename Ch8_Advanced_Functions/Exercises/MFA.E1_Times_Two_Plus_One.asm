#Excersize 1
	.data
	.text
	.globl main
main:
	addi $sp, $sp, -24
	sw $ra, 20($sp)
	
	li $a0, -3
	
	jal times_two_plus_one
	
	move $a0, $v0
	li $v0, 1
	syscall 
	
	lw $ra, 20($sp)
	addi $sp, $sp, 24
	
	jr $ra
	
times_two_plus_one:
	addi $sp, $sp, -24
	sw $ra, 20($sp)
	
	jal multiply_by_two
	
	move $a0, $v0
	
	jal add_one
	
	lw $ra, 20($sp)
	addi $sp, $sp, 24
	jr $ra

multiply_by_two:
	sll $a0, $a0, 1
	move $v0, $a0
	
	jr $ra 
add_one:
	addi $v0, $a0, 1
	
	jr $ra

	
