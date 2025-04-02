.data
	array: 	.word 1, 2, 3, 4, 5, 7
	
.text
	li	$t0, 0		# Definimos i=0
	la	$t1, array	# Cargamos de memoria el array
	
	lw	$t2, 0($t1)	# Cargamos la dirección del array[0]  en $t2
	lw	$t3, 4($t1)	# Cargamos la dirección del array[1]  en $t3
	lw	$t4, 8($t1)	# Cargamos la dirección del array[2]  en $t4
	
	li	$v0, 1		# Pintar el array
	move	$a0, $t2
	syscall
	
	li	$v0, 10
	syscall