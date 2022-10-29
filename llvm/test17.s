	.text
	.abicalls
	.option	pic0
	.section	.mdebug.abi32,"",@progbits
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.text
	.file	"test17.c"
	.globl	foo                     # -- Begin function foo
	.p2align	2
	.type	foo,@function
	.set	nomicromips
	.set	nomips16
	.ent	foo
foo:                                    # @foo
	.frame	$fp,32,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	addiu	$sp, $sp, -32
	sw	$ra, 28($sp)            # 4-byte Folded Spill
	sw	$fp, 24($sp)            # 4-byte Folded Spill
	move	$fp, $sp
	sw	$4, 20($fp)
	sw	$5, 16($fp)
	lw	$1, 20($fp)
	addiu	$4, $1, 1
	lw	$1, 16($fp)
	addiu	$5, $1, 1
	jal	foo
	nop
	move	$sp, $fp
	lw	$fp, 24($sp)            # 4-byte Folded Reload
	lw	$ra, 28($sp)            # 4-byte Folded Reload
	addiu	$sp, $sp, 32
	jr	$ra
	nop
	.set	at
	.set	macro
	.set	reorder
	.end	foo
$func_end0:
	.size	foo, ($func_end0)-foo
                                        # -- End function
	.globl	main                    # -- Begin function main
	.p2align	2
	.type	main,@function
	.set	nomicromips
	.set	nomips16
	.ent	main
main:                                   # @main
	.frame	$fp,32,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	addiu	$sp, $sp, -32
	sw	$ra, 28($sp)            # 4-byte Folded Spill
	sw	$fp, 24($sp)            # 4-byte Folded Spill
	move	$fp, $sp
	sw	$zero, 20($fp)
	lui	$1, %hi(x)
	lw	$4, %lo(x)($1)
	lui	$1, %hi(y)
	lw	$5, %lo(y)($1)
	jal	foo
	nop
	addiu	$2, $zero, 0
	move	$sp, $fp
	lw	$fp, 24($sp)            # 4-byte Folded Reload
	lw	$ra, 28($sp)            # 4-byte Folded Reload
	addiu	$sp, $sp, 32
	jr	$ra
	nop
	.set	at
	.set	macro
	.set	reorder
	.end	main
$func_end1:
	.size	main, ($func_end1)-main
                                        # -- End function
	.type	x,@object               # @x
	.data
	.globl	x
	.p2align	2
x:
	.4byte	1                       # 0x1
	.size	x, 4

	.type	y,@object               # @y
	.globl	y
	.p2align	2
y:
	.4byte	2                       # 0x2
	.size	y, 4

	.ident	"clang version 10.0.0-4ubuntu1 "
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym foo
	.addrsig_sym x
	.addrsig_sym y
	.text
