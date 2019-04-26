.data
num1:  .float    4.67894578
num2:  .float    2.67986487
num3:  .float    0.00000000
num4:  .float    0.00000000
num5:  .float    0.00000000
num6:  .float    0.00000000
msg1:  .asciiz "SUM IN SINGLE PRECISION : "
msg2:  .asciiz "SUBSTRACTION IN SINGLE PRECISION : "
msg3:  .asciiz "MULTIPLICATION IN SINGLE PRECISION : "
msg4:  .asciiz "DIVISON IN SINGLE PRECISION : "
msg5: .asciiz "\n"

.text

main:
la    $t0,num3
la    $t1,num4
la    $t2,num5
la    $t3,num6
lwc1  $f0,num1
lwc1  $f1,num2
add.s $f2,$f0,$f1  # $f2 = num1 + num2
swc1  $f2,0($t0)   
sub.s $f3,$f0,$f1  # $f3 = num1 - num2
swc1  $f3,0($t1)
mul.s $f4,$f0,$f1  # $f4 = (num1)*(num2)
swc1  $f4,0($t2)
div.s $f5,$f0,$f1  # $f5 = (num1)/(num2)
swc1  $f5,0($t3)


li   $v0,4
la   $a0,msg1
	syscall 
li   $v0,2
lwc1 $f12,0($t0)
	syscall
li   $v0,4
la   $a0,msg5
	syscall



li   $v0,4
la   $a0,msg2
	syscall
li   $v0,2
lwc1 $f12,0($t1)
	syscall
li   $v0,4
	la   $a0,msg5
	syscall



li   $v0,4
la   $a0,msg3
	syscall
li   $v0,2
lwc1 $f12,0($t2)
	syscall
li   $v0,4
	la   $a0,msg5
	syscall


li   $v0,4
la   $a0,msg4
	syscall
li   $v0,2
lwc1 $f12,0($t3)
	syscall
li   $v0,4
	la   $a0,msg5
	syscall






END:
li  $v0,10
syscall