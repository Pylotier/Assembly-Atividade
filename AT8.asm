.data #Cadastra as mensagens de texto
	msg01: .asciiz"\nDigite um valor: "
	msg02: .asciiz"\nNúmero positivo, dobrando o valor: "
	msg03: .asciiz"\nNúmero negativo, triplicando o valor: "
.text
main:	#VALOR
	li $v0, 4
	la $a0, msg01
	syscall
	#Espera input
	li $v0, 5
	syscall
	#Guarda o valor obtido
	add $t0, $v0, 0
	
	# SE valor >= 0
	bge $t0, 0, maior
	j menor
	
maior:
	#DUPLIQUE O VALOR SE POSITIVO
	mul $s0, $t0, 2
	li $v0, 4
	la $a0, msg02
	syscall
	
	li $v0, 1
	add $a0, $s0, 0
	syscall
	j fimse
	
menor:
	#TRIPLIQUE O VALOR SE NEGATIVO
	mul $s0, $t0, 3
	li $v0, 4
	la $a0, msg03
	syscall
	
	li $v0, 1
	add $a0, $s0, 0
	syscall
	
fimse:
