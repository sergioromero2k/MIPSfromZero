.data 
	pedirNum: 	.asciiz "Dime un número: "
	mostrarNum: 	.asciiz "El número es: "
.text
	main:
		li 	$v0, 4
		la	$a0, pedirNum
		syscall
		
		li	$v0,7
		syscall
		
		li	$v0, 4
		la	$a0, mostrarNum
		syscall
		
		li	$v0, 3
		add.d	$f12, $f0, $f4
		syscall
		 
		
		li $v0, 10
		syscall