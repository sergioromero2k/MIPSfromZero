.data
	mensaje: .asciiz "La suma es: "

.text
	sumar:				# Función que suma 2 números
		addi	$sp, $sp, -8 	# Reservar espacio en la pila
		sw 	$ra, 4($sp)	# Guardar la dirección de retorno
		sw	$s0, 0($sp)	# Guardar el registro s0
	
		# Operación de la suma
		add	$v0, $a0, $a1	# $v0 = $a0 + $a1
	
		# Restaurar registros
		lw	$ra, 4($sp)	# Recuperar la dirección de retorno
		lw	$s0, 0($sp) 	# Recuperar el registro s0
		addi	$sp, $so, 8	# Liberar espacio de la pila
	
	
		jr	$ra 		# Regresar a la función que llamó a sumar
	
	main:				
					# Función principal (main)
		li	$a0, 5		# Primer número 5
		li	$a1, 10		# Segundo número 10
		
		jal sumar		# Llamar a la función sumar
		
		li	$v0, 4		# Código de servicio para imprimir cadena
		la 	$a0, mensaje	# Cargar la dirección a la cadena
		syscall			# Llamar al sistema
		
		li	$v0, 1		# Código de servicio para imprimir entero
		move	$a0, $v0		# Mover el resultado (la suma) a $a0
		syscall			# Llamar al sistema
		
		li $v0, 10             	# Código de servicio para terminar
   		syscall