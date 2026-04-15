.data #Cadastra as mensagens de texto
	msg01: .asciiz"\nDigite o valor A: "
	msg02: .asciiz"\nDigite o valor B: "
	msgfinal: .asciiz"Resultado: "
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
	
	# SE A = B
	beq $t0, $t1, iguais # Se verdadeiro pula pra label "iguais", senão continua reto
	j naoIguais # Pula para o label "naoIguais"
	
iguais:
	add $s0, $t0, $t1
	li $v0, 4
	la $a0, msgfinal
	syscall
	
	li $v0, 1
	add $a0, $s0, 0
	syscall
	j fimse
	
naoIguais:
	mul $s0, $t0, $t1
	li $v0, 4
	la $a0, msgfinal
	syscall
	
	li $v0, 1
	add $a0, $s0, 0
	syscall
	
fimse:
