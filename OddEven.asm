##################################################################################
#Title:				OddEven.asm
#Author:                   	Anthony Nann II
#Date:                     	September 18, 2017
#Course & Section:          	CSC 211-001W
#Description:               	Takes an integer from the user and determines 
#				whether it is odd or even.
##################################################################################
#	Initial Algorithm:
#	Get number from user
#	Divide by two
#	if remainder equals zero
#		print that it's even
#	print that it's odd
##################################################################################
#	Refined Algorithm:
#	Get Number from user and store it
#	Print beginning of output message
#	Initialize a value of 2
#	Divide integer by 2
#	Get value from hi registry
#	IF hi registry equals zero, go to EVEN
#		print odd
#		jump to endif
#	EVEN
#		print even
#		Jump to endif
#	ENDIF
#	end the program
##################################################################################

.text
.globl __start

__start:
# Get Number from user and store it
la $a0,prompt	        	# load address of prompt into a0
li $v0,4                 	# load call code number to display a string into v0
syscall                  	# system call to print the prompt for 1st integer
li $v0,5                 	# load call code number to read first integer -> v0
syscall                  	# system call to read first integer and store in v0
move $t0,$v0             	# move integer from v0 to t0 

# Print beginning of output message
move $a0,$t0			# load integer one
li $v0,1			# load instruction to print integer
syscall                  	# system call to print output string
la $a0, output1          	# load address of output message into a0
li $v0,4                 	# load call code number to display a string into v0
syscall                  	# system call to print output string

# Initialize a value of 2
li $t1, 2			#set $t1 equal to 2

# Divide integer by 2
div $t0,$t0,$t1

# Get value from hi registry
mfhi $t2

# IF hi registry equals zero, go to EVEN
beqz $t2,EVEN

# print odd
la $a0, output2
li $v0,4
syscall

# Jump to endif
j ENDIF

EVEN:
#print even
la $a0, output3
li $v0,4
syscall

#Jump to endif
j ENDIF 			#This isn't even needed, is it?

ENDIF:
#end the program
la $a0,endl              	# load the new line character into a0
li $v0,4                	# load the call code number to display the string into v0
syscall                  	# system call to print the new line character

li $v0,10                	# Exit
syscall

.data
prompt: .asciiz "Enter a number: "
output1: .asciiz " is"
output2: .asciiz " odd."
output3: .asciiz " even."
endl: .asciiz "\n"    				#new line