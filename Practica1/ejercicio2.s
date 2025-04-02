.data

.text
	# suponiendo $s0=b, $s1=g, $s2=h, $s3=i, $s4=f 
	add 	$t0, $s1, $s2
	add 	$t1, $s3, $s4
	sub 	$s0, $t0, $t1
	
	li	$v0, 10
	syscall
	