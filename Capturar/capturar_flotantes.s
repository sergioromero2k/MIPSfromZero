.data 
    mensaje1: .asciiz "Ingresa tu numero"
    mensaje2: .asciiz "Este es tu numero"

.text
    main:
        li $v0, 4
        la $a0, mensaje1
        syscall

        li $v0, 6        # Con 6 capturas para FLOTANTES, Aqui no es necesario hacer un move, en flotantes y doubles el v0 -> f0, se guarda por defecto
        syscall

        li $v0, 4
        la $a0, mensaje2
        syscall

        li $v0, 2               # Aqui no hay un palabra reservada como el move, aqui hay que hacer una suma, add.s para flotantes
        add.s $f12, $f1, $f0    # f12 = f1 + f0 = 0.0. + 5.5, por defecto el f1 vale 0.0 
        syscall 

        li $v0, 10
        syscall
		