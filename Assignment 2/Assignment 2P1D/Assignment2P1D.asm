##########################################################################
# Samuel Wait, CS 2318-254, Assignment 2 Part 1 Program D
############################
#Prompt the user to enter the integer scores for Exam 1, Exam 2 
#and Final Exam, read the scores,
#compute the weighted average score (using the following formula)
#and display a labeled output about the weighted average score.
############################ data segment ################################
			.data
prompt1:		.asciiz "Enter integer score for Exam 1: "
prompt2:		.asciiz "Enter integer score for Exam 2: "
prompt3:		.asciiz "Enter integer score for Final Exam: "
avgscore:		.asciiz "Your average score is: "
############################ code segment ################################
			.text
			.globl main
main:
			#Prompts the user for integer exam score 1
			li $v0, 4
			la $a0, prompt1
			syscall
			#Takes integer user input from prompt and stores in $v0
			li $v0, 5
			syscall
			#moves integer user input from $v0 into $t0
			move $t0, $v0
			
			li $v0, 11
			li $a0, '\n'
			syscall

			#Prompts the user for integer exam score 2
			li $v0, 4
			la $a0, prompt2
			syscall
			#Takes integer user input from prompt and stores in $v0
			li $v0, 5
			syscall
			#moves integer user input from $v0 into $t1
			move $t1, $v0
			
			li $v0, 11
			li $a0, '\n'
			syscall
			
			#Prompts the user for integer final exam score
			li $v0, 4
			la $a0, prompt3
			syscall
			#Takes integer user input from prompt and stores in $v0
			li $v0, 5
			syscall
			#moves integer user input from $v0 into $t2
			move $t2, $v0
			
			li $v0, 11
			li $a0, '\n'
			syscall
			
			#Calculate weighted exam 1 score
			li $t4, 410
			mul $t0, $t0, $t4 #$t0 has $t0 * 410
			srl  $t0, $t0, 11 #shift right by 11 bits to divide the value by 2048
			
			#Calculate weighted exam 2 score
			li $t4, 256
			li $t5, 853
			sll $t1, $t1, 8 #shift $t1 left by 8 bits to multiply by 256
			div $t1, $t5 #Lo has $t1*256 / 853
			mflo $t1 #t1 has $t1*256 / 853
			
			#calculate weighted final exam score
			srl $t2, $t2, 1 #shift right by 1 bit to divide value in $t2 by 2
			
			#add all weighted exam values together
			add $t0, $t0, $t1 #$t0 has $t0 + $t1
			add $t0, $t0, $t2 #$t0 has $t0 + $t1 + $t2
			
			#displays labeled final result/average score
			li $v0, 4
			la $a0, avgscore
			syscall
			li $v0, 1
			move $a0, $t0
			syscall
			
			#Exit
			li $v0, 10
			syscall
			
			  
			
			
			
			
			



		