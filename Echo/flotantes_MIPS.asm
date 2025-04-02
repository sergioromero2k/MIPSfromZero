.data
	numero: .word 6 # Definimos un entero li 1
	numero_f1: .float  7.5 # Definimos un numero flotante li 2
	numero_f2: .float 33.3 # Definimos un número flotante li 2 
	numero_f3: .float 45454545.9 # Definimos un número flotante li 2
.text
	li $v0, 2
	lwc1 $f12, numero_f1
	syscall 
	
	li $v0, 1
	lw $a0, numero
	syscall
	
	li $v0, 2
	lwc1 $f12, numero_f2
	syscall 

	li $v0, 2
	lwc1 $f12, numero_f3
	syscall
	
	li $v0, 10
	syscall