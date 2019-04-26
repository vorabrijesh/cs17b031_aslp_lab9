.data
# ARRAY A DECLARATION
arr1: .float 1.111, 2.111, 3.111, 4.111, 5.111, 6.111, 7.111, 8.111, 9.111


# ARRAY B DECLARATION

arr2: .float 1.111, 2.111, 3.111, 4.111, 5.111, 6.111, 7.111, 8.111, 9.111
 

# ARRAY C(C = A + B ) DECLARATION
arr3: .float 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000
msg1: .asciiz "  "
msg2: .asciiz "\n"

.text


main:
la    $t0,arr1
la    $t1,arr2
la    $t2,arr3
# i  kaa value 0 se 3 tak
li    $t3,-1
li    $t4,3
li    $t8,3  # COLUMN SIZE
li    $t9,4  # datasize




MATRIXADDITION:

FOR_LOOP1:
addi  $t3,$t3,1  # i = i + 1

# j  kaa  value 0 se 3 tak
li    $t5,0
li    $t6,3   #COLUMN SIZE
beq   $t3,$t4,PRINT

FOR_LOOP2:

beq     $t5,$t6,FOR_LOOP1  # agar j kaa value 3 ho jaye to
mul     $t7,$t3,$t8    # $t7 me (row_index * column_size)
add     $s0,$t7,$t5    # $s0 me (row_index * column_size  + column_index)
mul     $s1,$s0,$t9    # $s1 me (row_index * column_size  + column_index)*datasize
add     $s2,$t0,$s1    # $s2 me  address of arr1[i][j]
add     $s3,$t1,$s1    # $s3 me  address of arr2[i][j]
add     $s4,$t2,$s1    # $s4 me  address of arr3[i][j]
lwc1    $f4,0($s2)  # $f4 me value of arr1[i][j]
lwc1    $f5,0($s3)  # $f5 me value of arr2[i][j]
add.s   $f6,$f4,$f5    # $f6 = arr1[i][j] + arr2[i][j]
swc1    $f6,0($s4)
addi  $t5,$t5,1   # j = j + 1
j FOR_LOOP2



PRINT:
    li $t9,9
    li $t6,0
    j  PRINT1

	
	PRINT1: 
	beq  	$t9,$0,END
	addi 	$t9,$t9,-1	
	li   	$v0,2
	lwc1   	$f12,arr3($t6)
	syscall
	li   $v0,4
	la   $a0,msg2
	syscall

	addi 	$t6,$t6,4
	j    	PRINT1



END:
    li  $v0,10
    syscall







  
