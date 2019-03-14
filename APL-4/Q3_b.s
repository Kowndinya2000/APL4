.data
	arr_A: .asciiz "kowndi"
	arr_B: .asciiz "abdef"
	arrSize: .word 5
.text
	main:
		jal Swap	
		li $v0,10	
		syscall 
		
	Swap:
		la $t0,arr_A		
		la $t1,arr_B		
		lw $t2,arrSize		
		addi $t3,$zero,0	
		addi $s0,$zero,0
		loopswap:
			add $t4,$t0,$t3
			add $t5,$t1,$t3
			lb $s0,($t4)	
			lb $s1,($t5)
			sb $s0,($t5)	
			sb $s1,($t4)
			addi $t3,$t3,1	
			blt $t3,$t2,loopswap
jr $ra 
