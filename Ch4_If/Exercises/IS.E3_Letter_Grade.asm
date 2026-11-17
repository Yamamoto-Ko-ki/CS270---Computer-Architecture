#EX3
	.data
prompt: .asciiz "Enter percentage: "
A: .asciiz "A"
B: .asciiz "B"
C: .asciiz "C"
D: .asciiz "D"
F: .asciiz "F"

	.text
main:
	li $v0, 4
	la $a0, prompt
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	li $t1, 90
	li $t2, 80
	li $t3, 70
	li $t4, 60
	
	bge $t0, $t1, GradeA
	bge $t0, $t2, GradeB
	bge $t0, $t3, GradeC
	bge $t0, $t4, GradeD
	b GradeF

GradeA:
	li $v0, 4
	la $a0, A
	syscall
	
	li $v0, 10
	syscall
GradeB:
	li $v0, 4
	la $a0, B
	syscall
	
	li $v0, 10
	syscall
GradeC:
	li $v0, 4
	la $a0, C
	syscall
	
	li $v0, 10
	syscall
GradeD:
	li $v0, 4
	la $a0, D
	syscall
	
	li $v0, 10
	syscall
GradeF:
	li $v0, 4
	la $a0, F
	syscall
	
	li $v0, 10
	syscall
	
