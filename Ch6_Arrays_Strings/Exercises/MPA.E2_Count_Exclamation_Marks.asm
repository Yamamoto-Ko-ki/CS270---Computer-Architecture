#Exc 2
		.data
sentence:	.asciiz "Hi!! I'm! Koki!"
		.text
		.globl main
main:
		la $t0, sentence
		li $t1, 0 #index
		li $t2, 0 #counter
		li $t3, '!'

loop:
		add $t4, $t0, $t1
		lb $t5, ($t4)
		
		beq $t5, $zero, endloop
		
		beq $t3, $t5, exclamationContain
		
		addi $t1, $t1, 1
		
		b loop
exclamationContain:
		addi $t2, $t2, 1
		addi $t1, $t1, 1
		b loop
endloop: 
		li $v0, 1
		move $a0, $t2
		syscall
		
		li $v0, 10
		syscall
		
		jr $ra
