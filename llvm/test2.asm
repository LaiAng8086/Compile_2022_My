.data
	x:	.word 4
	str_0:	.asciiz "Hello!\n"
.text
jal main
foo:
	add $a0,$zero,$zero
	addiu $sp, $sp, -16
	sw $ra, 12($sp)
	sw $fp, 8($sp)
	sw $a0, 4($sp)
	sw $a1, 0($sp)
	move $fp, $sp
	addiu $t0, $a0, 1
	addiu $t1, $a1, 1
	move $a0, $t0
	move $a1, $t1
	jal foo
	move $sp, $fp
	lw $fp, 8($sp)
	lw $ra, 12($sp)
	jr $ra
main:
	la $t0, x
	lw $a0,0($t0)
	move $a1, $a0
	jal foo
	la $a0,str_0
	li $v0,4
	syscall
	syscall
	li $v0,10
	syscall
	