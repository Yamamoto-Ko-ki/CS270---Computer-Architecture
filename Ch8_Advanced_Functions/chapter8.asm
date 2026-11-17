# CS270 Chapter 8 - study notes / code written while learning
# REFERENCE COLLECTION ONLY: individual snippets may redefine main/loop.
# This file is not intended to be assembled as a single program.
# Original source files are saved in _Original_Uploads.


# ========================================================================
# Practice: loop calls double_number and sums results
# Original: AdvancedFunction.asm, lines 1-63
# ========================================================================

.text
.globl main

main:
    # Create stack frame (32 bytes)
    addiu $sp, $sp, -32
    sw $ra, 28($sp)
    sw $s0, 24($sp)
    sw $s1, 20($sp)

    li $s0, 1       # i = 1
    li $s1, 0       # sum = 0

loop:
    # 1. Exit if i > 4
    bgt $s0, 4, done


    # 2. Pass i to double_number
    move $a0, $s0

    # 3. Call double_number
    jal double_number

    # 4. Add returned result to sum
    addi $s1, $s1, $v0


    # 5. Increase i by 1
    addi $s0, $s0, 1

    b loop

done:
    # Print result
    move $a0, $s1
    li $v0, 1
    syscall

    # Restore registers
    lw $s1, 20($sp)
    lw $s0, 24($sp)
    lw $ra, 28($sp)
    addiu $sp, $sp, 32

    li $v0, 10
    syscall

double_number:
    addiu $sp, $sp, -24
    sw $ra, 20($sp)

    # 6. Multiply argument by 2
    mul $a0, $a0, 2
    # Store result in $v0
    move $v0, $a0

    lw $ra, 20($sp)
    addiu $sp, $sp, 24
    jr $ra
    
    
    

# ========================================================================
# Practice: sneaky function stores number through a pointer
# Original: AdvancedFunction.asm, lines 64-114
# ========================================================================

#Sneakey Function    
	 .text
	.globl main

main:
    addiu $sp, $sp, -32
    sw $ra, 28($sp)

    # 1. Put the address of 24($sp)
    #    into $a0
    addiu $a0, $sp, 24


    # 2. Put 75 into $a1
    li $a1, 75


    # 3. Call store_number
    jal store_number

    # 4. Load the stored number
    #    from 24($sp) into $a0
    lw $a0, 24($sp)


    li $v0, 1
    syscall

    lw $ra, 28($sp)
    addiu $sp, $sp, 32

    li $v0, 10
    syscall


store_number:
    addiu $sp, $sp, -24
    sw $ra, 20($sp)

    # 5. Store the value in $a1
    #    at the address in $a0
    sw $a1, 0($a0)

    # 6. Return success status (1)
    li $v0, 1

    lw $ra, 20($sp)
    addiu $sp, $sp, 24
    jr $ra
    
    

# ========================================================================
# Practice: write characters C A T ! to a string
# Original: AdvancedFunction.asm, lines 115-177
# ========================================================================

#
.data
my_string: .space 5

.text
.globl main

main:
    addiu $sp, $sp, -24
    sw $ra, 20($sp)

    # 1. Load the address of my_string
    #    into $a0
    la $a0, my_string


    li $a1, 'C'
    li $a2, 'A'
    li $a3, 'T'

    jal write_chars

    # Print the completed string
    la $a0, my_string
    li $v0, 4
    syscall

    lw $ra, 20($sp)
    addiu $sp, $sp, 24

    li $v0, 10
    syscall


write_chars:
    addiu $sp, $sp, -24
    sw $ra, 20($sp)

    # 2. Store C at offset 0
    sb $a1, 0($a0)
    # 3. Store A at offset 1
    sb $a2, 1($a0)

    # 4. Store T at offset 2
    sb $a3, 2($a0)

    # 5. Store ! at offset 3
    # Hint: Load ! into $t0 first
    li $t0, '!'
    sb $t0, 3($a0)


    # 6. Store null terminator at offset 4
    # Hint: $zero contains 0
    sb $zero, 4($a0)

    # 7. Return success status 1
    li $v0, 1

    lw $ra, 20($sp)
    addiu $sp, $sp, 24
    jr $ra
    

# ========================================================================
# Practice: 8.4 saving function arguments
# Original: AdvancedFunction.asm, lines 178-245
# ========================================================================

#8.4
.text
.globl main

main:
    addiu $sp, $sp, -32
    sw $ra, 28($sp)

    li $a0, 10
    li $a1, 20

    jal add_numbers

    # Print result
    move $a0, $v0
    li $v0, 1
    syscall

    lw $ra, 28($sp)
    addiu $sp, $sp, 32

    li $v0, 10
    syscall


add_numbers:
    addiu $sp, $sp, -24
    sw $ra, 20($sp)

    # 1. Save $a0 at 24($sp)
     sw $a0, 24($sp)
     
    # 2. Save $a1 at 28($sp)
    sw $a1, 28($sp)


    # This function changes $a0 and $a1
    jal change_arguments

    # 3. Restore original $a0 into $t0
    move $t0, $a0

    # 4. Restore original $a1 into $t1
    move $t1, $a1

    # 5. Add $t0 and $t1
    # Store result in $v0
    add $v0, $t0, $t1


    lw $ra, 20($sp)
    addiu $sp, $sp, 24
    jr $ra


change_arguments:
    addiu $sp, $sp, -24
    sw $ra, 20($sp)

    li $a0, 100
    li $a1, 200

    lw $ra, 20($sp)
    addiu $sp, $sp, 24
    jr $ra
    
   
   
