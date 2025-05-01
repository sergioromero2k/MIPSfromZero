.data
	# En este ejmplo lo hacemos, para matriz 3x3, pero si pruebas con otras dimensiones como 4x4,5x5,6x6... funcionara!!!
	m:      	.word   3,7,4,5,2 	# Matriz 3x3
        		.word   1,0,2,4,3
		.word   -2,9,8,9,4
        		.word   -2,9,8,7,6
        		.word   -2,9,8,7,9
        		
	dim_m:  .word   5   	# Dimensión de la matriz

	v:      	.word   1,2,3,4,3  	# Vector de dimensión n (3x1)
	w:      	.space  100  	# Espacio para el resultado del producto matriz-vector (3x1)

	salto:  	.asciiz "\n"
	texto1: 	.asciiz "Producto M * v: Es un vector cuya valores son: \n"
	texto2: 	.asciiz "\nSuma diagonal principal: "
	texto3: 	.asciiz "\nEl valor máximo y mínimo son los siguientes en la fila "

.text

    la  	$t0, m          	# Dirección de la matriz M
    la  	$t1, v          	# Dirección del vector V
    la  	$t3, w          	# Dirección del vector W (resultado)
    lw  	$t2, dim_m      	# Cargar dimensión de la matriz (n)
    li  	$t4, 0          	# Índice fila
    li  	$t5, 0          	# Suma de la diagonal principal

    li  	$v0, 4		# Imprimir encabezado
    la  	$a0, texto1
    syscall

producto_mv:
    beq 	$t4, $t2, fin_producto	 # Si hemos procesado todas las filas, terminamos
    li  	$t6, 0  			 # Índice columna (j=0)
    li  	$t7, 0  			 # Valor acumulador para w[i]
    lw  	$t8, dim_m

fila_loop:
    beq $t6, $t2, guardar_resultado
    
    mul $t9, $t4, $t8   		# fila * dim.
    add $t9, $t9, $t6   		# fila * dim + columna, porque se multiplica? Ejm: 0x3+0=0, 0x3+1=1, 0x3+2=2, 1x3+0=3, si te das cuenta recorre todo la matriz
    mul $t9, $t9, 4     		# Dirección en bytes, luego x4 porque en MIPS la memoria avanza de 4bytes a 4bytes.
    add $t9, $t9, $t0   		# Dirección real del elemento, $t0 apunta a la direccion incial recuerda
    lw  $s0, 0($t9)     		# Cargar elemento M[i][j], luego en registro s0 guardaremos el valor de la direccion que tiene t9.
    
    lw  $s1, 0($t1)     		# Cargar elemento V[j]
    mul $s2, $s0, $s1   		# Multiplicar M[i][j] * V[j]
    add $t7, $t7, $s2   		# Acumular en w[i], porque acumular? Porque cada columna de una fila se multiplica con cada columna del vector y luego se suma.
    
    addi $t6, $t6, 1    		# Siguiente columna, pasamos a la siguiente fila, una vez multiplicado.
    addi $t1, $t1, 4    		# Siguiente elemento de v, por ejemplo al 1 esta almacenado en 0($t1), 2 en 4($t1)  y 3 en 8($t1) y asi sucesivamente...
    j fila_loop

guardar_resultado:
    sw  $t7, 0($t3)  		# Guardar en W[i]
    addi $t3, $t3, 4  		# Siguiente espacio en W
    la   $t1, v      			# Reiniciar puntero V, porque volveremos a multiplicar los mismos valores osea ponemos el puntero en 0($t1)
    addi $t4, $t4, 1 		# Siguiente fila, por ejemplo ahora i=1, en la siguiente ronda i=2 y asi hasta que no cumpla la condición y salte a fin_producto.
    j producto_mv

fin_producto: 			
    la  	$t3, w  			# Reiniciar puntero a w, osea 0(t3)
    li  	$t4, 0 			# Indice inicial de fila (i)
    
imprimir_w:			
    beq $t4, $t2, diagonal_principal 	# Recuerda que t2 es el numero de dimensión

    lw  $a0, 0($t3)			# Imprimir resultados de w, como no hay una función para pintar el vector, debemos recorrer uno por uno y imprimirlo.
    li  $v0, 1
    syscall
    
    li  $v0, 4			# Imprimir un salto de línea.
    la  $a0, salto
    syscall
    
    addi $t3, $t3, 4 		# Siguiente valor del vector W.
    addi $t4, $t4, 1
    j imprimir_w

diagonal_principal:
    li  $t4, 0			# Volvemos a poner el indice de fila a 0 (i=0).

suma_diagonal:
    beq $t4, $t2, imprimir_suma_diagonal 	# Se  cumple hasta que indice de la fila sea 3 y luego hace un salto a  imprimir_suma_diagonal
    mul $t9, $t4, $t2 		# Multiplicamos filaxnumDim (0x3), (1x3), (2x3)...
    add $t9, $t9, $t4		# Sumamos al resultado el numero de fila porque?, porque debe ser salir la posición 00,11,22,33... y asi y eso logramos sumando a fila.
    mul $t9, $t9, 4		# Porque avanza de 4bytes a 4bytes
    
    add $t9, $t9, $t0		# Ahora sumamos a la direccion incial de la matriz esa distancia.
    lw  $s0, 0($t9)			# Luego cargamos ese valor.
    
    add $t5, $t5, $s0 		# t5=0 (incial), al suma s0, sumamos el valor de la matriz(1,1). y ahora valdria t5 eso.
    
    addi $t4, $t4, 1		# Sumamos al +1 a la fila.
    j suma_diagonal		# Saltamos de nuevo a la funcion suma_diagonal.

imprimir_suma_diagonal:

    li  $v0, 4			# Imprimir el texto.
    la  $a0, texto2
    syscall
    
    li  $v0, 1			# Imprimir el valor de la suma de la diagonal principal.
    move $a0, $t5 			# En t5 esta el valor de la suma acumulativa de la diagonal de la matriz
    syscall
    
    li  $v0, 4			# Imprimir un salto de línea.
    la  $a0, salto
    syscall
    
    li  $t4, 0			# Volvemos a poner el indice de fila a 0 (i=0).

max_min_filas: 			# Función máximo y minimos
    beq $t4, $t2, fin_programa 	# Aqui hacemos lo mismo, un bucle.
    li  $s2, 0   			# Índice columna (j=0)
    li  $s3, -9999 			# Máximo inicial, tomo este valor por defecto, se que si pones en la matriz, un valor mas menor, no funcionara pero ya no sabia como hacerle xD.
    li  $s4, 9999  			# Mínimo inicial, lo mismo para para arriba

buscar_max_min:
    beq $s2, $t2, imprimir_max_min	# Recuerda t2(numDim)  hacemos un bucle for como en los anteriores, pero ahora trabajando con la columna
    mul $t9, $t4, $t2			# t9=t4(indiceFila)xt2(numDim)
    add $t9, $t9, $s2			# t9=t9+s2(indiceColumnAvanzar)
    mul $t9, $t9, 4			# Sumamos 4bytes porque asi avanza la memoria.
    add $t9, $t9, $t0			# Sumamos esa distancia a la direccion incial
    lw  $s0, 0($t9)				# Guardamos su valor incial en s0
    
    bgt $s0, $s3, actualizar_max		# Luego comparamos 'Si s0>s3' Se actualiza el valor, si se actualizará porque es verdadero, hace un salto
    j verificar_min				# Despues de ejecutar actualizar_max (Si es verdadero), salta a función verificar minimo.

actualizar_max:				# Función cambiar valor de maximo por fila
    move $s3, $s0				# Cambia el valor maximo(s3) por el de s0 y sigue ejecutando el codigo, vuelve a donde se quedo.

verificar_min:				
    blt $s0, $s4, actualizar_min		# Si se cumple que (s0<s4) va a la función actualizar_min
    j siguiente_elemento			# En caso cumpla o no, hace un salto a función siguiente_elemento

actualizar_min:
    move $s4, $s0				# Cambia el valor minimo(s4) por el de s0 y sigue ejecutando el codigo, vuelve a donde se quedo.

siguiente_elemento:			# Función creada con el objetivo de sumar 1 a la columna, para que avance al sgte valor.
    addi $s2, $s2, 1			# Suma +1 al indice de columnas.
    j buscar_max_min			# Vuelve a la función buscar_max_min.

imprimir_max_min:			# Una vez completada la fila y recorrida las columnas, imprime los valores maximo y minimos por fila.

    li  $v0, 4				# Imprimir texto de maximo
    la  $a0, texto3
    syscall
    
    li $v0, 1
    move $a0, $t4
    syscall

    li  $v0, 4				# Imprimir un salto de línea.
    la  $a0, salto
    syscall
    
    li  $v0, 1				# Imprimir máximo valor
    move $a0, $s3
    syscall
    
    li  $v0, 4				# Imprimir un salto de línea.
    la  $a0, salto
    syscall
    
    li  $v0, 1				# Imprimir mínimo valor
    move $a0, $s4
    syscall
    
    addi $t4, $t4, 1			
    j max_min_filas			# Vuelve a la función pero ahora, a la siguiente fila, hasta llegar al maximo que es 3 filas.

fin_programa:

    li  $v0, 10
    syscall