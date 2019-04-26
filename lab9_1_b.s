.data
num1:  .double     4.67894578
num2:  .double     2.67986487
num3:  .double     0.00000000
num4:  .double     0.00000000
num5:  .double     0.00000000
num6:  .double     0.00000000
msg1:  .asciiz "SUM IN DOUBLE PRECISION : "
msg2:  .asciiz "SUBSTRACTION IN DOUBLE PRECISION : "
msg3:  .asciiz "MULTIPLICATION IN DOUBLE PRECISION : "
msg4:  .asciiz "DIVISON IN DOUBLEPRECISION : "
msg5: .asciiz "\n"

.text

main:
la    $t0,num3
la    $t1,num4
la    $t2,num5
la    $t3,num6
la    $t4,num1
la    $t5,num2
l.d   $f0,0($t4)
l.d   $f2,0($t5)
add.d $f4,$f0,$f2  # $f2 = num1 + num2
s.d   $f4,0($t0)   
sub.d $f6,$f0,$f2  # $f3 = num1 - num2
s.d   $f6,0($t1)
mul.d $f8,$f0,$f2  # $f4 = (num1)*(num2)
s.d   $f8,0($t2)
div.d $f10,$f0,$f2  # $f5 = (num1)/(num2)
s.d   $f10,0($t3)


li   $v0,4
la   $a0,msg1
	syscall 
li   $v0,3
ldc1 $f12,0($t0)
	syscall
li   $v0,4
la   $a0,msg5
	syscall



li   $v0,4
la   $a0,msg2
	syscall
li   $v0,3
ldc1 $f12,0($t1)
	syscall
li   $v0,4
	la   $a0,msg5
	syscall



li   $v0,4
la   $a0,msg3
	syscall
li   $v0,3
ldc1 $f12,0($t2)
	syscall
li   $v0,4
	la   $a0,msg5
	syscall


li   $v0,4
la   $a0,msg4
	syscall
li   $v0,3
ldc1 $f12,0($t3)
	syscall
li   $v0,4
	la   $a0,msg5
	syscall






END:
li  $v0,10
syscall