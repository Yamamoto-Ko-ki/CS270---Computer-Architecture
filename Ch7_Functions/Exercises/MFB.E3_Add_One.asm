#3 Add one
	.data
	.text
	.globl main
main:
	addi $sp, $sp, -24
	sw $ra, 20($sp)
	
	li $a0, 9
	
	jal add_one
	
	move $a0, $v0
	li $v0, 1
	syscall 
	
	lw $ra, 20($sp)
	addi $sp, $sp, 24
	
	jr $ra

add_one:
	addi $v0, $a0, 1
	
	jr $ra
	
			
	
	
