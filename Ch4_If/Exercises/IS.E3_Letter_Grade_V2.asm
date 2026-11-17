	.data 
prompt: .asciiz "Enter percentage: "

	.text
	.globl main
main:
	la $a0, prompt
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	li $t1, 'A'
	li $t2, 'B'
	li $t3, 'C'
	li $t4, 'D'
	li $t5, 'F'
if:
	blt $t0, 60, F
	blt $t0, 70, D
	blt $t0, 80, C
	blt $t0, 90, B
	
	move $a0, $t1
	li $v0, 11
	syscall
	b endif
F:
	move $a0, $t5
	li $v0, 11
	syscall
	b endif
D:
	move $a0, $t4
	li $v0, 11
	syscall
	b endif
C:
	move $a0, $t3
	li $v0, 11
	syscall
	b endif
B:
	move $a0, $t2
	li $v0, 11
	syscall
endif:
	li $v0, 10
	syscall







	
	
