.data
.text
	main: 
	subi	$t0, $s2, 5	# Suponiendo los valores f, g, h a $s0, $s1, $s2
	add 	$s0, $s1, $t0
	
	li 	$v0, 10
	syscall
	