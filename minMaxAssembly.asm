         .text
        .globl __start
__start:
	la $a0,p0		#Load first prompt
	li $v0,4		#load instruction to print string
	syscall			#print string

	li $v0,5                # load call code number to read integer
	syscall                 # system call to read integer and store in v0
	move $t0,$v0            # move integer from v0 -> t0 for safe keeping
                         	# t0 holds number of integers to be used

	add $t2,$t0,$t2		#set t2 to be counter

	la $t1,array		#t1 = address of array
	
intLoop:
	la $a0,intPrompt
	li $v0,4
	syscall

	li $v0,5
	syscall
	sw $a0, array($t0)
	add $t1,$t1,4       	# move pointer ahead to next array element a[1]
	add $t2,$t2,-1      	# decrement counter to keep in step with array
	bgtz $t2, intLoop	#go back to intloop if counter greater than zero

sub $t6,$t6,$t6  	#i is definitely 0
sub $t7,$t7,$t7		#j is definitely 0
add $t7,$t7,4		#j is 4

mul $t9,$t2,4		#number of elements * 4 = outer end index
sub $t9,$t9,4		#outer end index -4 = outer end index
mul $t0,$t2,4		#inner loop end index = # of items * 4

outer: 	beq $t6,$t7,endOuter
	inner: 	beq $t7,$t0,endInner
		sub $t8,$t7,4
		bgt $t8,$t7,endIf
		sw $s0,array($t8)
	endIf:	add $t7,$t7,4
	j inner
	endInner:
	add $t6,$t6,4
	sub $t7,$t7,$t7		#j is definitely 0
	add $t7,$t7,4		#j is 4
	j outer
endOuter:

la $a0,p1
li $v0,4
syscall



	

        
.data
array: 		.word 100
p0:		.asciiz "How many numbers will be entered? "
p1:     	.asciiz "The minimum number is "
p2:     	.asciiz "\nThe maximum number is "
intPrompt:	.asciiz "Enter an integer: "
crlf:   	.asciiz "\n" 