.data #Cadastra as mensagens de texto
	msg01: .asciiz"\nDigite a quantidade de camisetas pequenas: "
	msg02: .asciiz"\Digite a quantidade de camisetas médias: "
	msg03: .asciiz"Digite a quantidade de camisetas grandes: "
	msgfinal: .asciiz"O valor arrecadado é: "
.text
main:	#Camisetas pequenas
	li $v0, 4
	la $a0, msg01
	syscall
	#Espera input de camisetas pequenas
	li $v0, 5
	syscall
	#Guarda o valor obtido
	add $t1, $v0, 0
	
	#Camisetas medias
	li $v0, 4
	la $a0, msg02
	syscall
	#Espera input de camisetas medias
	li $v0, 5
	syscall
	#Guarda o valor obtido
	add $t2, $v0, 0
	
	#Camisetas grandes
	li $v0, 4
	la $a0, msg03
	syscall
	
	#Espera input da camisetas grandes
	li $v0, 5
	syscall
	#Guarda o valor
	add $t3, $v0, 0
	
	# camisetasPequenas <- camisetasP*10
	mul $t1, $t1, 10
	# camisetasM <- camisetasM*12
	mul $t2, $t2, 12
	# camisetasG <- camisetasG*15
	mul $t3, $t3, 15
	
	# res <- camisetasPequenas*10 + camisetasMedias*12
	add $t4, $t1, $t2
	# res <- res + camisetasGrandes*15
	add $t4, $t4, $t3
	
	li $v0, 4
	la $a0, msgfinal
	syscall
	
	li $v0, 1
	add $a0, $t4, 0
	syscall
