.data
	result:	.asciiz "La suma es: "
	num1:	.word 5
	num2:	.word 10

.text
	lw	$t0, num1
	lw	$t1, num2
	
	li 	$v0, 4
	la	$a0, result
	syscall
	
	li 	$v0, 1
	add 	$a0, $t0, $t1
	syscall
	
	li 	$v0, 10
	syscall
	
	