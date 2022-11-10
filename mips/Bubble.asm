#Bubble.asm
#Desc: implemente o algoritmo de ordenacao bubblesort
#
#DDA 31.10.22
#
#int v = {3,2,1,4,8,6,5,9,7}
#void bubbleSort(int *v,int n){
#for(int i = 0; i < n; i++)
#if(v[i] > v[i+1])
#swap(&v[i], &v[i+1]);
#bubbleSort(v,n-1);
#
#.include "io.asm"

.data
	v: .word 3,2,1,4,8,7,5,9,7

.text
	#ganhar acesso a tosort[0]
	la $s7,v #Load Adress do "vetor" v
	#tamanho do array
	addi $s6, $zero, 9 #atribui o valor de 9 para o registrador s6 
	
	#for(int i = 0; i < n; i++)
	li $s0, 0
FOR1:
	slt $t0,$s0,$s6
	beq $t0,$zero, SAI1
	#corpo do for
	#temp1 = v[i]
	sll $t3,$s0,2 #multiplica o i por 4 para acessar sua posição na memoria de um prox term
	add $t3,$s7,$t3 #t3 = &v[0] + i*4
	
	lw $t4,0($t3) # t4 = v[i]
	#v[i+1]
	lw $t5,4($t3) # t4 = v[i]
	
	#v[i] > v[i+1] eq. v[i+1] < v[i]
	
	slt $t0,$t5,$t4
	beq $t0,$zero, CONT1
	
	sw $t4,4($t3)
	sw $t5,0($t3)
	
CONT1:
	#corpo do for
	addi $s0,$s0,1 #i++
	j FOR1

SAI1:
