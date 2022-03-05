.data 
string: .space 30
EnterString: .asciiz "Enter string : " 
Yes: .asciiz "YES" 
No: .asciiz "NO" 
Endl:  .asciiz "\n"
.text

.globl main

main:
# main program entry

la $a0, EnterString 
li $v0, 4
syscall

la $a0, string
li $a1, 30
li $v0, 8
syscall #read string

############

la $s0, string
add $s1, $zero, $zero

while: 

add $t0, $s0, $s1
lb $t1, 0( $t0 ) 
beq $t1, $zero, next
addi $s1, $s1, 1

j while

############

next:

move $t2, $s1 # in $t2 size of string
sub $t2, $t2, 1

li $t3, 2

div $t4, $t2, $t3 #middle
li $t5, 0 #i
move $t6, $t2 #j
sub $t6, $t6, 1

############

forLoop:

beq $t5, $t4, printYes 

la $a1, string
addu $a1, $a1, $t5   
lb $s4, ($a1)   

la $a1, string
addu $a1, $a1, $t6   
lb $s5, ($a1)

bne $s4, $s5, printNo

add $t5, $t5, 1 #i++
sub $t6, $t6, 1 #j--
	
j forLoop

 
printNo:

la $a0, No 
li $v0, 4
syscall

li $v0,10
syscall

printYes:

la $a0, Yes 
li $v0, 4
syscall

li $v0,10
syscall