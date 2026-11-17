#Excersize 6
.data
prefix:     .asciiz "You typed: "
prompt:     .asciiz "Enter a string: "
my_string:  .space 40

.text
.globl main

main:
    addi $sp, $sp, -24
    sw $ra, 20($sp)

    la $a0, my_string
    li $a1, 40
    jal generate_echo_string

    la $a0, my_string
    jal PrintString

    lw $ra, 20($sp)
    addi $sp, $sp, 24
    jr $ra


generate_echo_string:
    addi $sp, $sp, -32
    sw $ra, 28($sp)
    sw $s0, 24($sp)
    sw $s1, 20($sp)
    sw $s2, 16($sp)

    move $s0, $a0
    move $s1, $a1

    addi $t0, $s1, -1
    add $t1, $s0, $t0
    sb $zero, 0($t1)

    la $a0, prefix
    jal strlen
    move $s2, $v0

    move $a0, $s0
    la $a1, prefix
    addi $a2, $s1, -1
    jal strncpy

    bge $s2, $s1, finish

    add $t0, $s0, $s2

    sub $t1, $s1, $s2

    la $a0, prompt
    move $a1, $t0
    move $a2, $t1
    jal InputConsoleString

finish:
    lw $s2, 16($sp)
    lw $s1, 20($sp)
    lw $s0, 24($sp)
    lw $ra, 28($sp)

    addi $sp, $sp, 32
    jr $ra

.include "./util.s"
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
