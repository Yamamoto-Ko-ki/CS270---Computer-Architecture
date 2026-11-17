	.data 
x:	.word 0

	.text
main:
	li $v0, 5
	syscall
	
	la $t0, x
	sw $v0, 0($t0)
	
	lw $a0, 0($t0)
	
	li $v0, 1
	syscall
	
	move $t1, $a0
	add $t1, $t1, $t1
	add $t1, $t1, $a0
	
	li $v0, 1
	move $a0, $t1
	syscall
	
	lw $t2, 0($t0)
	
	sra $t2, $t2, 1
	
	li $v0, 1
	move $a0, $t2
	syscall
	
	li $v0, 10
	syscall
	
	