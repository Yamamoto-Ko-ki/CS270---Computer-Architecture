# CS270 Chapter 6 - study notes / code written while learning
# REFERENCE COLLECTION ONLY: individual snippets may redefine main/loop.
# This file is not intended to be assembled as a single program.
# Original source files are saved in _Original_Uploads.


# ========================================================================
# Practice: array element modifications (incomplete loop)
# Original: PointerAndArray.asm, lines 1-38
# ========================================================================

	.data
nums:	.word 1, 2, 3, 4, 5
	     #1, 6, 3, 12, 5 	
size: 	.word 5
	.text
	.globl main
	
main:
	la $t0, nums
	lw $t1, size
	li $t2, 0

loop:
	bge $t2, $t1, endloop
	
	sll $t3, $t2, 2
	add $t4, $t3, $t0
	lw $t5, ($t4)
	
	andi $t6, $t5, 1
	
	beq $t6, $zero, evenCase
	
	add $t7, $t5, $t5
	
	add $t5, $t5, $t7
	
	sw $t5, ($t4)
	
	b loop
	
evenCase:


endloop:
	jr $ra
	
	

# ========================================================================
# Practice: scanning a string
# Original: PointerAndArray.asm, lines 39-59
# ========================================================================

	.data
word: 	.asciiz "HELLO"
	.text
	.globl main
main:
	la $t0, word #base addrress
	li $t1, 0 # index

loop:
	add $t2, $t0, $t1 #calculate index
	lb $t3, ($t2)
	
	beq $t3, $zero, endloop
	
	addi $t1, $t1, 1
	
	b loop
	
endloop:
	jr $ra
	

# ========================================================================
# Practice: replace lowercase a with uppercase A
# Original: PointerAndArray.asm, lines 60-88
# ========================================================================

	.data
word:	.asciiz "banana"
	.text
	.globl main
main:
	la $t0, word
	li $t1, 0 #index
loop:
	add $t2, $t1, $t0
	lb $t3, ($t2)
	
	beq $t3, $zero, endloop
	
	li $t4, 'a'
	
	beq $t3, $t4, modify
	
	b next
modify:
	li $t5, 'A'
	sb $t5, ($t2)
next:
	addi $t1, $t1, 1
	b loop
endloop:
	jr $ra
	
	
