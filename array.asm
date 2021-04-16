        .text
        .globl __start
__start:
                
    la $t0, array    # load address of array into $t0
    li $t1, 10        # size of array is 5 (0 - 4)
    li $t3, 0        # initialize counter to zero
     
    #Populate the array 
     
while:  
    la $a0, intPrompt        #prompt for integer
    li $v0,4                 #a0 = address of string
    syscall                  #v0 = 4, indicates display a String

    li $v0,5                 # enter input -> v0
    syscall                  # 5 is sys call for read int

    sw $v0, ($t0)
    
    add $t0,$t0,4            # move pointer ahead to next array element
    add $t3,$t3,1            # increment counter
    
    
    blt $t3,$t1,while        # branch to while if counter < size of array
        
    
    # End While to populate the array 
wend: 
        
    la $a0,title        # Display "Array: "
    li $v0,4            # a0 = address of message
        syscall
        
    # Loop to print array values
     
    li $t0, 0           # initilize array index value back to 0
    li $t3, 0           # initial size counter back to zero
    la $t0, array       # load address of array back into $t0
        
startPrint:

    lw $t2,($t0)        # load word a[i] into temp (t2)
    move $a0, $t2       # move a[i] to a0 for display
    li $v0,1            # display a[i]
    syscall
        
    la $a0,comma        # Display ", "
    li $v0,4            # a0 = address of message
    syscall             # v0 = 4 which indicates display a string
        
    add $t0,$t0,4       # move pointer ahead to next array element 
    add $t3, $t3, 1     #increment counter
    
    blt $t3,$t1,startPrint     # branch to startPrint if counter < size of array
    
endPrint:     # End loop to print array values
        
    la $a0,crlf         # Display "cr/lf"
    li $v0,4            # a0 = address of message
    syscall             # v0 = 4 which indicates display a string

    li $v0,10           # End Of Program
    syscall

    .data

intPrompt:  .asciiz   "Enter an Integer: "   # hold the prompt message for each int in the array  
title:      .asciiz   "\nArray: "
crlf:       .asciiz   "\n"
comma:      .asciiz   ", "

array:      .word 40  # 5 words
