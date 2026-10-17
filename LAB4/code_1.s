#To check register a0 is divisible by a given number (19 is divisible by 9)
.data
A: .word 19              # variable A initialized to 19

.text
la x3, A                 # x3 ← address of A
lw x5, 0(x3)             # x5 ← value at address A → x5 = 19
addi a0, x0, 1           # a0 ← 1   (used as flag / result)

loop:
    blt x5, a0, exit     # if x5 < 1 → jump to exit
    addi x5, x5, -9      # else x5 = x5 - 9
    beq x0, x0, loop     # unconditional jump → repeat loop

exit:
    beq x5, x0, exit1    # if x5 == 0 → go to exit1
    addi a0, x0, 0       # else a0 = 0 (set flag = 0)

exit1:
    nop                  # end of program