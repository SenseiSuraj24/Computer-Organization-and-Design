#Write an ALP to arrange the given numbers in an array in ascending and descending order using Bubble sort
.data
arr:    .word 25, 56, 0, 10, 20      # Array elements
n:      .word 5                      # Number of elements in array

.text
.globl main
main:
    ##########################################################
    # Step 1: Initialization
    ##########################################################
    la x5, arr          # x5 = base address of array
    lw x7, n            # x7 = number of elements (n)
    li x6, 0            # x6 = outer loop index (i = 0)

##############################################################
# Outer Loop: Runs (n - 1) times
##############################################################
outer_loop:
    bge x6, x7, done    # if i >= n → sorting complete → exit

    sub x22, x7, x6     # x22 = n - i
    addi x15, x22, -1   # x15 = n - i - 1 → limit for inner loop
    li x29, 0           # x29 = inner loop index (j = 0)

##############################################################
# Inner Loop: Compare adjacent elements
##############################################################
inner_loop:
    bge x29, x15, next_outer   # if j >= n - i - 1 → end inner loop

    # --- Calculate address of arr[j] ---
    slli x31, x29, 2           # offset = j * 4 (word size)
    add  x3, x5, x31           # x3 = &arr[j]
    lw   x4, 0(x3)             # x4 = arr[j]

    # --- Calculate address of arr[j+1] ---
    addi x30, x29, 1           # x30 = j + 1
    slli x30, x30, 2           # offset = (j+1) * 4
    add  x10, x5, x30          # x10 = &arr[j+1]
    lw   x11, 0(x10)           # x11 = arr[j+1]

    ##########################################################
    # Step 2: Compare arr[j] and arr[j+1]
    ##########################################################
    bge x11, x4, no_swap       # if arr[j+1] >= arr[j] → no swap

    ##########################################################
    # Step 3: Swap arr[j] and arr[j+1]
    ##########################################################
    mv x16, x11                # x16 = temp = arr[j+1]
    sw x4, 0(x10)              # arr[j+1] = arr[j]
    sw x16, 0(x3)              # arr[j] = temp

no_swap:
    ##########################################################
    # Step 4: Increment j and repeat
    ##########################################################
    addi x29, x29, 1           # j = j + 1
    j inner_loop               # repeat inner loop

##############################################################
# Outer loop increment
##############################################################
next_outer:
    addi x6, x6, 1             # i = i + 1
    j outer_loop               # repeat outer loop

##############################################################
# End of sorting
##############################################################
done:
    nop                        # end of program (stop execution)
