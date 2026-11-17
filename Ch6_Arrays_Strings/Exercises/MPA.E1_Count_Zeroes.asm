#Exc 1
		.data
array:		.word 4, 3, 0, 2, 0, 9
array_size:	.word 6
		.text
		.globl main
main:
		la $t0, array
		lw $t1, array_size
		li $t2, 0 #index
		li $t3, 0 #0 counter
loop:
		bge $t2, $t1, endloop
		
		sll $t4, $t2, 2
		add $t5, $t4, $t0
		lw $t6, ($t5)
		
		beq $t6, $zero, zeroCase
		
		addi $t2, $t2, 1
		b loop
zeroCase:		
		addi $t3, $t3, 1 
		addi $t2, $t2, 1
		b loop
endloop:
		li $v0, 1
		move $a0, $t3
		syscall
		
		jr $ra
		
		
