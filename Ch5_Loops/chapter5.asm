# CS270 Chapter 5 - study notes / code written while learning
# REFERENCE COLLECTION ONLY: individual snippets may redefine main/loop.
# This file is not intended to be assembled as a single program.
# Original source files are saved in _Original_Uploads.


# ========================================================================
# Practice #1: counting down
# Original: ForANDWhile.asm, lines 1-15
# ========================================================================

#1
		.text
	.globl main
main:
	li $t0, 10
	
loop:
	blt $t0, 3, endloop
	
	subi $t0, 1
	
	b loop
	
endloop:

# ========================================================================
# Practice #2: counting down (same as #1)
# Original: ForANDWhile.asm, lines 16-30
# ========================================================================

#2
	.text
	.globl main
main:
	li $t0, 10
	
loop:
	blt $t0, 3, endloop
	
	subi $t0, 1
	
	b loop
	
endloop:

# ========================================================================
# Practice #3A: break at seven
# Original: ForANDWhile.asm, lines 31-44
# ========================================================================

#3
	.text
	.globl main
main:
	li $t0, 0
loop:
	bgt $t0, 20, endloop
	
	beq $t0, 7, endloop
	
	b loop

endloop:

# ========================================================================
# Practice #3B: sum if over two
# Original: ForANDWhile.asm, lines 45-62
# ========================================================================

#3
	.text
	.globl main
main:
	li $t0, 0
	li $t1, 0
loop:
	bge $t0, 6, endloop
	
	ble $t0, 2, endif
	
	add $t1, $t1, $t0
	
endif:
	addi $t0, $t0, 1
	b loop
endloop:

# ========================================================================
# Practice #4: if-else in loop
# Original: ForANDWhile.asm, lines 63-86
# ========================================================================

#4
	.text
	.globl main
main:
	li $t0, 0
	li $t1, 0
	li $t2, 0
loop:
	bge $t0, 6, endloop
	ble $t0, 3, else
	
	add $t1, $t1, $t0
	
	b ifEnd
	
else:
	add $t2, $t2, $t0

ifEnd:
	addi $t0, $t0, 1
	b loop

endloop:

# ========================================================================
# Practice #5: multiple conditions in a loop
# Original: ForANDWhile.asm, lines 87-105
# ========================================================================

#5
	.text
	.globl main
main:
	li $t0, 0
	li $t1, 0
loop:
	bge $t0, 8, endloop
	ble $t0, 2, ifEnd
	bge $t0, 6, ifEnd
	
	add $t1, $t1, $t0
	
ifEnd:
	addi $t0, $t0, 1
	b loop

endloop:
