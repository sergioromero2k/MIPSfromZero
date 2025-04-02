.data	# Inicio sesión de datos estáticos, 0x10010000
	texto:	.asciiz "Hola Mundo!"	# Cadena de caracteres "texto"
					# Terminada en carácter "nulo"
.globl main
.text
	main:
		la	$a0, texto	# Inicio sesión de código fuente, 0x00400000
		li	$v0, 4		# Llamada al sistema para hacer la operación 4: imprimir cadena de texto
		syscall
		
		li	$v0, 10		# Llamada al sistema para hacer la operación 10: fin del programa
		syscall
	
	
