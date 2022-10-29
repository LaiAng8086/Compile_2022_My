  .data
   str_0: .asciiz "\n" # str_0 "\n"
   .space 4
   str_end:
   .text
   li $fp, 0x10040000
  
   j func_main
   nop
  
   func_foo:
   lw $s0, 0($fp) # 加载参数a
   lw $s1, 4($fp) # 加载参数b
   add $v0, $s0, $s1 # 计算 a + b，作为函数的返回值
   jr $ra
  
   func_func:
   li $v0, 2 # 常量c1 * c2 = 2
   jr $ra
  
   func_main:
   li $s0, 0 # var v1 0
   li $s1, 1 # var v2 1
  
   li $t0, 0
   bne $s0, $t0, if_end # if v1 == 0 then ...
   li $t1, 1
   bgt $s1, $t1, if_end # if v2 <= 1 then ...
  
   sw $s0, 12($fp) # 传入参数 v1
   sw $s1, 16($fp) # 传入参数 v2
  
   addi $sp, $sp, -12 # 压栈，保存现场
   sw $s0, 0($sp) # 保存现场，此处保存寄存器$s0
   sw $s1, 4($sp) # 保存现场，此处保存寄存器$s1
   sw $ra, 8($sp) # 保存现场，此处保存寄存器$ra
  
   addi $fp, $fp, 12 # 移动帧指针
   jal func_foo # 调用函数foo()
   addi $fp, $fp, -12 # 移动帧指针
  
   lw $s0, 0($sp) # 恢复现场
   lw $s1, 4($sp) # 恢复现场
   lw $ra, 8($sp) # 恢复现场
   addi $sp, $sp, 12 # 弹栈，恢复现场
  
   move $t2, $v0
   addi $t3, $t2, 1 # 计算 res = foo(v1, v2) + 1
   move $s2, $t3 # $s2寄存器分配给变量res
  
   j else_end # 不经过else语句块
  
   if_end: # label if_end
   addi $sp, $sp, -16 # 压栈，保存现场
   sw $s0, 0($sp) # 保存现场，此处保存寄存器$s0
   sw $s1, 4($sp) # 保存现场，此处保存寄存器$s1
   sw $s2, 8($sp) # 保存现场，此处保存寄存器$s2
   sw $ra, 12($sp) # 保存现场，此处保存寄存器$ra
  
   addi $fp, $fp, 12 # 移动帧指针
   jal func_func # 调用函数func()
   addi $fp, $fp, -12 # 移动帧指针
  
   lw $s0, 0($sp) # 恢复现场
   lw $s1, 4($sp) # 恢复现场
   lw $s2, 8($sp) # 恢复现场
   lw $ra, 12($sp) # 恢复现场
   addi $sp, $sp, 16 # 弹栈，恢复现场
  
   move $t4, $v0 # 临时寄存器$t4存储函数func()的返回值
   move $s2, $t4 # $s2寄存器分配给变量res
  
   else_end: # label else_end
   li $v0, 1
   move $a0, $s2 # printf res
   syscall
   li $v0, 4
   la $a0, str_0 # printf "\n"
   syscall
   li $v0, 10
   syscall