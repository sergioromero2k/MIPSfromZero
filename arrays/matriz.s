.data
	matriz:	.word 1,2,3
		.word 4,5,6
		.word 7,8,1
		
.text
	la	$t0, matriz
	li	$t1, 1		# Cogemos la fila 1
	li	$t2, 2		# Cogemos la columna 2 
	li	$t3, 3		# Número de columnas

	mul 	$t4, $t1,$t3
	add	$t4, $t4,$t2
	mul 	$t4, $t4, 4
	
	add	$t5, $t0, $t4
	lw	$t6, 0($t5)
	
	li	$v0, 1
	move	$a0, $t6
	syscall
	
	li	$v0, 10
	syscall