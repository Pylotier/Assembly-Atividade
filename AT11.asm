.data #Cadastra as mensagens de texto
	msg01: .asciiz"\Digite 1° valor: "
	msg02: .asciiz"\nValor inicial invalido, menor do que 0"
	msg03: .asciiz"\nValor inicial invalido, maior do que 100"
	msg04: .asciiz"\nDigite outro valor: "
	msg05: .asciiz"\nValor entre 0-25, "
	msg06: .asciiz"\nValor entre 26-50, "
	msg07: .asciiz"\nValor entre 51-75, "
	msg08: .asciiz"\nValor entre 76-100"
	msg09: .asciiz"Valor maior do que 100"
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
	
	blt $t0, 0, menorQue0
	bgt $t0, 100, maiorQue100
	j equanto
menorQue0:
	li $v0, 4
	la $a0, msg02
	syscall
	j main
maiorQue100:
	li $v0, 4
	la $a0, msg03
	syscall
	j main
	
equanto: 
	blt $t1, 1, primeiraVez
	j multiplasvezes
	
primeiraVez:
	li $t1, 1
	j pularMulti
multiplasvezes:
	li $v0, 4
	la $a0, msg04
	syscall
	
	li $v0, 5
	syscall
	
	add $t0, $v0, 0
pularMulti:
		
	bge $t0, 0, entao
	j fimenquanto
	entao:
	ble $t0 , 25, entao2
	j senao
	entao2:
	li $v0, 4
	la $a0, msg05
	syscall
	j equanto
senao:
	bgt $t0, 25, entao3
	entao3:
	ble $t0 , 50, entao4
	j senao2
	
	entao4:
	li $v0, 4
	la $a0, msg06
	syscall
	j equanto
	
senao2:	
	bgt $t0, 50, entao5
	entao5:
	ble $t0 , 75, entao6
	j senao3
	
	entao6:
	li $v0, 4
	la $a0, msg07
	syscall
	j equanto
	
senao3:
	bgt $t0, 75, entao7
	entao7:
	ble $t0 , 100, entao8
	j senao4
	entao8:
	li $v0, 4
	la $a0, msg08
	syscall
	j equanto
	
senao4:
	bgt $t0, 100, entao9
	entao9:
	li $v0, 4
	la $a0, msg09
	syscall
	j equanto
	
fimenquanto:
	bgtz $t0, equanto
