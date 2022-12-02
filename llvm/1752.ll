.data
  _u: .word 0
  _v: .word 6
  _s: .word 9
  _dim_2: .space 36
  _array: .word 1, 2, 2, 4
  __str_0: .asciiz "20373394\n"
  __str_1: .asciiz "a = "
  __str_2: .asciiz "\n"
  __str_3: .asciiz "b = "
  __str_4: .asciiz "\n"
  __str_5: .asciiz "first: "
  __str_6: .asciiz "first : "
  __str_7: .asciiz "\n"
  __str_8: .asciiz " is not 2\n"
  __str_9: .asciiz "xxxx\n"
.text
  jal _main
_add_three:
  move $fp, $sp
  sw $a0, -4($fp)
__add_three_b0:
  lw $a1, -8($fp)
  addiu $a1, $a1, 0
  lw $s3, 0($a1)
  lw $a2, -4($fp)
  addu $a3, $a2, $s3
  lw $t0, -12($fp)
  addu $t1, $a3, $t0
  sw $a2, -16($fp)
  sw $t0, -20($fp)
  move $sp, $fp
  move $v0, $t1
  jr $ra
_add1:
  move $fp, $sp
  sw $a0, -4($fp)
__add1_b0:
  lw $a1, -4($fp)
  lw $a2, -8($fp)
  addu $a3, $a1, $a2
  la $a0, __str_0
  li $v0, 4
  syscall
  la $a0, __str_1
  li $v0, 4
  syscall
  move $a0, $a1
  li $v0, 1
  syscall
  la $a0, __str_2
  li $v0, 4
  syscall
  la $a0, __str_3
  li $v0, 4
  syscall
  move $a0, $a2
  li $v0, 1
  syscall
  la $a0, __str_4
  li $v0, 4
  syscall
  sw $a1, -12($fp)
  sw $a2, -16($fp)
  sw $a3, -20($fp)
  move $sp, $fp
  move $v0, $a3
  jr $ra
_addmmm:
  move $fp, $sp
  sw $a0, -4($fp)
__addmmm_b0:
  lw $a1, -4($fp)
  lw $a2, -8($fp)
  addu $a3, $a1, $a2
  lw $t0, -12($fp)
  addu $t1, $a3, $t0
  sw $a1, -16($fp)
  sw $a2, -20($fp)
  sw $t0, -24($fp)
  move $sp, $fp
  move $v0, $t1
  jr $ra
_add:
  move $fp, $sp
__add_b0:
  move $sp, $fp
  li $v0, 99
  jr $ra
_printarrrr:
  move $fp, $sp
  sw $a0, -4($fp)
__printarrrr_b0:
  lw $a1, -4($fp)
  addiu $a1, $a1, 0
  la $a0, __str_5
  li $v0, 4
  syscall
  lw $s3, 0($a1)
  move $a0, $s3
  li $v0, 1
  syscall
  move $sp, $fp
  jr $ra
_printarr:
  move $fp, $sp
  sw $a0, -4($fp)
__printarr_b0:
  lw $a1, -4($fp)
  addiu $a1, $a1, 0
  la $a0, __str_6
  li $v0, 4
  syscall
  lw $s3, 0($a1)
  move $a0, $s3
  li $v0, 1
  syscall
  move $sp, $fp
  jr $ra
_main:
  move $fp, $sp
__main_b0:
  addiu $a1, $fp, -28
  addiu $a1, $a1, 0
  li $a2, 1
  sw $a2, 0($a1)
  addiu $a3, $fp, -28
  addiu $a3, $a3, 4
  li $t0, 2
  sw $t0, 0($a3)
  addiu $t1, $fp, -28
  addiu $t1, $t1, 8
  li $t2, 3
  sw $t2, 0($t1)
  addiu $t3, $fp, -28
  addiu $t3, $t3, 12
  li $t4, 4
  sw $t4, 0($t3)
  addiu $t5, $fp, -28
  addiu $t5, $t5, 16
  li $t6, 5
  sw $t6, 0($t5)
  addiu $t7, $fp, -28
  addiu $t7, $t7, 20
  li $s0, 7
  sw $s0, 0($t7)
  addiu $s1, $fp, -28
  addiu $s1, $s1, 24
  li $s2, 8
  sw $s2, 0($s1)
  addiu $t8, $fp, -36
  addiu $t8, $t8, 0
  li $t9, 2
  sw $t9, 0($t8)
  sw $a1, -76($fp)
  addiu $a1, $fp, -36
  addiu $a1, $a1, 4
  li $a2, 6
  sw $a2, 0($a1)
  sw $a3, -80($fp)
  addiu $a3, $fp, -40
  addiu $a3, $a3, 0
  li $t0, 1
  sw $t0, 0($a3)
  addiu $t1, $fp, -56
  addiu $t1, $t1, 0
  li $t2, 1
  sw $t2, 0($t1)
  addiu $t3, $fp, -56
  addiu $t3, $t3, 4
  li $t4, 2
  sw $t4, 0($t3)
  lw $t5, -76($fp)
  lw $s3, 0($t5)
  addiu $t6, $fp, -56
  addiu $t6, $t6, 8
  sw $s3, 0($t6)
  lw $t7, -80($fp)
  lw $s4, 0($t7)
  addiu $s0, $fp, -56
  addiu $s0, $s0, 12
  sw $s4, 0($s0)
  j __main_b25
__main_b26:
__main_b23:
  addiu $a1, $fp, -28
  addiu $a1, $a1, 4
  li $a2, 3
  sw $a2, 0($a1)
  j __main_b24
__main_b25:
  j __main_b28
__main_b30:
  j __main_b29
__main_b28:
  addiu $a1, $fp, -28
  addiu $a1, $a1, 0
  lw $s3, 0($a1)
  addiu $a2, $s3, 99
  li $t0, 99
  slt $a3, $a2, $t0
  bgtz $a3, __main_b31
  j __main_b32
__main_b31:
  sw $a0, -84($fp)
  sw $fp, -88($fp)
  sw $ra, -92($fp)
  addiu $sp, $sp, -92
  jal _add
  addiu $sp, $sp, 92
  lw $ra, -92($sp)
  lw $fp, -88($sp)
  lw $a0, -84($sp)
  move $a1, $v0
  li $a2, 99
  div $a2, $a1
  mflo $a3
  addiu $t0, $fp, -28
  addiu $t0, $t0, 4
  sw $a3, 0($t0)
__main_b32:
__main_b29:
__main_b24:
  addiu $a1, $fp, -28
  addiu $a1, $a1, 4
  lw $s3, 0($a1)
  addiu $a2, $fp, -28
  addiu $a2, $a2, 8
  lw $s4, 0($a2)
  sw $s3, -88($fp)
  sw $s4, -92($fp)
  sw $a0, -96($fp)
  sw $fp, -100($fp)
  sw $ra, -104($fp)
  addiu $sp, $sp, -104
  sw $s4, -8($sp)
  move $a0, $s3
  jal _add1
  addiu $sp, $sp, 104
  lw $ra, -104($sp)
  lw $fp, -100($sp)
  lw $a0, -96($sp)
  lw $s3, -88($fp)
  lw $s4, -92($fp)
  move $a3, $v0
  li $v0, 5
  syscall
  move $t0, $v0
  la $t1, _array
  addiu $t1, $t1, 4
  lw $s5, 0($t1)
  sw $s5, -92($fp)
  sw $t0, -96($fp)
  sw $t1, -100($fp)
  sw $a0, -104($fp)
  sw $fp, -108($fp)
  sw $ra, -112($fp)
  addiu $sp, $sp, -112
  sw $s5, -8($sp)
  move $a0, $t0
  jal _add1
  addiu $sp, $sp, 112
  lw $ra, -112($sp)
  lw $fp, -108($sp)
  lw $a0, -104($sp)
  lw $s5, -92($fp)
  lw $t0, -96($fp)
  lw $t1, -100($fp)
  move $t2, $v0
  li $t3, 0
  subu $t4, $t3, $t0
  lw $s6, 0($t1)
  sw $s6, -96($fp)
  sw $t0, -100($fp)
  sw $t4, -104($fp)
  sw $a0, -108($fp)
  sw $fp, -112($fp)
  sw $ra, -116($fp)
  addiu $sp, $sp, -116
  sw $s6, -8($sp)
  move $a0, $t4
  jal _add1
  addiu $sp, $sp, 116
  lw $ra, -116($sp)
  lw $fp, -112($sp)
  lw $a0, -108($sp)
  lw $s6, -96($fp)
  lw $t0, -100($fp)
  lw $t4, -104($fp)
  move $t5, $v0
  sw $t0, -100($fp)
  sw $a0, -104($fp)
  sw $fp, -108($fp)
  sw $ra, -112($fp)
  addiu $sp, $sp, -112
  li $a0, 1
  sw $a0, -8($sp)
  move $a0, $t0
  jal _add1
  addiu $sp, $sp, 112
  lw $ra, -112($sp)
  lw $fp, -108($sp)
  lw $a0, -104($sp)
  lw $t0, -100($fp)
  move $t6, $v0
  sw $t0, -104($fp)
  sw $a0, -108($fp)
  sw $fp, -112($fp)
  sw $ra, -116($fp)
  addiu $sp, $sp, -116
  li $a0, 3
  sw $a0, -12($sp)
  li $a0, 2
  sw $a0, -8($sp)
  li $a0, 1
  jal _addmmm
  addiu $sp, $sp, 116
  lw $ra, -116($sp)
  lw $fp, -112($sp)
  lw $a0, -108($sp)
  lw $t0, -104($fp)
  move $t7, $v0
  addiu $s0, $fp, -28
  addiu $s0, $s0, 12
  addiu $s1, $fp, -28
  addiu $s1, $s1, 20
  sw $t0, -108($fp)
  sw $s0, -112($fp)
  sw $s1, -116($fp)
  sw $a0, -120($fp)
  sw $fp, -124($fp)
  sw $ra, -128($fp)
  addiu $sp, $sp, -128
  jal _add
  addiu $sp, $sp, 128
  lw $ra, -128($sp)
  lw $fp, -124($sp)
  lw $a0, -120($sp)
  lw $s0, -112($fp)
  lw $s1, -116($fp)
  lw $t0, -108($fp)
  move $s2, $v0
  lw $s7, 0($s1)
  mul $t8, $s7, $s2
  lw $s3, 0($s0)
  subu $t9, $s3, $t8
  sw $t9, 0($s0)
  lw $s4, -68($fp)
  li $a1, 0
  subu $a2, $a1, $s4
  sw $t0, -112($fp)
  sw $a2, -116($fp)
  sw $a0, -120($fp)
  sw $fp, -124($fp)
  sw $ra, -128($fp)
  addiu $sp, $sp, -128
  jal _add
  addiu $sp, $sp, 128
  lw $ra, -128($sp)
  lw $fp, -124($sp)
  lw $a0, -120($sp)
  lw $a2, -116($fp)
  lw $t0, -112($fp)
  move $a3, $v0
  sw $t0, -116($fp)
  sw $a2, -120($fp)
  sw $a0, -124($fp)
  sw $fp, -128($fp)
  sw $ra, -132($fp)
  addiu $sp, $sp, -132
  li $a0, 3
  sw $a0, -8($sp)
  li $a0, 1
  jal _add1
  addiu $sp, $sp, 132
  lw $ra, -132($sp)
  lw $fp, -128($sp)
  lw $a0, -124($sp)
  lw $a2, -120($fp)
  lw $t0, -116($fp)
  move $t1, $v0
  addiu $t2, $fp, -28
  addiu $t2, $t2, 0
  lw $s5, 0($t2)
  li $t3, 0
  sw $t3, -68($fp)
  sw $t0, -60($fp)
  sw $a2, -72($fp)
__main_b76:
__main_b77:
__main_b80:
__main_b81:
  lw $s3, -68($fp)
  addiu $a1, $fp, -28
  sll $a2, $s3, 2
  addu $a1, $a1, $a2
  addiu $a1, $a1, 0
  lw $s4, 0($a1)
  seq $a3, $s4, 2
  bgtz $a3, __main_b86
  j __main_b85
__main_b86:
  addiu $a1, $fp, -28
  addiu $a1, $a1, 0
  lw $s3, 0($a1)
  sgt $a2, $s3, 0
  bgtz $a2, __main_b83
  j __main_b85
__main_b83:
  lw $s3, -68($fp)
  addiu $a1, $fp, -28
  sll $a2, $s3, 2
  addu $a1, $a1, $a2
  addiu $a1, $a1, 0
  lw $s4, 0($a1)
  move $a0, $s4
  li $v0, 1
  syscall
  la $a0, __str_7
  li $v0, 4
  syscall
  j __main_b84
__main_b85:
__main_b84:
  lw $s3, -68($fp)
  addiu $a1, $fp, -28
  sll $a2, $s3, 2
  addu $a1, $a1, $a2
  addiu $a1, $a1, 0
  lw $s4, 0($a1)
  sne $a3, $s4, 2
  bgtz $a3, __main_b98
  j __main_b99
__main_b98:
  lw $s3, -68($fp)
  addiu $a1, $fp, -28
  sll $a2, $s3, 2
  addu $a1, $a1, $a2
  addiu $a1, $a1, 0
  lw $s4, 0($a1)
  move $a0, $s4
  li $v0, 1
  syscall
  la $a0, __str_8
  li $v0, 4
  syscall
__main_b99:
  la $a0, __str_9
  li $v0, 4
  syscall
  lw $s3, -68($fp)
  addiu $a1, $s3, 1
  addiu $a2, $fp, -28
  sll $a1, $a1, 2
  addu $a2, $a2, $a1
  addiu $a2, $a2, 0
  lw $s4, 0($a2)
  li $a3, 0
  subu $t0, $a3, $s4
  sge $t1, $t0, 0
  sw $a1, -68($fp)
  bgtz $t1, __main_b111
__main_b114:
  addiu $a1, $fp, -28
  addiu $a1, $a1, 0
  lw $s3, 0($a1)
  sle $a2, $s3, 0
  bgtz $a2, __main_b120
  j __main_b113
__main_b120:
__main_b111:
  lw $s3, -68($fp)
  addiu $a1, $fp, -28
  sll $a2, $s3, 2
  addu $a1, $a1, $a2
  addiu $a1, $a1, 0
  lw $s4, 0($a1)
  mul $a3, $s4, 3
  sw $a3, 0($a1)
  j __main_b82
__main_b113:
  j __main_b80
__main_b112:
  j __main_b80
__main_b82:
  la $a1, _array
  addiu $a1, $a1, 0
  la $a2, _array
  addiu $a2, $a2, 8
  sw $a1, -120($fp)
  sw $a2, -124($fp)
  sw $a0, -128($fp)
  sw $fp, -132($fp)
  sw $ra, -136($fp)
  addiu $sp, $sp, -136
  sw $a2, -8($sp)
  move $a0, $a1
  jal _printarr
  addiu $sp, $sp, 136
  lw $ra, -136($sp)
  lw $fp, -132($sp)
  lw $a0, -128($sp)
  lw $a1, -120($fp)
  lw $a2, -124($fp)
  la $a3, _array
  addiu $a3, $a3, 0
  sw $a3, -124($fp)
  sw $a0, -128($fp)
  sw $fp, -132($fp)
  sw $ra, -136($fp)
  addiu $sp, $sp, -136
  move $a0, $a3
  jal _printarrrr
  addiu $sp, $sp, 136
  lw $ra, -136($sp)
  lw $fp, -132($sp)
  lw $a0, -128($sp)
  lw $a3, -124($fp)
  li $v0, 10
  syscall
