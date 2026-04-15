.data #Cadastra as mensagens de texto
	msg01: .asciiz"\nDigite as horas feitas: "
	msg02: .asciiz"\Digite as horas extras: "
	msg03: .asciiz"Digite a porcentagem de desconto: "
	msgfinal: .asciiz"O valor liquido é: "
.text
main:	#Horas feitas
	li $v0, 4
	la $a0, msg01
	syscall
	#Espera input
	li $v0, 5
	syscall
	#Guarda o valor obtido
	add $t0, $v0, 0
	
	#Horas extras
	li $v0, 4
	la $a0, msg02
	syscall
	#Espera input
	li $v0, 5
	syscall
	#Guarda o valor obtido
	add $t1, $v0, 0
	
	#Desconto
	li $v0, 4
	la $a0, msg03
	syscall
	#Espera input
	li $v0, 5
	syscall
	#Guarda o valor
	add $t2, $v0, 0
	
	# horasTrabalhadas <- horasTrabalhadas*10
	mul $s0, $t0, 10
	# horasExtras <- horasExtras*15
	mul $s1, $t1, 15
	# salarioBruto <- horasExtras*15 + horasTrabalhadas*10
	add $s2, $s0, $s1

	# Liquido <- SB-Desconto
	sub $s5, $s2, $t2
	
	
	li $v0, 4
	la $a0, msgfinal
	syscall
	
	li $v0, 1
	add $a0, $s5, 0
	syscall
