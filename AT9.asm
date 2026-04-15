.data #Cadastra as mensagens de texto
	msg01: .asciiz"\nDigite 1° valor: "
	msg02: .asciiz"\nDigite 2° valor: "
	msg03: .asciiz"\nSaiu do sistema"
	msg04: .asciiz"\nResultado da divisão: "
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
	
equanto:
	#VALOR 2
	li $v0, 4
	la $a0, msg02
	syscall
	#Espera input
	li $v0, 5
	syscall
	#Guarda o valor obtido
	add $t1, $v0, 0
	
	beq $t1 , 0, fimEquanto
	div $s0, $t0, $t1
	
	li $v0, 4
	la $a0, msg04
	syscall
	
	li $v0, 1
	add $a0, $s0, 0
	syscall
	
	bne $t1, 0, equanto
	
fimEquanto:
	li $v0, 4
	la $a0, msg03
	syscall
