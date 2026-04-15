.data #Cadastra as mensagens de texto
	msg01: .asciiz"\nDigite a lagura do terreno: "
	msg02: .asciiz"\nDigite a altura do terreno: "
	msgfinal: .asciiz"A área do terreno: "
.text
main:	#Diz a mensagem no terminal
	li $v0, 4
	la $a0, msg01
	syscall
	#Espera input da largura do terreno
	li $v0, 5
	syscall
	#Guarda o valor obtido
	add $t1, $v0, 0
	
	li $v0, 4
	la $a0, msg02
	syscall
	#Espera input da altura do terreno
	li $v0, 5
	syscall
	
	add $t2, $v0, 0
	
	mul $t3, $t2, $t1
	
	li $v0, 4
	la $a0, msgfinal
	syscall
	
	li $v0, 1
	add $a0, $t3, 0
	syscall
