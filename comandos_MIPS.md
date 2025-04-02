# Summary MIPS
---

.data 
    Se guarda informacion en la memoria del procesador.
.text
    Se ejecuta para mostrar informacion en pantalla.
main
    asda

li $v0, 10
syscall
    De esta manera terminas la función main.

## Entorno de trabajo
---

.data

.text
    main:

    li $v0, 10
    syscall

## Tipos de variables
---

MIPS controla 4 tipos de variables
    - Enteros   .word 5
    - Floats
    - Doubles
    - Strings

### Entero
---
.data
	numero: .word 5

.text
	
	main:
	li $v0, 1
	lw $a0, numero  // Se usa $a0
	syscall

### Floats
---

.data
	flotante: .float 7.2

.text
	
	main:
	li $v0, 2
	lwc1 $f12, flotante
	syscall

### Doubles
---

.data
	numero: .double 5.255
	
.text
	main:
	
	li $v0, 3
	ldc1 $f12, numero
	syscall

### Doubles
---

.data
	palabra: .asciiz "Hola mundo"

.text 
	main:
	
	li $v0, 4
	la $a0, palabra
	syscall 