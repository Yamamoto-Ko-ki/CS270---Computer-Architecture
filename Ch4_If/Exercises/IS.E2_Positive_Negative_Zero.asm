#EX2
	.data
prompt: .asciiz "Enter number: "
positive: .asciiz "positive"
negative: .asciiz "negative"
zero: .asciiz "zero"
	.text
main:
	li $v0, 4
	la $a0, prompt
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	li $t1, 0
	
	beq $t0, $t1, ItsZero
	blt $t0, $t1, ItsNegative
	b ItsPositive
	
	
ItsZero:
	li $v0, 4
	la $a0, zero
	syscall
	
	li $v0, 10
	syscall
	
ItsPositive:
	li $v0, 4
	la $a0, positive
	syscall
	
	li $v0, 10
	syscall
ItsNegative:
	li $v0, 4
	la $a0, negative
	syscall
	
	li $v0, 10
	syscall
