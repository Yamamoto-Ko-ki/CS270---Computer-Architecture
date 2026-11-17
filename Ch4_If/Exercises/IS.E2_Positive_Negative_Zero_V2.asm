		.data
prompt:		.asciiz "Enter number" 
negative_prompt:.asciiz "positive"
positive_prompt:.asciiz "negative"
zero_prompt:	.asciiz "zero"
		.text
main:
		la $a0, prompt
		li $v0, 4
		syscall
		
		li $v0, 5
		syscall
		
		move $t1, $v0
		
		beqz $t1, zeroCase
		blt $t1, $zero, negativeCase
		bgt $t1, $zero, positiveCaes
		
		b endif
zeroCase:
	la $a0, zero_prompt
	li $v0, 4
	syscall
	b endif
negativeCase:
	la $a0, negative_prompt
	li $v0, 4
	syscall
	b endif
positiveCase:
	la $a0, positive_prompt
	li $v0, 4
	syscall
endif:
	li $v0, 10 
	syscall
