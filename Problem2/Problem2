.data 
EnterFirstNumber: .asciiz "Enter first number(a): " 
EnterSecondNumber: .asciiz "Enter second number(b): " 
Answer: .asciiz "Answer is: "
.text

.globl main

main:
# main program entry

la $a0, EnterFirstNumber 
li $v0,4
syscall 

li $v0,5 # Read first number
syscall 

move $t1,$v0 # move first number from $v0 to $t1

la $a0, EnterSecondNumber 
li $v0,4
syscall

li $v0,5 # Read second number
syscall

move $t2,$v0 # move second number from $v0 to $t2

li $t0,0 #$t0 is a counter(here we will save the answer)

firstLoop:
bgt $t1, $t2, printAnswer #for(int i=a; a<=b; a++)
	
li $t6,0 #checker			
li $t3,2 #int j = 2
	
secondLoop: #for(int j=2; j<=sqrt($t1); j++)
mul $t4,$t3,$t3 
bgt $t4,$t1, increaseI

rem $t5,$t1,$t3 #nashti 

bne $t5,0, increaseJ

#if not, then tins number hase another divisor 

li $t6,1 #Checker assign 1(im means this number is not prime)

beqz $t5, increaseI #if equals 0(has another divisor)

increaseJ:
addu $t3,$t3,1 #Increase by one	
j secondLoop 
		
increaseI:
addu $t1,$t1,1 #Increase by one	
beq $t6,0, increaseAnswer #If checker == 0
ble $t1, $t2, firstLoop 

increaseAnswer:
beq $t6,1,firstLoop
addu $t0,$t0,1 #Increase result
j firstLoop #jump to first loop

printAnswer:
la $a0, Answer
li $v0,4
syscall 

move $a0,$t0
li $v0,1
syscall

li $v0,10
syscall


