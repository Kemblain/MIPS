#######################################################################
# Program Name:   SalesTax.asm
# Author:         Anthony Nann
# Date:           September 11, 2017
# Course/Section: CSC 211 001W
# Program Description:
#    This program will take a cost from a user and compute and output 
#    the total cost with 8% sales tax.
#######################################################################

        .text
        .globl __start
__start:
	#Print out prompt 
        la $a0,prompt        # load beginning address of string into $a0 register 
        li $v0,4             # load call code to print a string into register $v0
        syscall              # system call to display prompt

        #Get the cost from User
        li $v0,6             # load call code to read a float from keyboard
        syscall              # system call to read float and store in $f0

	#Initialize float values for conversion
        li.s $f2, 0.08

	#do math
	mul.s $f4,$f0,$f2
	add.s $f6,$f4,$f0

	#output tax
	la $a0,taxLine
	li $v0,4
	syscall
	mov.s $f12,$f4
	li $v0,2
	syscall

	#Move to next line        
        la $a0,endl          # load address of new line string
        li $v0,4             # load call code to print a string (new line is a string)
        syscall              # system call to move to next line

	#output total
	la $a0,totalLine
	li $v0,4
	syscall
	mov.s $f12,$f6
	li $v0,2
	syscall

	#Data Section
      	.data
	prompt: .asciiz "Enter initial cost: $"
	taxLine: .asciiz "The tax amount is $"
	totalLine: .asciiz "The total cost is $"
	endl:   .asciiz "\n"