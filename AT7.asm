.data #Cadastra as mensagens de texto
	msg01: .asciiz"\nDigite um valor: "
	msgPar: .asciiz"\nNúmero par, resultado: "
	msgImpar: .asciiz"\nNúmero impar, resultado: "
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
	
	#Soma 5 no valor
	add $t0, $t0, 5
	
	#RESTO
	rem $s0, $t0, 2

	# SE valor = 0
	beq $s0, 0, Par
	j impar
	
Par:
	add $t0, $t0, 8
	li $v0, 4
	la $a0, msgPar
	syscall
	
	li $v0, 1
	add $a0, $t0, 0
	syscall
	j fimse
	
impar:
	li $v0, 4
	la $a0, msgImpar
	syscall
	
	li $v0, 1
	add $a0, $t0, 0
	syscall
	
fimse:
