.data	# Inicio de sesión de datos estaticos, 0x10010000

.globl main
.text	# Inicio de sesión de código fuente, 0x00400000
	main:
		li 	$t0, 8
		li 	$t1, 2
		li	$t2, 3
		li	$t3, 5
		
		add   	$t4, $t0, $t1
		add 	$t5, $t2, $t3
		sub 	$t6, $t5, $t4
		
		li $v0, 1
		move $a0, $t6
		syscall
		
	li $v0, 10
	syscall
	