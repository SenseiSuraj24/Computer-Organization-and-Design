#RISC program to perform for (i=0; i<10; i+=1){c[i] = a[i]*b[i] + c[i-1];}
.data
a: .word 1,2,3,4,5,6,7,8,9,10          # a[0..9]
b: .word 10,9,8,7,6,5,4,3,2,1          # b[0..9]
c_minus_1 : .word 0                    # sentinel so c[-1] = 0 is readable at (c + i*4 - 4)
c: .word 0,0,0,0,0,0,0,0,0,0           # c[0..9] output array

.text
.globl main
main:
    la x8, a                            # x8  = &a[0]
    la x9, b                            # x9  = &b[0]
    la x10, c                           # x10 = &c[0]
    li x11, 0                           # x11 = i (loop index)
    li x12, 10                          # x12 = N (ARRAY LENGTH)  
loop_start:
    bge x11, x12, loop_end              # if i >= N, break

    slli x5, x11, 2                     # x5 = i*4 (byte offset for 32-bit words)
    add x6, x8, x5                      # x6 = &a[i]
    add x7, x9, x5                      # x7 = &b[i]
    add x13, x10, x5                    # x13 = &c[i]

    lw x14, 0(x6)                       # x14 = a[i]
    lw x15, 0(x7)                       # x15 = b[i]
    mul x14, x14, x15                   # x14 = a[i]*b[i]      (requires RISC-V "M" extension)

    lw x15, -4(x13)                     # x15 = c[i-1]         (for i=0 this reads c_minus_1 = 0)
    add x14, x14, x15                   # x14 = a[i]*b[i] + c[i-1]
    sw x14, 0(x13)                      # c[i] = a[i]*b[i] + c[i-1]

    addi x11, x11, 1                    # i++
    j loop_start

loop_end:
    li x17, 10                          # a7 = 10 (ECALL: exit)
    ecall