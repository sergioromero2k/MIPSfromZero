.data 
	numero: .word 5	# Numero li 1 para enteros..
	numero2: .word 6
	numero3: .word 7
	numero4: .word 8	
	numero5: .word 9


.text 
	main:
	
	li $v0, 1
	lw $a0, numero
	syscall 
	
	li $v0, 1
	lw $a0, numero2
	syscall
	
	li $v0, 1
	lw $a0, numero3
	syscall
	
	li $v0, 1
	lw $a0, numero4
	syscall
	
	li $v0, 1
	lw $a0, numero5
	syscall
	
	li $v0, 10
	syscall