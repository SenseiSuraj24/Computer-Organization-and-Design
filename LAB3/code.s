#Write RISC-V code to check whether given number is a 2 out 5 code. If the number is code then store ‘FF’ in next data location, else store ‘00’ in the next location
.data
cod: .word 0x05        # input code (0000 0101₂)
res: .byte 0           # result storage

.text
la x10, cod            # x10 = address of cod
lw x2, 0(x10)          # x2 = value of cod → 0x00000005
li x7, 5               # counter = 5 bits to check
li x4, 1               # bit mask = 0b00001 (LSB)
li x8, 2               # expected number of '1' bits
li x1, 0               # x1 = count of '1' bits found

andi x3, x2, 0xffffffe0# clear all bits except lower 5 bits
bne  x3, x0, notacode  # if higher bits are set, it's invalid

back:
    and x5, x2, x4     # isolate current bit (x4 mask)
    beq x5, x0, next   # if bit=0 → skip increment
    addi x1, x1, 1     # otherwise, increment '1' count

next:
    slli x4, x4, 1     # shift mask left → next bit
    addi x7, x7, -1    # decrement bit counter
    bne x7, x0, back   # loop for all 5 bits

bne x1, x8, notacode   # if number of 1s != 2 → invalid
addi x11, x0, 0xff     # valid code → result = 0xFF
sb x11, res(x0)        # store result
j exit

notacode:
    addi x11, x0, 0    # invalid → result = 0
    sb x11, res(x0)    # store result

exit:
    nop
