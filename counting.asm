##################################################################################
#Title:				counting.asm
#Author:                   	Anthony Nann II
#Date:                     	September 25, 2017
#Course & Section:          	CSC 211-001W
#Description:               	Takes an integer from the user and print numbers
#				until the users number is printed
##################################################################################
#	Initial Algorithm:
#	Get number from user
#	while counter less than number
#		while innerCounter less than 10
#			print number and spaces
#			increment counters
#		print a newline char
#		set innerCounter to 0
#	end
##################################################################################
#	Refined Algorithm:
#	Get Number from user and store it
#	Establish a bunch of useful integers
#	startOuter label
#		startInner label
#			if innerNumber equals 10, jump to endInner
#			print counter
#			print two spaces
#			if counter equals number, jump to endOuter
#			increment counter
#			increment innerNumber
#			jump to startInner
#		endInner label
#			innerNumber=0
#			print newline character
#			jump to start outer
#	endOuter
#		print newline
#		end program
#
#	
##################################################################################

.text
.globl __start

__start:
	# Get Number from user and store it
	la $a0,prompt	        			
	li $v0,4                 			
	syscall                  			
	li $v0,5                 			
	syscall                  			
	move $t0,$v0             			

	# Establish a bunch of useful integers
	li $t1,1	# "counter"
	li $t2,10	# Value of 10
	li $t3,0	# "innerNumber"
	li $t4,1	# Value of 1

	startOuter:
		startInner:

			# If innerNumber equals 10, jump to endInner
			beq $t3,$t2,endInner

			# Print counter
			move $a0,$t1
			li $v0,1
			syscall

			# Print two spaces
			la $a0,spaces	        	# load address of prompt into a0
			li $v0,4                 	# load call code number to display a string into v0
			syscall

			# If counter equals number, jump to endOuter
			beq $t0,$t1,endOuter

			#increment counter
			add $t1,$t1,$t4

			# increment innerNumber
			add $t3,$t3,$t4

			# Jump to startInner
			j startInner

		endInner:

			# innerNumber=0
			sub $t3,$t3,$t3
			
			# Print newline character
			la $a0,newline
			li $v0,4
			syscall

			# Jump to start outer
			j startOuter
	endOuter: 

	# Print newline
	la $a0,newline
	li $v0,4
	syscall

	# End program			
	li $v0,10                			# Exit
	syscall

.data
	prompt: 	.asciiz "Enter a number: "
	spaces:		.asciiz "  "
	newline:	.asciiz "\n"