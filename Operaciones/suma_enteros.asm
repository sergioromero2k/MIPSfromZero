.data
	num1:	.asciiz "Dime un número: "
	num2:	.asciiz "Dime un 2do número: "
	resul:	.asciiz "El resultado de la suma es: "
	
.text
	main:
		li $v0, 4
		la $a0, num1
		syscall
		
		li $v0, 5
		syscall
		move $t0, $v0
		
		li $v0, 4
		la $a0, num2
		syscall	 
		
		li $v0, 5
		syscall
		move $t1, $v0
		
		li $v0, 4
		la $a0, resul
		syscall	 
		
		li $v0, 1
		add $a0, $t0, $t1
		syscall
		
		li $v0, 10
		syscall