#Write and Implement X = (Y+M) - (L-D) + (Z+C) - D
.data
num: .word 2,3,4,1,2,5
.text
la x1,num
lw x2, 0(x1)
lw x3, 4(x1)
lw x4, 8(x1)
lw x5, 12(x1)
lw x6, 16(x1)
lw x7, 20(x1)
add x8, x2, x3
sub x9, x4, x5
add x10, x6, x7
sub x11, x8, x9
add x12, x11, x10
sub x13, x12, x5
sw x13, 32(x1)