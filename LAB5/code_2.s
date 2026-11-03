#Write an ALP to identify largest and smallest number in given array and store the elements in consecutive memory location after the array elements
.data
arr:    .word 25, 56, 0, 10, 20      # Array of 5 elements
size:   .word 5                      # Number of elements in the array
result: .word 0, 0                   # Memory for smallest and largest (will be stored here)

.text
.globl main
main:
    la x5, arr          # x5 = base address of array
    lw x6, size         # x6 = number of elements (n)
    lw x7, 0(x5)        # x7 = current smallest (initialize with arr[0])
    lw x8, 0(x5)        # x8 = current largest  (initialize with arr[0])
    li x9, 1            # x9 = loop index i = 1

loop:
    bge x9, x6, done    # if i >= n, end loop

    slli x10, x9, 2     # offset = i * 4
    add x11, x5, x10    # x11 = &arr[i]
    lw x12, 0(x11)      # x12 = arr[i]

    # Compare for smallest
    blt x12, x7, update_min
    j check_max

update_min:
    mv x7, x12          # smallest = arr[i]

check_max:
    # Compare for largest
    bgt x12, x8, update_max
    j next

update_max:
    mv x8, x12          # largest = arr[i]

next:
    addi x9, x9, 1      # i++
    j loop

done:
    # Store smallest and largest after array
    la x13, result       # x13 = address of result
    sw x7, 0(x13)        # store smallest at result[0]
    sw x8, 4(x13)        # store largest at result[1]
    nop                  # end of program
