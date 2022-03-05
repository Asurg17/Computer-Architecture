.data 
EnterNumber: .asciiz "Enter the number(N): " 
Endl:  .asciiz "\n"
.text

.globl main

main:
# main program entry

la $a0,EnterNumber 
li $v0,4
syscall 

li $v0,5 # Read integer
syscall # $v0 = value read

move $t0,$v0 # gadavitanet shemotanili ricxvi $t0-shi

while:
rem $t1,$t0,2
bne $t0,1,print

la $a0,Endl
li $v0,4
syscall

move $a0,$t2

li $v0,1
syscall

li $v0,10
syscall

j while

print:
addu $t2,$t2,1 #Plus one operation
beq $t1,0,divide
mul $t0,$t0,3
addu $t0, $t0,1

move $a0, $t0
li $v0,1
syscall

la $a0,32
li $v0,11
syscall

j while


divide:
div $t0,$t0,2

move $a0,$t0
li $v0,1
syscall

la $a0,32
li $v0,11
syscall

j while
