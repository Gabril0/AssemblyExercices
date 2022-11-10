.data 
	texto: .asciiz "\nEscolha os numeros que serao somados: "
	resultado: .asciiz "\nO resultado eh: "

.text
	li $v0, 4 #print o texto
	la $a0, texto
	syscall
	
	li $v0, 5 #ler int
	syscall
	
	move $t0,$v0 #move do "ponteiro" para o registrador temporario que sera feita a aritmetrica
	
	li $v0, 5 #ler int 2
	syscall
	
	move $t1,$v0 
	
	add $t3,$t1,$t0
	
	li $v0, 4
	 
	li $v0,1 #print do int
	move $a0,$t3 
	syscall
	
	
	li $v0, 10
	syscall
