.data #Cadastra as mensagens de texto
	msg01: .asciiz"\nDigite a altura da pessoa em centímetros:  "
	msg02: .asciiz"\nA "
	msg03: .asciiz"°pessoa é a mais alta com: "
	msg04: .asciiz"°pessoa é a menos alta com: "
	medida: .asciiz"cm"

.text
main:	
	li $t9, 1
enquanto:
	#ALTURA
	li $v0, 4
	la $a0, msg01
	syscall
	#Espera input
	li $v0, 5
	syscall
	#Guarda o valor obtido
	add $t0, $v0, 0

	beq $t9, 1, primeiraVez
	j multiplasVezes
	
primeiraVez:
	move $s0, $t0 #Maior
	move $s1, $t0 #Menor
	move $s2, $t9 #Número do maior
	move $s3, $t9 #Número do menor
	add $t9, $t9, 1
	j enquanto
multiplasVezes:
	bgt $t0, $s0, salvarMaior
	blt $t0, $s1, salvarMenor
salvarMaior:
	move $s0, $t0
	move $s2, $t9
	j fimenquanto
salvarMenor:
	move $s1, $t0
	move $s3, $t9
	
fimenquanto:
	addi $t9, $t9, 1
	ble $t9, 15, enquanto

	# Começa a mensagem do meior
	li $v0, 4
	la $a0, msg02
	syscall
	# Diz qual o número do maior
	li $v0, 1
	add $a0, $s2, 0
	syscall
	# Continua a mensagem
	li $v0, 4
	la $a0, msg03
	syscall
	# Altura do maior
	li $v0, 1
	add $a0, $s0, 0
	syscall
	# Medida
	li $v0, 4
	la $a0, medida
	syscall
	
	# Começa a mensagem do menor
	li $v0, 4
	la $a0, msg02
	syscall
	# Diz qual o número do menor
	li $v0, 1
	add $a0, $s3, 0
	syscall
	# Continua a mensagem
	li $v0, 4
	la $a0, msg04
	syscall
	# Altura do menor
	li $v0, 1
	add $a0, $s1, 0
	syscall
	# Medida
	li $v0, 4
	la $a0, medida
	syscall
