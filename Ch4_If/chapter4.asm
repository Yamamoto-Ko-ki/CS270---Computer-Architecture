# CS270 Chapter 4 - study notes / code written while learning
# REFERENCE COLLECTION ONLY: individual snippets may redefine main/loop.
# This file is not intended to be assembled as a single program.
# Original source files are saved in _Original_Uploads.


# ========================================================================
# Branching practice: simple if, if-else, multi-branch, nested if
# Original: week3.asm, lines 1-69
# ========================================================================

	.text
main:
	li $t0, 12
	li $t1, 20
	
	blt $t0, $t1, less
	b endif

less:
	addi $t0, $t0, 10
	
endif: 

	.text
main:
	li $t0, 8
	li $t1, 5
	
	blt $t0, $t1, less
	b notless

less:
	addi $t0, $t0, 10
	b endif

notless:
	subi $t0, $t0, 2

endif:

	li $t0, 75
	li $t1, 0
	li $t2, 90
	
	bgt $t0, $t2, greater
	beq $t0, $t2, equal
	b less
	
greater:
	li $t1, 1
	b endif
equal:
	li $t1, 2
	b endif
less:
	li $t1, 3
endif:

#4
	.text
main:
	li $t0, 10
	li $t1, 5
	li $t2, 3
	li $t3, 7
	
	bgt $t0, $t1, OuterTrue
	b endif

OuterTrue:
	blt $t2, $t3, InnerTrue
	b endif
InnerTrue:
	li $t4, 100
endif:
	

	
