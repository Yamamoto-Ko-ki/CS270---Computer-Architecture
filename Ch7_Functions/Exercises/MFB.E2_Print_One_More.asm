#2 Print one or more
	.data
	.text
	.globl main
main:
	addi $sp, $sp, -24
	sw $ra, 20($sp)
	
	li $a0, 9
	
	jal print_one_more
	
	lw $ra, 20($sp)
	addi $sp, $sp, 24
	
	jr $ra

print_one_more:
	addi $a0, $a0, 1
	li $v0, 1
	syscall 
	
	jr $ra
	
