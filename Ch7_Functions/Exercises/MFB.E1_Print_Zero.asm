#1 Print Zero
	.data
	.text
	.globl main
	
main:
	addi $sp, $sp, -24
	sw $ra, 20($sp)
	
	jal print_zero
	
	lw $ra, 20($sp)
	addi $sp, $sp, 24
	
	jr $ra
	
print_zero:
	li $a0, 0
	li $v0, 1
	syscall
	
	jr $ra
