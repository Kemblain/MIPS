#Title: 		Assembly Lab 2
#Author: 		Anthony Nann II
#Date: 			September 11, 2017
#Course & Section: 	CSC 211 001W
#Description: 		Takes five numbers and does [(a+b)-(c+d)*e]


	.text
	.globl __start
__start:
	la $a0, promptOne  	#load address of prompt1 into a0
      	li $v0, 4        	#load instruction number to display prompt1 into v0
      	syscall         	#system call to print prompt1

	li $v0,5            	# load call code number to read an integer -> v0
	syscall               	# system call to read the integer and store in v0
	move $t0,$v0          	# move integer from v0 -> t0 for safe keeping

	la $a0, promptTwo  	#load address of prompt1 into a0
      	li $v0, 4        	#load instruction number to display prompt2 into v0
      	syscall         	#system call to print prompt2

	li $v0,5            	# load call code number to read an integer -> v0
	syscall               	# system call to read the integer and store in v0
	move $t1,$v0          	# move integer from v0 -> t1 for safe keeping

	la $a0, promptThree  	#load address of prompt1 into a0
      	li $v0, 4        	#load instruction number to display prompt2 into v0
      	syscall         	#system call to print prompt3

	li $v0,5            	# load call code number to read an integer -> v0
	syscall               	# system call to read the integer and store in v0
	move $t2,$v0          	# move integer from v0 -> t2 for safe keeping

	la $a0, promptFour  	#load address of prompt4 into a0
      	li $v0, 4        	#load instruction number to display prompt1 into v0
      	syscall         	#system call to print prompt4

	li $v0,5            	# load call code number to read an integer -> v0
	syscall               	# system call to read the integer and store in v0
	move $t3,$v0          	# move integer from v0 -> t3 for safe keeping

	la $a0, promptFive 	#load address of prompt5 into a0
      	li $v0, 4        	#load instruction number to display prompt5 into v0
      	syscall         	#system call to print prompt5

	li $v0,5            	# load call code number to read an integer -> v0
	syscall               	# system call to read the integer and store in v0
	move $t4,$v0          	# move integer from v0 -> t4 for safe keeping

	la $a0, equationLine 	#load address of equationline into a0
      	li $v0, 4        	#load instruction number to display prompt1 into v0
      	syscall         	#system call to print equationline
	la $a0, openParenth 	#load address of prompt1 into a0
      	li $v0, 4        	#load instruction number to display prompt1 into v0
      	syscall         	#system call to print (

	move $a0,$t0		#print first integer
	li $v0,1
	syscall

	la $a0, plusSign 	#load address of +
      	li $v0, 4        	#load instruction number to display +
      	syscall 

	move $a0,$t1		#print second integer
	li $v0,1
	syscall

	la $a0, closeParenth 	#load address of )
      	li $v0, 4        	#load instruction number to display ) into v0
      	syscall         	#system call to print )
	la $a0, minusSign 	#load address of - into a0
      	li $v0, 4        	#load instruction number to display - into v0
      	syscall         	#system call to print -
	la $a0, openParenth 	#load address of ( into a0
      	li $v0, 4        	#load instruction number to display ( into v0
      	syscall         	#system call to print (
	
	move $a0,$t2		#print third integer
	li $v0,1
	syscall

	la $a0, plusSign 	#load address of + into a0
      	li $v0, 4        	#load instruction number to display + into v0
      	syscall 

	move $a0,$t3		#print fourth integer
	li $v0,1
	syscall	

	la $a0, closeParenth 	#load address of ) into a0
      	li $v0, 4        	#load instruction number to display ) into v0
      	syscall         	#system call to print )
	la $a0, multiSign 	#load address of * into a0
      	li $v0, 4        	#load instruction number to display * into v0
      	syscall 

	move $a0,$t4		#print fifth integer
	li $v0,1
	syscall	

	add $s0,$t0,$t1		#add first and second
	add $s1,$t2,$t3		#add third and fourth

	la $a0, equationLine 	#load address of equationline into a0
      	li $v0, 4        	#load instruction number to display equationline into v0
      	syscall         	#system call to print equationline
	la $a0, openParenth 	#load address of ( into a0
      	li $v0, 4        	#load instruction number to display ( into v0
      	syscall         	#system call to print (

	move $a0,$s0		#print first added
	li $v0,1
	syscall	

	la $a0, closeParenth 	#load address of ) into a0
      	li $v0, 4        	#load instruction number to display ) into v0
      	syscall         	#system call to print )
	la $a0, minusSign 	#load address of - into a0
      	li $v0, 4        	#load instruction number to display - into v0
      	syscall         	#system call to print -
	la $a0, openParenth 	#load address of ( into a0
      	li $v0, 4        	#load instruction number to display ( into v0
      	syscall         	#system call to print (
	
	move $a0,$s1		#print second added
	li $v0,1
	syscall

	la $a0, closeParenth 	#load address of ) into a0
      	li $v0, 4        	#load instruction number to display ) into v0
      	syscall         	#system call to print )
	la $a0, multiSign 	#load address of * into a0
      	li $v0, 4        	#load instruction number to display * into v0
      	syscall 

	move $a0,$t4		#print fifth integer
	li $v0,1
	syscall

	mul $s3,$s1,$t4		#multiply second added and fifth integer

	la $a0, equationLine 	#load address of equation line into a0
      	li $v0, 4        	#load instruction number to display equationline into v0
      	syscall         	#system call to print equationline

	move $a0,$s0		#print first added
	li $v0,1
	syscall

	la $a0, minusSign 	#load address of - into a0
      	li $v0, 4        	#load instruction number to display - into v0
      	syscall

	move $a0,$s3		#print multiplied
	li $v0,1
	syscall

	sub $s4,$s0,$s3		#subtract multiplied from first added

	la $a0, finishLine 	#load address of finishline into a0
      	li $v0, 4        	#load instruction number to display finishline into v0
      	syscall 

	move $a0,$s4		#print solution value
	li $v0,1
	syscall
	

	.data
	promptOne: .asciiz "Enter first integer: "
	promptTwo: .asciiz "Enter second integer: "
	promptThree: .asciiz "Enter third integer: "
	promptFour: .asciiz "Enter fourth integer: "
	promptFive: .asciiz "Enter fifth integer: "
	equationLine: .asciiz "\nThe equation is: "
	finishLine: .asciiz "\nThe solution is: "
	openParenth: .asciiz "("
	closeParenth: .asciiz ")"
	plusSign: .asciiz "+"
	minusSign: .asciiz "-"
	multiSign: .asciiz "*"