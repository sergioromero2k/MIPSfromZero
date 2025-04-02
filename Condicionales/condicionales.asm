.data
	mensaje1:   	.asciiz "Son iguales"
        	mensaje2:   	.asciiz "Son diferentes"

.text
    	main:

        		add     	$t1, $zero, 5       # t1 = 0+5
        		add     	$t2, $zero, 5       # t2 != 0+4
    
        		beq 	$t1, $t2, iguales
        		bne 	$t1, $t2, diferentes
        		
        		jal	iguales
        		jal 	diferentes
        		
		li	$v0, 10
		syscall
		
	iguales:
		li	$v0, 4
		la	$a0, mensaje1
		syscall
		
		jr 	$ra
			
	diferentes:
		li	$v0, 4
		la	$a0, mensaje2
		syscall
	
		jr 	$ra

