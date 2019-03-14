	.data
var1:	.word	20 #s1
var2:	.word	0  #s2
var3:	.word	0  #s3
var4:   .word   0  #i
	.text
main:
	lw $s1,var1
	#addi $s1,$0,20 #var1
	lw $s2,var2
	#add $s2,$0,$0 #numof1s var2
	lw $t0,var4
	lw $s3,var3
	#add $t0,$0,$0 #i
	addi $t1,$0,2 #2
	add $t3,$0,$s1 #20
LOOP:
	slti $t2,$t0,32 #1or0
	beq $t2,$0,EXIT
	div $t3,$t1
	mfhi $t4 #reminder
	mflo $t3 #quotient
	addi $t0,$t0,1
	beq $t4,$0,LOOP
	addi $s2,$s2,1
	j LOOP
EXIT:
	addi $t5,$0,32
	sub $s3,$t5,$s2 #var3
	sw $s1,var1
	sw $s2,var2
	sw $s3,var3
	sw $t0,var4
	jr $ra
