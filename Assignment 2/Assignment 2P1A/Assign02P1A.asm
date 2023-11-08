#Assign02P1A.asm	Samuel Wait, CS 2318-234, Assignment 2 Part 1 Program A
			
			.data #put something into the data segment in memory
section:		.asciiz "Section Number: "
cs2318:			.asciiz "Welcome to CS2318-" 
food:			.asciiz "Favorite Food (up to 15 characters): "
youlove:		.asciiz "You love "
userfood:		.space 15
firstname:		.asciiz "First character of firstname: "
howdy:			.asciiz "Howdy "

			.text 
			.globl main
main:
			#Prints the section number prompt
			li $v0,4
			la $a0, section
			syscall
			
			#Takes user input 
			li $v0, 5
			syscall
			
			#Prints the section number with input
			move $t0, $v0
			li $v0, 4
			la $a0, cs2318 
			syscall
			
			#Prints the user input integer after the string 
			li $v0, 1 
			move $a0, $t0
			syscall
			
			#Newline
			li $v0, 11
			li $a0, '\n'
			syscall
			
			#Prints the favorite food prompt
			li $v0, 4
			la $a0, food
			syscall
			
			
			#Takes user input for favorite food
			li $v0, 8
			la $a0, userfood
			li $a1, 15
			syscall
			
			#Prints message
			li $v0, 4
			la $a0, youlove
			syscall
			
			#Prints user input food
			li $v0, 4
			la $a0, userfood
			syscall
			
			#Prints the firstname character prompt
			li $v0, 4
			la $a0, firstname
			syscall
			
			#Reads input character
			li $v0, 12
			#la $a0, inputname
			syscall
			move $t0, $v0
			
			#Newline
			li $v0, 11
			li $a0, '\n'
			syscall
			
			#Prints greeting
			li $v0, 4
			la $a0, howdy
			syscall
			
			#prints input character
			li $v0, 11
			move $a0, $t0
			syscall
			
			#System exit
			li $v0, 10
			syscall