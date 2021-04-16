# Title: 		length.asm
# Author: 		Anthony Nann
# Date: 		September 25, 2017
# Course & Section: 	CSC 211 001W
# Description: 		Takes a string from the user and counts the number of characters.



################### text segment ###################

	.text
	.globl __start

__start:                      			# execution starts here

	la $a0,prompt				#display prompt
	li $v0,4
	syscall

	li $a1, 81      			# set string length
	la $a0, string  			# get address of string variable
	li $v0, 8       			# service call number for reading string from keyboard
	syscall        	 			# Read String

	la $t2,string          			# t2 points to the string
	li $t1,0            			# t1 holds the count
        
WHILE:   
	lb $t0,($t2)        			# get a byte from the string
   	beqz $t0,ENDWHILE   			# zero means end of string
   	add $t1,$t1,1       			# increment count
   	add $t2,1           			# move pointer one character
    	j WHILE             			# go around the loop again

ENDWHILE: 
	la $a0,ans          			# display "length is "
     	li $v0,4
     	syscall
  
   	move $a0,$t1        			# display the length
      	li $v0,1
     	syscall

    	la $a0,endl      			# display new line
     	li $v0,4
     	syscall

    	li,$v0,10				# exit
    	syscall

######### data segment ############

        .data
prompt:    	.asciiz "Enter string: "
ans:    	.asciiz "The length is "
endl:   	.asciiz "\n"
string: 	.space 82 			#directive to initialize number of characters in string

######### End Of Program length.asm ##########