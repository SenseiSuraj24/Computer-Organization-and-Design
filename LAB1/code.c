#include <stdio.h>
int main(){
    int y;
    ...
    y = diffofsums(2,3,4,5);
    ...
}

int diffofsums(int f, int g, int h, int i){
    int result;
    result = (f+g)-(h+i);
    return result;
}



main :
    addi x10,x0,2
    addi x11,x0,3
    addi x12,x0,4
    addi x13,x0,5
    jal x1,diffofsums
    add x18,x10,x0

diffofsums :
    addi sp,sp,-12  //make space on stack for 3 registers
    sw x5,8(sp)
    sw x6,4(sp)  //x5 and x6 are temporaries
    sw x20,0(sp)
    add x5,x10,x11
    add x6,x12,x13
    sub x20,x5,x6
    addi x10,x20,0  //return value in argument register
    lw x20,0(sp)   // returning back initial values of registers
    lw x6,4(sp) 
    lw x5,8(sp)
    addi sp,sp,12  //deallocate stack space
    jalr x0,0(x1)  //return to caller



.data
ary: .word 11,22,33,44,55,66,77,88,99
res1: .string 0xFF
res2: .string 0x00

.text
la x4,ary
la x5,res1
la x6,res2
li x12,0
li x5,9 
li x10,88
back: lw x11,0(x4)
      jal x1,check
      addi x4,x4,4
      addi x5,x5,-1
      bne x5,x0,back
check: beq x11,x10,found
       lw x12,0(x6)
       jalr x0,0(x1)
found: lw x12,0(x5)
       jalr x0,0(x1)



.data
base:   .word 0x12000000   # store the base address (0x12000000)
n:      .word 5            # factorial input (5)
result: .word 0            # space for storing factorial result

.text
.globl main
main:
    la   x8, base           # x8 = &base
    lw   x9, 0(x8)          # x9 = 0x12000000 (base address)
    lw   x10, 4(x8)         # x10 = n (5)
    jal  x1, fact           # call factorial

    sw   x10, 8(x8)         # store factorial result at result
    j exit

fact:
    addi sp, sp, -8
    sw   x1, 4(sp)
    sw   x10, 0(sp)

    addi x5, x10, -1
    bge  x5, x0, L1

    addi x10, x0, 1
    addi sp, sp, 8
    jr   x1

L1: addi x10, x10, -1
    jal  x1, fact

    addi x6, x10, 0
    lw   x10, 0(sp)
    lw   x1, 4(sp)
    addi sp, sp, 8
    mul  x10, x10, x6
    jr   x1

exit: nop
