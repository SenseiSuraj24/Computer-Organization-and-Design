#Write an ALP to add ‘N’ 16 bit
.data
num : .half 0xabcd, 0x1122, 0xaabb, 0x1234, 0xaa22
.text
la x1, num        # x1 = address of num[0]
li x4, 5          # loop counter = 5
addi x3, x0, 0    # sum = 0

rpt:
    lhu x2, 0(x1)   # load current element
    add x3, x3, x2 # sum += element
    addi x1, x1, 2 # move to next element
    addi x4, x4, -1# decrement counter
    bne x4, x0, rpt# loop until x4 == 0
    sh x3, 0(x1)   # store sum after loop
    nop