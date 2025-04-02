.data
	pedirWord:	.asciiz "Dime una palabra: "
	mostrarWord:	.asciiz "La palabra es: "
	palabra:		.space 30

.text
	main:
		li 	$v0, 4
		la	$a0, pedirWord
		syscall
		
		li 	$v0, 8
		la	$a0, palabra
		la	$a1, 30
		syscall
		
		li	$v0, 4
		la	$a0, mostrarWord
		syscall
		
		li	$v0, 4
		la	$a0, palabra
		syscall
		
		li	$v0, 10
		syscall
		