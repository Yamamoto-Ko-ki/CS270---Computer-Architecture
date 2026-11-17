#Excersize 7
	.data
a:	.word 1
b:	.word 2
c:	.word 4
d:	.word 8
	
	.text
main:
	lw $t0, a
	lw $t1, b
	lw $t2, c
	lw $t3, d
	
	sll $t0, $t0, 24
	sll $t1, $t1, 16
	sll $t2, $t2, 8
	
	or $t0, $t0, $t1
	or $t0, $t0, $t2
	or $t0, $t0, $t3
	
	li $v0, 1
	move $a0, $t0
	syscall
	
	li $v0, 10
	syscall
	
	
	
