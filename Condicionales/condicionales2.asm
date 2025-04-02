.data
        	mensaje1:   	.asciiz "Es menor"
        	mensaje2:   	.asciiz "Es mayor"

.text
    	main:

        		add     	$t1, $zero, 5       # t1 = 0+5
        		add     	$t2, $zero, 4       # t2 != 0+4

        		bgt 	$t1, $t2, mayor
        		blt 	$t1, $t2, menor
        		
        		jal 	mayor
        		jal 	menor
        		
		li	$v0, 10
		syscall
	
	mayor:
		li	$v0, 4
		la	$a0, mensaje1
		syscall
	
		jr	$ra
	
	menor:
		li	$v0, 4
		la	$a0, mensaje2
		syscall
	
		jr	$ra
