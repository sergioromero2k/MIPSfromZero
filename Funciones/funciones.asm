.data
.text
    main:
        add     $t0, $zero, 7
        add     $t1, $zero, 6

        jal suma                # Llamar a la función

    li      $v0, 10
    syscall

    suma:                       # Crear una función
        li      $v0, 1
        add     $a0, $t0, $t1
        syscall

    jr  $ra                     # Terminar la función
