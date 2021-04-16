#######################################################################
# Program Name:   Lab 7: Finding the Average
# Author:         Anthony Nann
# Date:           October 2, 2017
# Course/Section: CSC 211 001W
# Program Description:
#    This program will find the average of 10 user entered numbers
#######################################################################

	.text
        .globl __start
__start:
                
	la $t0, array    
    	li $t1, 10        
    	li $t3, 0    
	li $t6, 0
	li.s $f2,10.0

while:  
    	la $a0, intPrompt
	li $v0,4
	syscall

	li $v0,5
	syscall

	sw $v0, ($t0)

	add $t6,$t6,$v0
	add $t0,$t0,4
	add $t3,$t3,1

	blt $t3,$t1,while

wend:
	la $a0,title
	li $v0,4
	syscall

	li $t0,0
	li $t3, 0
	la $t0, array

startPrint:
	lw $t2,($t0)
	move $a0,$t2
	li $v0,1
	syscall

	la $a0,comma
	li $v0,4
	syscall

	add $t0,$t0,4
	add $t3,$t3,1

	blt $t3,$t1,startPrint
endPrint:
	la $a0,averageLine
	li $v0,4
	syscall

	mtc1 $t6, $f12
  	cvt.s.w $f12, $f12

	div.s $f12,$f12,$f2

	li $v0,2
	syscall
	
	la $a0,newLine
	li $v0,4
	syscall
	la $a0,newLine
	li $v0,4
	syscall

	li $v0,10
	syscall

	.data
intPrompt:  	.asciiz   	"Enter an Integer: " 
title:      	.asciiz   	"\nArray: "
newLine:       	.asciiz   	"\n"
comma:      	.asciiz   	", "
averageLine:	.asciiz		"\nThe average is: "

array:		.word 40