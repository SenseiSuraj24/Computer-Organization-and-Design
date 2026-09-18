.data
num : .word 0xabcdeeff, 0x11223344, 0xaabbccdd, 0x12345678, 0x11aa22bb
.text
la x1, num        # x1 = address of num[0]
li x4, 5          # loop counter = 5
addi x3, x0, 0    # sum = 0

rpt:
    lw x2, 0(x1)   # load current element
    add x3, x3, x2 # sum += element
    addi x1, x1, 4 # move to next element
    addi x4, x4, -1# decrement counter
    bne x4, x0, rpt# loop until x4 == 0
    sw x3, 0(x1)   # store sum after loop
    nop