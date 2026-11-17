#Excersize 6
	.data
x:	.word 1

	.text
main:
	lw $t0, x
	sll $t1, $t0, 4
	or $t0, $t0, $t1
	
	li $v0, 1
	move $a0, $t0
	syscall
	
	li $v0, 10
	syscall
	
