.data
	arr_A: .space 20
	arr_B: .space 20
	arrSize: .word 5
.text
	main:
		la $a0,arr_A	
		lw $a1,arrSize
		li $a2,1
		jal Array	
		la $a0,arr_B	
		lw $a1,arrSize
		li $a2,6
		jal Array	
		jal Swap	
		li $v0,10	
    syscall 
	
	  Array:
    
		addi $t3,$zero,0	
    la $t0,($a0)		
		move $t1,$a1		
		move $t2,$a2		
		add $s0,$zero,$t2	
		sll $t1,$t1,2
		loop:
    
			add $t4,$t0,$t3
			sw $s0,($t4)	
			addi $s0,$s0,1	
			addi $t3,$t3,4	
			blt $t3,$t1,loop
		jr $ra
		
	Swap:
		la $t0,arr_A		
		la $t1,arr_B		
		lw $t2,arrSize		
		addi $t3,$zero,0	
		addi $s0,$zero,0
		sll $t2,$t2,2
		loopswap:
    
			add $t4,$t0,$t3
			add $t5,$t1,$t3
			lw $s0,($t4)	
			lw $s1,($t5)
			sw $s0,($t5)	
			sw $s1,($t4)
			addi $t3,$t3,4	
      
      
			blt $t3,$t2,loopswap
jr $ra 
