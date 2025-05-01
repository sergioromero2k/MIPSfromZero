.data
	longitud_array:	.asciiz "Dime la longitud del array: "
	valores_array:	.asciiz "Dime un valor del array: "
	pedir_orden:	.asciiz  "Dime el tipo de ordenamiento ASC=0 o DESC=1: "
.text
		
		li	$v0, 4
		la 	$a0, longitud_array
		syscall
		
		li	$v0, 5
		syscall	
		move	$t2, $v0		# Longitud del array
		
		li	$s3, 4 		# Avance del array
		mul 	$s4, $s2, $s2	# Espacio en memoria para el array
		
		li	$v0, 9		# Creación del array
		move	$a0, $s4		# Tamaño en bytes
		syscall
		
		move 	$t0, $v0		# Dirección de memoria del array.
		li	$t1, 1		# Valor de la posición inicial del array (i)
		li 	$s0, 1		# Valor inicial de interaccion del array, servira para recorrer el array verificar que esta correcto el "asc" o "desc"
	
	creacion_array_for:
	
		bgt 	$t1, $t2, orden_valida
		
		li	$v0, 4
		la 	$a0, valores_array
		syscall
		
		li	$v0, 5
		syscall
		sw 	$v0, 0($t0)
		
		addi	$t0, $t0, 4
		addi	$t1, $t1, 1
		
		j	creacion_array_for
		
	orden_valida:
		li	$v0, 4
		la	$a0, pedir_orden
		syscall	
		
		li	$v0, 5
		syscall
		move	$s2, $v0
		
		li 	$s0, 1		# Volvemos a inciar el indice
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
		li	$t1, 1			# Establecemos de nuevo el valor de la posición inicial del array (i) a 0.
		
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