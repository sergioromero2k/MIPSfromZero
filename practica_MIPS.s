	.data
m:	.word 	3,7,4		# Iniciar la matriz de 3 filas y 3 columnas 3x3
	.word 	1,0,2
	.word 	-2,9,8
dim_m:	.word 	3		# Dimensión de la matriz

v:	.word	1, 2, 3		# Vector de dimensión 3 (Parece 3 columnas, pero es 3 filas) 3x1
	
salto:	.asciiz 	"\n"


	.text
	la	$t0,m 		# Cargar dirección de la matriz [0,0]  		t0 = direccion(array)
	lw 	$t2,dim_m 	# Cargar nº de dimensión				t2=3
	
	li	$v0, 4
	la	$a0, v
	syscall
	
	li	$v0, 4
	la	$a0, salto
	syscall
	
	addi 	$t2,$t2,-1	# Limite superior 	j,i				(t2)ultimo_j_i=2
	move 	$s0,$zero 	# max = 0					s0=0
	move 	$t4,$zero	#counter t4 = 0 (used to access to integer elements from 1 to 12)  t4 = 0
	
	move 	$t7, $zero	# Máximo valor por fila (Valor inicial $t7=0)
	move	$t6, $zero	# Mínimo valor por fila (valor inicial $t6=0)	
		
fori:	move 	$s1,$zero 	#i - row index					func fori: s1(i)=0
	bgt 	$s1,$t2,endi 	# if (s1>t1) go endi
	b 	bodyi 		# Salto if ( 0 = 0 ) go bodyi
	
inci:	addi 	$s1,$s1,1 	#increment i					s1+=s1
	

	
bodyi:										# func bodyi

forj:	move 	$s2,$zero 	# j - column index					s2(j)=0
		
	bgt 	$s2,$t2,endj 	# if j > upper bound finish				if (s2>t2) go endj			
	b 	bodyj 		# if ( 0 = 0) go bodyj
	
incj:	addi 	$s2,$s2,1 	# Incrementar en 1 a j				s2+=s2
	
bodyj:	
	mul	$s5,$t4,4	# Avanzar fila					s5=t4*4 
	add 	$t6,$t0,$s5 	# Avanzar columnas element 			direccion(t6)=array+s5
	
	addi 	$t4,$t4,1	# Avanzar siguiente columna			t4=t4+1

	lw 	$s5,0($t6) 	# Se carga el valor de memoria a 			s5=value(direccion(t6))
	
	li 	$v0, 1		# Te mostrará los valores de la matriz 
	move	$a0, $s5		
	syscall

	bne 	$s2,$t2,incj 	# if(s2 != t2) go incj				Recuerda s2=3 & t2=0			
endj:
	li	$v0, 4
	la	$a0, salto
	syscall
	
	bne 	$s1,$t2,inci 	# increment i and repeat bodyi
	

endi:
	
	li 	$v0,10 		#finish the execution
	syscall
