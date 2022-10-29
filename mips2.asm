.data
  a:	.word 4
.text
  lw $t0,a
  move $a0,$t0
  li $v0,1
  syscall
  li $v0,10
  syscall
 