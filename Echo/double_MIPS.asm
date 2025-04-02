.data 
	numero: .word 5
	num_flo: .float 6.6
	num_doub: .double 77.77
	num_doub2: .double 8.3322

.text
	main:
	
	li $v0, 3
	ldc1 $f12, num_doub 
	syscall
	
	li $v0, 3
	ldc1 $f12, num_doub2 
	syscall
	
	li $v0, 1
	lw $a0, numero
	syscall
	
	li $v0, 2
	lwc1 $f12, num_flo
	syscall
	
	li $v0, 10
	syscall 
	
	