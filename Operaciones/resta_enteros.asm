.data
	result:	.asciiz "El resultado de la resta es: "
	num1: 	.word 15
	num2:	.word 3

.text
	lw	$s0, num1
	lw 	$s1, num2
	
	li 	$v0, 4
	la	$a0, result
	syscall
	
	li	$v0, 1
	sub	$a0, $s1, $s0
	syscall
	
	li	$v0, 10
	syscall