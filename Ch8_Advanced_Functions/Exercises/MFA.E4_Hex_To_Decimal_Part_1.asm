#Excersize 4
.data
my_string: .space 40
prompt: .asciiz "Enter a hexadecimal number: "

.text
.globl main

main:
    addi $sp, $sp, -24
    sw $ra, 20($sp)

    la $a0, prompt        # Prompt address
    la $a1, my_string     # Input storage address
    li $a2, 40            # Buffer size

    jal InputConsoleString
    
    addi $a0, $sp, 16
    la $a1, my_string 

    jal axtoi

    lw $a0,16($sp)

    jal PrintInteger

    lw $ra, 20($sp)
    addi $sp, $sp, 24
    jr $ra

.include "./util.s"
