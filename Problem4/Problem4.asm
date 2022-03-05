.data 
arrA: .space 100 
arrB: .space 100 
EnterNumber: .asciiz "Enter the number(N): " 
EnterNumOfSEQ: .asciiz "Enter number of sequence: " 
Endl:  .asciiz "\n"

.text
.globl main

main:
# main program entry

### Enter N

la $a0,EnterNumber 
li $v0,4
syscall

### Reading entered number
li $v0,5 # Read integer
syscall # $v0 = value read

### Move N into $t0 so $t0 = N
move $t0,$v0 #$t0 = N

la $t1, 0 # int i = 0
lw $t2, arrA # 
 
loopForInsertingNNumbers: #loop for inserting n numbers
beq $t1, $t0, algorithmExecution # if i = n then go to  algorithm execution

### Enter number os sequence
la $a0,EnterNumOfSEQ 
li $v0,4
syscall 

### Reading entered number
li $v0,5 # Read integer
syscall # $v0 = value read

sw $v0, arrA($t2) #store this number into the A array at address $t2

add $t1, $t1, 1 # increase i -> i ++;
add $t2, $t2, 4 # get next address -> address += 4;

j loopForInsertingNNumbers


##### From here starts algorithm execution ####
algorithmExecution:

la $t2, arrA #address of arrA
la $t3, arrB #address of arrB

la $t1, 1 # int i = 0

FForLoop:
beq $t1, $t0, LLoop 

#assign i
la $t4, ($t1) 

#now we need the addrss where i th element is located
#since every element is 4 bit size so we need to 
#multiply i by 4

la $t5, 4

mult $t4, $t5 
mflo $t4

add $t8, $t2, $t4 #arrA[i] address
lw $t6, 0($t8) #load into $t6 arrA[i]

add $t9, $t3, $t4 #arrB[i] address
la $t5, 1
sw $t5, 0($t9) #arrB[i] = 1

######################################################################

la $t7, 0 #int j = 0

SForLoop:
beq $t7, $t1, addAndJump

lw $s0, 0($t9) #load into $s0 arrB[i]

################

la $t4, ($t7)

#now we need the addrss where i th element is located
#since every element is 4 bit size so we need to 
#multiply j by 4

la $t5, 4

mult $t4, $t5 
mflo $t4

add $s6, $t2, $t4 #arrA[j] address
lw $s1, 0($s6) #load into $s3 arrA[j]

add $s7, $t3, $t4 #arrB[j] address
lw $s2, 0($s7) #load into $s4 arrB[j]

bgt $t6, $s1, calcNewVal

#########################
contFromHere:
add $t7, $t7, 1
j SForLoop


#########################
addAndJump:
addu $t1, $t1, 1
j FForLoop


calcNewVal:
add $s2, $s2, 1
bgt $s2, $s0, assignSec
sw $s0, 0($t9)
j contFromHere

assignSec:
sw $s2, 0($t9) 
j contFromHere


LLoop:

la $s0, 0
la $t1, 0

loop:
beq $t1, $t0, finish

la $t4, ($t1) 

#now we need the addrss where i th element is located
#since every element is 4 bit size so we need to 
#multiply i by 4

la $t5, 4

mult $t4, $t5 
mflo $t4

add $t7, $t3, $t4 #arrB[i] address
lw $s5, 0($t7) 

j findOutMax

contHere:
add $t1, $t1, 1
j loop

##############################
findOutMax:
bgt $s5, $s0, maximize

j contHere

maximize:
la $s0, ($s5)

j contHere


##############################
finish:

move $a0, $s0
add $a0, $a0, 1

li $v0, 1
syscall

li $v0,10
syscall