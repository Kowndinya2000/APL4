.data					
	Multiplicand_M:	.word 23  
	Multiplier_Q: .word 12
	Answer_A: .space 8
	Cout: .space 1
.text
	main:
		addi $t0,$zero,0	
		addi $s0,$zero,0	
		addi $s1,$zero,0	
		addi $s2,$zero,0	
		lw $s3,Multiplier_Q	
		addi $t1,$zero,0	
		loop:
			and $t1,$s3,1
			srl $s3,$s3,1
			beq $t1,1,addAndShift
			beq $t1,0,Shift
			
		addAndShift:
			addu $t1,$s1,$zero		
			lw $s4,Multiplicand_M
			addu $s1,$s1,$s4
			sltu $t2,$s1,$t1		
			sltu $s0,$s1,$s4
			or $s0,$s0,$t2			
			b Shift		
			
		Shift:
			li $t4,0
			andi $t4,$s1,1			
      sll $t4,$t4,31			
			srl $s2,$s2,1			
			or $s2,$s2,$t4
			srl $s1,$s1,1			
			add $t4,$s0,$zero		
      sll $t4,$t4,31			
			or $s1,$s1,$t4					
			addi $t0,$t0,1			
			blt $t0,32,loop			
			j end
			
		end:
			li $t0,0			 
			sw $s2,Answer_A($t0)
			addi $t0,$zero,4
			sw $s1,Answer_A($t0)
			sw $s0,Cout
			li $v0,10	
syscall
