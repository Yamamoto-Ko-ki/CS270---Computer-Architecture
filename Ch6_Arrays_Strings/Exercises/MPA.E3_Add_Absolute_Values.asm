#Exc 3:
		.data
array:		.word 4, -2, 9, -5, 0, 1, -7
array_size:	.word 7
		.text
		.globl main
main:
		la $t0, array
		li $t1, 0 #index
		lw $t2, array_size
		li $t6, 0 #total value
loop:
		bge $t1, $t2, endloop
		
		sll $t3, $t1, 2
		add $t4, $t3, $t0
		lw $t5, ($t4)
		
		bltz $t5, ConvPosi
		
		add $t6, $t6, $t5
		
		addi $t1, $t1, 1
		
		b loop
			
						
		#if num < 0:
			#num = 0 - num			
ConvPosi:
		sub $t5, $zero, $t5
		add $t6, $t6, $t5
		addi $t1, $t1, 1
		b loop

endloop:
		li $v0, 1
		move $a0, $t6
		syscall 
		
		li $v0, 10
		syscall
		
		jr $ra
		
