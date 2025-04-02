.data 
	mensaje1: .asciiz "Introduce el lado  1: "
	mensaje2: .asciiz "Introduce el lado  1: "
	mensaje3: .asciiz "El area del rectangulo es: "
	
	lado1: .space 4
	lado2: .space 4
	area:  .space 4
.text
	li $v0, 4
	la $a0, mensaje1
	syscall
	
	li $v0, 5
	move $s0, $v0
	la $t0, lado1
	sw $s0, 0($t0)
	syscall
	
	li $v0, 4
	la $a0, mensaje2
	move $s1, $v0
	la $t0, lado2
	sw $s1, 0($t0)
	syscall
	

	
	mul $s2, $s0, $s1
	la $t0, area
	sw $s2, 0($t0)
	
	li $v0, 4
	la $a0, area
	syscall
	
	li $v0, 10
	syscall
	