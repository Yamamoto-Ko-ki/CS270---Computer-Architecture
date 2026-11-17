#Excersize 4
	.data
x:	.word 7
y:	.word 2

	.text 
main:
	lw $t0, x
	lw $t1, y
	add $t2, $t0, $t1
	
	li $v0, 1
	move $a0, $t2
	syscall
	
	li $v0, 10
	syscall
	
	
