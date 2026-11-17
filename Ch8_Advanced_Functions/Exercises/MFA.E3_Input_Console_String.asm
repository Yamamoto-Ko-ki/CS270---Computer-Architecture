#Excersuze 3
			
	.data
prompt: .asciiz "Enter a string:"
my_string: .space 40
	.text
	.globl main
main:
	addi $sp, $sp, -24
	sw $ra, 20($sp)
	
	la $a0, prompt #Address of the prompt
	la $a1, my_string
	li $a2, 40
	
	jal InputConsoleString
	
	la $a0, my_string
	jal PrintString
	
	lw $ra, 20($sp)
	addi $sp, $sp, 24
	jr $ra
	
.include "./util.s"
