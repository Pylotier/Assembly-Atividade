.data #Cadastra as mensagens de texto
	msg01: .asciiz"\nDigite o valor do cateto oposto: "
	msg02: .asciiz"\nDigite o valor do cateto adjacente: "
	msgfinal: .asciiz"Hipotenusa: "
.text
main:	#RETA VERTICAL (X)
	li $v0, 4
	la $a0, msg01
	syscall
	#Espera input
	li $v0, 5
	syscall
	#Guarda o valor obtido
	add $t0, $v0, 0
	
	#RETA HORIZONTAL (Y)
	li $v0, 4
	la $a0, msg02
	syscall
	#Espera input
	li $v0, 5
	syscall
	#Guarda o valor obtido
	add $t1, $v0, 0
	
	# HIPOTENUSA = B+(C*C/2B) - Aproximado do valor real da raiz
	
	# C*C
	mul $s0, $t1, $t1
	# 2/B
	mul $s1, $t0, 2
	# C*C/B2
	div $s2, $s0, $s1
	# HIPOTENUSA = B+(C*C/2B)
	add $s3, $t0, $s2
	
	
	li $v0, 4
	la $a0, msgfinal
	syscall
	
	li $v0, 1
	add $a0, $s3, 0
	syscall
