#Title: 		Lab 1
#Author: 		Anthony Nann
#Date: 			September 5, 2017
#Course & Section: 	CSC 211 001W
#Description: 		Takes a string from the user and prints it with a message.


	.text
	.globl __start
__start:
	la $a0,prompt   	#load address of prompt into a0
      	li $v0,4        	#load instruction number to display a string into v0
      	syscall         	#system call to print the prompt string 
	li $a1, 81      	# set string length
	la $a0, string  	# get address of string variable
	li $v0, 8       	# service call number for reading string from keyboard
	syscall        	 	# Read String
	la $a0, string2		#load adress of string 2
	li $v0, 4		#load instruction to print string
	syscall			#print string2
	la $a0, string   	# load address of string into a0
	li $v0, 4        	# load instruction number to display a string into v0
	syscall          	# system call to print the string
	la $a0, string3		#load adress of string3 into a0
	li $v0, 4		#load instruction to print string3
	syscall			#print string3

	


#####data section######
	.data
	prompt: .asciiz "Enter your name: "
	string: .space 82 			#directive to initialize number of characters in string
	string2: .asciiz "Hello "
	string3: .asciiz "Welcome to CSC 211!"