#Title: 		Assembly Lab 2
#Author: 		Anthony Nann
#Date: 			September 11, 2017
#Course & Section: 	CSC 211 001W
#Description: 		Takes two number inputs from a user and outputs them and the sum


	.text
	.globl __start
__start:
	la $a0, prompt1  	#load address of prompt1 into a0
      	li $v0, 4        	#load instruction number to display prompt1 into v0
      	syscall         	#system call to print prompt1

	li $v0,5            	# load call code number to read an integer -> v0
	syscall               	# system call to read the integer and store in v0
	move $t0,$v0          	# move integer from v0 -> t0 for safe keeping

	la $a0, prompt2		#load adress of prompt2
	li $v0, 4		#load instruction to print prompt2
	syscall			#print string2

	li $v0,5            	# load call code number to read an integer -> v0
	syscall               	# system call to read the integer and store in v0

	move $t1,$v0          	# move integer from v0 -> t1 for safe keeping

	move $a0,$t0            # move integer from t0 -> a0 for display
	li $v0,1                # load call code number to display the integer into v0
	syscall                 # system call to print the integer

	la $a0, addSign		#load adress of addSign into a0
	li $v0, 4		#load instruction to print addSign
	syscall			#print addSign

	move $a0,$t1            # move integer from t0 -> a0 for display
	li $v0,1                # load call code number to display the integer into v0
	syscall                 # system call to print the integer

	la $a0, equalsWhat	#load adress of equalsWhat into a0
	li $v0, 4		#load instruction to print equalsWhat
	syscall	

	add $t2,$t0,$t1		#add integers and store in $t2
	move $a0,$t2		#move sum to a0 so it can be printed
	li $v0,1		#load instruction to print integer
	syscall			#print integer

#####data section######
	.data
	prompt1: .asciiz "Enter first number: "
	prompt2: .asciiz "Enter second number: "
	addSign: .asciiz " + "
	equalsWhat: .asciiz " = "
