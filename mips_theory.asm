.data
	palabra: .asciiz "Hola mundo"

.text 
	main:
	
	li $v0, 4
	la $a0, palabra
	syscall 