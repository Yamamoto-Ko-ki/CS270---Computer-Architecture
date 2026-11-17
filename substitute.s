#
# substitute.s - substitute one character for another in a string
#
    .data
string: .space 80
orig:   .space 1
new:    .space 1
sprompt: .asciiz    "Enter string: "
oprompt: .asciiz    "Enter character you want to replace: "
nprompt: .asciiz    "Enter replacement character: "
rprompt: .asciiz    "The string with replacements: "
cprompt: .asciiz    "Number of replacements: "

    .text
    .globl  main
main:
	addiu 	$sp, $sp, 20
	sw	$ra, 16($sp)

    # get string
	la	$a0,sprompt
	li	$v0,4
	syscall

    	la      $a0,string
    	li      $a1,80
    	li      $v0,8
    	syscall

    # get original character
   	la      $a0,oprompt
	li	$v0,4
	syscall

    	li      $v0,12
    	syscall
	sb	$v0,orig
	
	# get new character
    	la      $a0,nprompt
	li		$v0,4
	syscall

	li      $v0,12
    	syscall
	sb		$v0,new

	la $a0, string
	lb $a1, orig
	lb $a2, new
	li $a3, 0
Lloop:
	lb $t0, 0($a0)
	beq $t0, $zero, Lloop_end
	
	bne $t0, $a1, Lnext
	
	sb $a2, 0($a0)
	addi $a3, $a3, 1
	
Lnext:
	addi $a0, $a0, 1
	b Lloop

    # This code will output the string. Before you write the code above, it will 
	# be exactly the string the user entered. Once you've added your code, you 
	# should see the string with replacements.
Lloop_end:
    li   $v0,4
    la   $a0,rprompt
    syscall

    li   $v0, 4
    la   $a0,string
    syscall

    # This code will output the count of replacements,
    # which must be stored in $a3.
    li   $v0, 4
    la   $a0,cprompt
    syscall

    li   $v0, 1
    move $a0, $a3
    syscall

    lw	$ra, 16($sp)
    addiu	$sp, $sp, 20
    
    li $v0, 10
    syscall