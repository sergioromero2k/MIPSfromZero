.data
    mensaje1:   .asciiz "La multiplicación es "
    numero1:    .word 5
    numero2:    .word 4

.text
    main:

        lw 	$t0, numero1
        lw 	$t1, numero2

        li 	$v0, 4
        la 	$a0, mensaje1
        syscall

        li 	$v0, 1
        mul	$a0, $t0, $t1	# t0 - t1
        syscall	
        
        li 	$v0, 10
        syscall