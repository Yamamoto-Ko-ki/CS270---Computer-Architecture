#Excersize 2
	.data
my_string:.asciiz "Hello"
	.text
	.globl main
main:
	 addi $sp, $sp, -24
	 sw $ra, 20($sp)
	 
	 la $a0, my_string
	 
	 jal replace_start_with_z
	 
	 la $a0, my_string
	 
	 jal PrintString
	 
	 lw $ra, 20($sp)
	 
	 addi $sp, $sp, 24
	 
	 jr $ra
	 
replace_start_with_z:
	addi $sp, $sp, -24
	sw $ra, 20($sp)
	
	sw $s0, 16($sp)
	move $s0, $a0
	
	jal strlen
	
	beq $v0, $zero, end_if
	li $t0, 'Z'
	sb $t0, ($s0)

end_if:
	lw $s0, 16($sp)
	lw $ra, 20($sp)
	
	addi $sp, $sp, 24
	jr $ra
	
	
.include "./util.s"
