.data
	mensaje1:	.asciiz "\n"
	num1:		.word 4
	num2:		.word 2

.text
	lw 	$s0, num1
	lw	$s1, num2
	
	
	li	$v0, 1
	div	$a0, $s0, $s1
	syscall
	
	mfhi 	$t5
	
	li	$v0, 4
	la	$a0, mensaje1
	syscall
	
	li 	$v0, 1
	move	$a0, $t5
	syscall
	
	li $v0, 10
	syscall