#EX1
		.data
prompt: .asciiz "Enter number: "
NumberTen: .asciiz "Ten!"
	.text
main:
	li $v0, 4
	la $a0, prompt
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	li $t1, 10
	beq $t0, $t1, equal
	b endif
	
equal:
	li $v0, 4
	la $a0, NumberTen
	syscall
	
	li $v0, 10
	syscall
	
endif:
	li $v0, 10
	syscall
	
