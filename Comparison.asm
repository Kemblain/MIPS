##################################################################################
#Title:				Algorithm Example
#Author:                   	Anthony Nann II
#Date:                     	September 18, 2017
#Course & Section:          	CSC 211-001W
#Description:               	Takes three integers from a user and finds the 
#				largest one. 
##################################################################################
#	Initial Algorithm:
#	Get three numbers from the user
#	If first is smaller than second
#		if second is smaller than third
#			third is the biggest
#		else
#			second is the biggest
#	elseif first is smaller than third
#		third is the biggest
#	else
#		first is the biggest
#
#	Input Variables: Three integers from user
#	Output Variables: Just the display of which is largest
#
##################################################################################
#	Refined Algorithm:
#	Get first number from user and store it
#	Get Second number from user and store it
#	Get third number from user and store it
# 	Output beginning of output string
#	If first is smaller than second go to FIRSTELSE
#		FIRSTELSE:If second is smaller than third go to THIRDELSE
#			THIRDELSE: print integer 3
#			jump to endif
#		print integer 2
#		jump to endif
#	If first is smaller than third go to SECONDELSE
#		SECONDELSE: print integer 3
#	Print integer one
#	Jump to endif
#	ENDIF
#	print a newline char and end the program
##################################################################################
.text
.globl __start

__start:
# Get first number from user and store it
la $a0,prompt1           	# load address of prompt into a0
li $v0,4                 	# load call code number to display a string into v0
syscall                  	# system call to print the prompt for 1st integer

li $v0,5                 	# load call code number to read first integer -> v0
syscall                  	# system call to read first integer and store in v0

move $t0,$v0             	# move integer from v0 -> t0 for safe keeping
                         	# t0 holds first integer

# Get Second number from user and store it
la $a0,prompt2           	# load address of prompt into a0
li $v0,4                 	# load call code number to display a string into v0
syscall                  	# system call to print the prompt for 2nd integer

li $v0,5                 	# load call code number to read an integer -> v0
syscall                  	# system call to read second integer and store in v0

move $t1,$v0             	# move integer from v0 -> t1 for safe keeping
    				# t1 holds second integer

# Get third number from user and store it
la $a0,prompt3			# load address of prompt3 into a0
li $v0,4			# load call code number to display a string into v0
syscall				# system call to print the prompt for 3rd integer

li $v0,5			# load call code number to read an integer -> v0
syscall				# system call to read second integer and store in v0

move $t2,$v0			# move integer from v0 -> t2 for safe keeping
				# t2 holds second integer

# Output beginning of output string
la $a0, output           	# load address of output message into a0
li $v0,4                 	# load call code number to display a string into v0
syscall                  	# system call to print output string


# If first is smaller than second go to FIRSTELSE
blt $t0,$t1,FIRSTELSE		# if one is smaller than two go to FIRSTELSE

# If first is smaller than third go to SECONDELSE
blt $t0,$t2,SECONDELSE		# if one is smaller than three go to SECONDELSE

# Print integer one
# Jump to endif
move $a0,$t0			# load integer one
li $v0,1			# load instruction to print integer
syscall                  	# system call to print output string
j ENDIF				#jump to endif


# FIRSTELSE:If second is smaller than third go to THIRDELSE
FIRSTELSE: blt $t1,$t2,THIRDELSE	#if 2 is smaller than 3 go to third else

# print integer 2
# jump to endif
move $a0,$t1			# load integer two
li $v0,1			# load instruction to print integer2
syscall                  	# system call to print output string
j ENDIF				#jump to endif

SECONDELSE: move $a0,$t2		# load integer three
li $v0,1			# load instruction to print integer3
syscall                  	# system call to print output string
j ENDIF				#jump to endif


# THIRDELSE: print integer 3
# jump to endif
THIRDELSE:move $a0,$t2		# load integer three
li $v0,1			# load instruction to print integer3
syscall                  	# system call to print output string
j ENDIF				#jump to endif

# print a newline char and end the program
ENDIF: 
la $a0,endl              	# load the new line character into a0
li $v0,4                	# load the call code number to display the string into v0
syscall                  	# system call to print the new line character

li $v0,10                	# Exit
syscall




#####data section######

.data

prompt1: .asciiz "Enter first Integer: "  	#prompt for the 1st integer
prompt2: .asciiz "Enter second Integer: " 	#prompt for the 2nd integer
prompt3: .asciiz "Enter third Integer: " 	#prompt for the 3rd integer
output: .asciiz "The largest integer is " 	#output message
endl: .asciiz "\n"    				#new line