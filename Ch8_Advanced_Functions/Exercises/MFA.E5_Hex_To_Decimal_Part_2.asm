#Excersize 5
.data
my_string: .space 40
prompt: .asciiz "Enter a hexadecimal number: "
error: .asciiz "Invalid hexadecimal number.\n"

.text
.globl main

main:
    addi $sp, $sp, -24
    sw $ra, 20($sp)

loop:
    la $a0, prompt
    la $a1, my_string
    li $a2, 40
    jal InputConsoleString

    addi $a0, $sp, 16
    la $a1, my_string
    jal axtoi

    beq $v0, $zero, invalid

    lw $a0, 16($sp)
    jal PrintInteger
    b end_loop

invalid:
    la $a0, error
    jal PrintString
    b loop

end_loop:
    lw $ra, 20($sp)
    addi $sp, $sp, 24
    jr $ra

.include "./util.s"
  
