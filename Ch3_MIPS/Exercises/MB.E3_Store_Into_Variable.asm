#Excersize 3
        .data
x:      .word 7

        .text
        .globl main
main:
	la $t0, x
        li $t1, 12
        sw $t1, 0($t0)


        jr $ra
        
