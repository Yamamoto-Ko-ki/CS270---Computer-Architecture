#Excersize 5
	.data
x:	.word 0
y: 	.word 0
prompt: .asciiz "Enter number: "
	.text
main:
	li $v0, 4
	la $a0, prompt
	syscall
	
	li $v0, 5
	syscall 
	la $t0, x
	sw $v0, 0($t0)
	
	li $v0, 4
	la $a0, prompt
	syscall
	
	li $v0, 5
	syscall 
	la $t1, y
	sw $v0, 0($t1)
	
	lw $t2, x
	lw $t3, y
	
	add $t4, $t2, $t3
	li $v0, 1
	move $a0, $t4
	syscall
	
	li $v0, 10
	syscall
	
