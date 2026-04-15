.data #Cadastra as mensagens de texto
	msg01: .asciiz"\nDigite 1° valor: "
	msg02: .asciiz"\nDigite 2° valor: "
	msg03: .asciiz"\nResto da divisão: "
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
	
	#VALOR 2
	li $v0, 4
	la $a0, msg02
	syscall
	#Espera input
	li $v0, 5
	syscall
	#Guarda o valor obtido
	add $t1, $v0, 0
	
se:
	bgt $t1, $t0, senao # SE t1 É MAIOR
	add $t3, $t1, 0
equanto:
	add $t1, $t1, $t3
	bgt $t0, $t1, equanto
	
	bgt $t1, $t0, consertar
	j continuar
consertar:
	sub $t1, $t1, $t3
continuar:
	sub $s0, $t0, $t1
	
	li $v0, 4
	la $a0, msg03
	syscall
	
	li $v0, 1
	add $a0, $s0, 0
	syscall
	j fimse

senao:
	add $t3, $t0, 0
equanto2:
	add $t0, $t0, $t3
	bgt $t1, $t0, equanto2
	
	bgt $t0, $t1, consertar2
	j continuar2
consertar2:
	sub $t0, $t0, $t3
continuar2:
	sub $s0, $t1, $t0
	
	li $v0, 4
	la $a0, msg03
	syscall
	
	li $v0, 1
	add $a0, $s0, 0
	syscall
	
fimse:
