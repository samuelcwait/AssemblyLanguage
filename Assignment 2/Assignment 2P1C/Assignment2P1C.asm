##########################################################################
# Samuel Wait, CS 2318-254, Assignment 2 Part 1 Program C
############################
#Allocate a global array (i.e., space in the data segment) enough for 
#storing 3 integers and initialize the array (from 1st to 3rd element)
# with 3033, 2022 and 1011 at the same time
#Display a labeled output about the array's initial contents
#Re-order the values in the array so that the contents of the array in memory
#Display a labeled output about the array's contents
############################ data segment ################################
			.data
intArray:		.word 3033, 2022, 1011 #global int array of integers
						#initialized to 3033,2022,1011
intArrayContents:	.asciiz "Original Contents of intArray: "
intArray0:		.asciiz "intArray[0]: "
intArray1:		.asciiz "intArray[1]: "
intArray2:		.asciiz "intArray[2]: "
swapped1and2:		.asciiz "Swapped intArray[0] and intArray[1]:"
swapped1and3:		.asciiz "Swapped intArray[0] and intArray[2]"
swapped2and3:		.asciiz "Swapped intArray[1] and intArray[2]"
						
############################ code segment ################################
			.text
			.globl main
main:
			#loading the contents of intArray into temporary registers
			la $t0, intArray #$t0 has address of intArray
			lw $t1, 0($t0) #$t1 has intArray[0] (3033)
			lw $t2, 4($t0) #$t2 has intArray[1] (2022)
			lw $t3, 8($t0) #$t3 has intArray[2] (1011)
			
			#Printing the contents of intArray
			li $v0, 4
			la $a0, intArrayContents
			syscall
			li $v0, 11
			li $a0, '\n'
			syscall
			
			li $v0, 4
			la $a0, intArray2
			syscall
			li $v0, 1
			move $a0, $t3 #should print intArray[2] (1011)
			syscall
			li $v0, 11
			li $a0, '\n'
			syscall
			
			li $v0, 4
			la $a0, intArray1
			syscall
			li $v0, 1
			move $a0, $t2 #should print intArray[1] (2022)
			syscall
			li $v0, 11
			li $a0, '\n'
			syscall
			
			li $v0, 4
			la $a0, intArray0
			syscall
			li $v0, 1
			move $a0, $t1 #should print intArray[0] (3033)
			syscall
			li $v0, 11
			li $a0, '\n'
			syscall
			
			#Swapping intArray[0] and intArray[1] in memory 
			lw $t1, 0($t0) #reloads intArray[0] (3033) into $t1 from memory
			lw $t2, 4($t0) #reloads intArray[1] (2022) into $t2 from memory
			sw $t2, 0($t0) #stores int in $t2 (2022) to intarray[0]
			sw $t1, 4($t0) #stores int in $t1 (3033) to intarray[1]
			#intArray should now = 2022,3033,1011

			#Printing the contents of intArray
			lw $t1, 0($t0) #$t1 has intArray[0] (2022)
			lw $t2, 4($t0) #$t2 has intArray[1] (3033)
			lw $t3, 8($t0) #$t3 has intArray[2] (1011)
			 
			li $v0, 11
			li $a0, '\n'
			syscall
			li $v0, 4
			la $a0, swapped1and2
			syscall
			li $v0, 11
			li $a0, '\n'
			syscall
			
			li $v0, 4
			la $a0, intArray2
			syscall
			li $v0, 1
			move $a0, $t3 #should print intArray[2] (1011)
			syscall
			li $v0, 11
			li $a0, '\n'
			syscall
			
			li $v0, 4
			la $a0, intArray1
			syscall
			li $v0, 1
			move $a0, $t2 #should print intArray[1] (3033)
			syscall
			li $v0, 11
			li $a0, '\n'
			syscall
			
			li $v0, 4
			la $a0, intArray0
			syscall
			li $v0, 1
			move $a0, $t1 #should print intArray[0] (2022)
			syscall
			li $v0, 11
			li $a0, '\n'
			syscall
			
			#Swapping intArray[0] and intArray[2]
			lw $t3, 8($t0) #reloads intArray[2] (1011) into $t3 from memory
			lw $t2, 0($t0) #reloads intArray[0] (2022) into $t2 from memory
			sw $t3, 0($t0) #stores int in $t3 (1011) to intarray[0]
			sw $t2, 8($t0) #stores int in $t2 (2022) to intarray[2]
			#intArray should now = 1011,3033,2022
			
			#Printing the contents of intArray
			lw $t1, 0($t0) #$t1 has intArray[0] (1011)
			lw $t2, 4($t0) #$t2 has intArray[1] (3033)
			lw $t3, 8($t0) #$t3 has intArray[2] (2022)
			
			li $v0, 11
			li $a0, '\n'
			syscall
			li $v0, 4
			la $a0, swapped1and3
			syscall
			li $v0, 11
			li $a0, '\n'
			syscall
			
			
			li $v0, 4
			la $a0, intArray2
			syscall
			li $v0, 1
			move $a0, $t3 #should print intArray[2] (2022)
			syscall
			li $v0, 11
			li $a0, '\n'
			syscall
			
			li $v0, 4
			la $a0, intArray1
			syscall
			li $v0, 1
			move $a0, $t2 #should print intArray[1] (3033)
			syscall
			li $v0, 11
			li $a0, '\n'
			syscall
			
			li $v0, 4
			la $a0, intArray0
			syscall
			li $v0, 1
			move $a0, $t1 #should print intArray[0] (1011)
			syscall
			li $v0, 11
			li $a0, '\n'
			syscall
			
			#Swapping intArray[1] and intArray[2]
			lw $t2, 8($t0) #reloads intArray[2] (2022) into $t2 from memory
			lw $t1, 4($t0) #reloads intArray[1] (3033) into $t1 from memory
			sw $t2, 4($t0) #stores int in $t2 (2022) to intarray[1]
			sw $t1, 8($t0) #stores int in $t1 (3033) to intarray[2]
			#intArray should now = 1011,2022,3033
			
			#Printing the contents of intArray 
			lw $t1, 0($t0) #$t1 has intArray[0] (1011)
			lw $t2, 4($t0) #$t2 has intArray[1] (2022)
			lw $t3, 8($t0) #$t3 has intArray[2] (3033)
			
			li $v0, 11
			li $a0, '\n'
			syscall
			li $v0, 4
			la $a0, swapped1and2
			syscall
			li $v0, 11
			li $a0, '\n'
			syscall
			
			li $v0, 4
			la $a0, intArray2
			syscall
			li $v0, 1
			move $a0, $t3 #should print intArray[2] (1011)
			syscall
			li $v0, 11
			li $a0, '\n'
			syscall
			
			li $v0, 4
			la $a0, intArray1
			syscall
			li $v0, 1
			move $a0, $t2 #should print intArray[1] (3033)
			syscall
			li $v0, 11
			li $a0, '\n'
			syscall
			
			li $v0, 4
			la $a0, intArray0
			syscall
			li $v0, 1
			move $a0, $t1 #should print intArray[0] (2022)
			syscall
			li $v0, 11
			li $a0, '\n'
			syscall
			
			#Graceful exit
			li $v0, 10
			syscall
			
			