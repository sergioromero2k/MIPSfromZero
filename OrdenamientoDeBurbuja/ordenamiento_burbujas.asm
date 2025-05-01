.data
	array: 		.word 6, 4, 3, 8, 2, 1 
	salto_linea:	.asciiz "\n"
.text
		la 	$t0, array	# Dirección de memoria del array.
		li	$t2, 5		# Longitud del array
		li	$t1, 0		# Valor de la posición inicial del array (i)
		li 	$s0, 0		# Contador interacciones array
		
	for:
		beq   	$t1,$t2,fin_for 
		
		lw 	$t3, 0($t0)
		lw	$t4, 4($t0)
		
		bgt 	$t3,$t4, comparar_datos
		
		j	pintar_numero
		
	comparar_datos:
		sw 	$t3, 4($t0)
		sw	$t4, 0($t0)
		
		lw	$t3, 0($t0)
		lw	$t4, 4($t0)
		j	pintar_numero
	
	pintar_numero:
		li  	$v0, 1
		move 	$a0, $t3
		syscall
		
		j	aumento_for
		
	aumento_for:
		addi	$t0, $t0, 4
		addi	$t1, $t1, 1
		jal 	for
		
	fin_for:
		li  	$v0, 1
		move 	$a0, $t4
		syscall
		
		li	$v0, 4
		la	$a0, salto_linea
		syscall	
		
		la 	$t0, array	# Dirección de memoria del array.
		li	$t1, 0
		
		addi	$s0,$s0, 1
		beq	$s0, $t2, fin
		jal	for

	fin:
		li $v0, 10
		syscall
