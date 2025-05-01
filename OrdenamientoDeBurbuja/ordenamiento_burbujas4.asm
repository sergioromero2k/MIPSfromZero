.data
	array: 		.word 4, 1, 1, 6, 9, 9,8 
	pedir_orden:	.asciiz  "Dime el tipo de ordenamiento ASC=0 o DESC=1: "
.text
		la 	$t0, array	# Dirección de memoria del array.
		li	$t2, 6		# Longitud que recorrera el bucle for 0,1,2,3,4,5,6  => 7 posiciones
		li	$t1, 0		# Valor de la posición inicial del array (i)
		li 	$s0, 0		# Valor inicial de interaccion del array, servira para recorrer el array verificar que esta correcto el "asc" o "desc"
	
	orden_valida:
		li	$v0, 4
		la	$a0, pedir_orden
		syscall	
		
		li	$v0, 5
		syscall
		move	$s2, $v0
		
	for:
		beq   	$t1,$t2,fin_for 
		
		lw 	$t3, 0($t0)
		lw	$t4, 4($t0)
		
		beq	$s2,0, comparar_valores_ASC
		beq	$s2,1, comparar_valores_DES
		
		j orden_valida
		
	comparar_valores_ASC:
		bgt 	$t3,$t4, cambiar_pos
		j	aumento_for
		
	comparar_valores_DES:
		blt  	$t3,$t4, cambiar_pos
		j	aumento_for	
		
	cambiar_pos:
		sw 	$t3, 4($t0)	# Cambiamos e posición en el array.
		sw	$t4, 0($t0)
		
		lw	$t3, 0($t0)
		lw	$t4, 4($t0)
		j	aumento_for
	
	aumento_for:
		addi	$t0, $t0, 4
		addi	$t1, $t1, 1
		jal 	for
		
	fin_for:
		la 	$t0, array	# Dirección de memoria del array.
		li	$t1, 0		# Establecemos de nuevo el valor de la posición inicial del array (i) a 0.
		
		addi	$s0,$s0, 1		# Aumenta el contador de array, cuando se verifica que todo esta en "ASC" o "DES"
		beq	$s0, $t2, print_array	#  Si $s0 (6) == $t2 (6), salta a pintar el array.
		jal	for
		
	print_array:			# Función para pintar el array ordenado
		bgt  	$t1,$t2,fin	
		lw	$s1, 0($t0)	# Guardamos en $s1 = la posiciones del array
		
		li	$v0, 1		# Pintamos el valor de array, en esa posición.
		move	$a0, $s1
		syscall
		
		addi	$t1, $t1, 1	# Aumentamos el contador+1
		addi 	$t0, $t0, 4
		
		jal 	print_array

	fin:
		li $v0, 10
		syscall