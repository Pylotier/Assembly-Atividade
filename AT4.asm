.data #Cadastra as mensagens de texto
	msg01: .asciiz"\nDigite a base maior do trapezio: "
	msg02: .asciiz"\nDigite a base menor do trapezio: "
	msg03: .asciiz"\nDigite a base altura do trapezio: "
	msgfinal: .asciiz"A área do trapezio é: "
.text
main:	#BASE MAIOR
	li $v0, 4
	la $a0, msg01
	syscall
	#Espera input
	li $v0, 5
	syscall
	#Guarda o valor obtido
	add $t0, $v0, 0
	
	#BASE MENOR
	li $v0, 4
	la $a0, msg02
	syscall
	#Espera input
	li $v0, 5
	syscall
	#Guarda o valor obtido
	add $t1, $v0, 0
	
	#ALTURA
	li $v0, 4
	la $a0, msg03
	syscall
	#Espera input
	li $v0, 5
	syscall
	#Guarda o valor
	add $t2, $v0, 0
	
	# baseM + baseMen
	add $s0, $t0, $t1
	# baseM + baseMen * altura
	mul $s1, $s0, $t2
	# bm + bn * altura / 2
	div $s2, $s1, 2
	
	
	li $v0, 4
	la $a0, msgfinal
	syscall
	
	li $v0, 1
	add $a0, $s2, 0
	syscall
