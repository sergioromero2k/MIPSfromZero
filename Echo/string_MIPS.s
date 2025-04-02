.data
	num: .word 10
	num_flo: .float 5.5
	num_dob: .double 4.15
	palabra: .asciiz "Hola Pepe Johns"
	palabra2: .asciiz " Nene, ¿Como estais?"
	palabra3: .asciiz " Jajajajaja bien y vos??"  
	palabra4: .asciiz " Allí le estamos dando, bad day"
.text
	li $v0, 4
	la $a0, palabra
	syscall
	
	li $v0, 4
	la $a0, palabra2
	syscall
	
	li $v0, 4
	la $a0, palabra3
	syscall
	
	li $v0, 4
	la $a0, palabra4
	syscall
	
	li $v0, 10
	syscall