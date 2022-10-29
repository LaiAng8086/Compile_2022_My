	.text
	.abicalls
	.option	pic0
	.section	.mdebug.abi32,"",@progbits
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.text
	.file	"test2.c"
	.globl	foo                     # -- Begin function foo
	.p2align	2
	.type	foo,@function
	.set	nomicromips
	.set	nomips16
	.ent	foo
foo:                                    # @foo
	.frame	$fp,24,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	addiu	$sp, $sp, -24
	sw	$ra, 20($sp)            # 4-byte Folded Spill
	sw	$fp, 16($sp)            # 4-byte Folded Spill
	move	$fp, $sp
	sw	$4, 12($fp)
	sw	$5, 8($fp)
	sw	$6, 4($fp)
	lw	$1, 12($fp)
	lw	$2, 8($fp)
	addu	$2, $1, $2
	move	$sp, $fp
	lw	$fp, 16($sp)            # 4-byte Folded Reload
	lw	$ra, 20($sp)            # 4-byte Folded Reload
	addiu	$sp, $sp, 24
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
	addiu	$1, $zero, 4
	sw	$1, 16($fp)
	lui	$1, %hi(a)
	lw	$4, %lo(a)($1)
	lw	$1, 16($fp)
	move	$5, $1
	move	$6, $1
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
	.end	main
$func_end1:
	.size	main, ($func_end1)-main
                                        # -- End function
	.type	a,@object               # @a
	.data
	.globl	a
	.p2align	2
a:
	.4byte	5                       # 0x5
	.size	a, 4

	.ident	"clang version 10.0.0-4ubuntu1 "
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym foo
	.addrsig_sym a
	.text
