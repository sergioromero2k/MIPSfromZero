.data
	pedirNum: 	.asciiz "Dime un numero: "
	mostrarNum:	.asciiz "El número es: "
	
.text
	main:
		li	$v0,4
		la	$a0, pedirNum
		syscall
		
		li 	$v0, 5	# Captura un entero con 5 para ENTEROS, sino lo guardamos el valor de $v0 se va a ir perdiendo.
		syscall
		move	$t0, $v0	# move, palabra reservada para especificamente enteros.
		
		li	$v0, 4
		la	$a0, mostrarNum
		syscall
		
		li	$v0, 1
		move	$a0, $t0
		syscall
		
		li 	$v0, 10
		syscall
