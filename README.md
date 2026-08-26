# Computer Organization and Design Labs

This repository contains the lab exercises and code for the Computer Organization and Design course.

## Lab 1

The code for Lab 1 is located in `LAB1/code.c`. Despite the `.c` extension, the file primarily contains RISC-V assembly programs demonstrating fundamental concepts like function calls, loops, memory access, and recursion. It is divided into three main examples:

### 1. Function Calls and Stack Management (`diffofsums`)
The first section demonstrates how to translate a simple C function into RISC-V assembly.
- **C Code equivalent**: A function `diffofsums(f, g, h, i)` that calculates `(f + g) - (h + i)`.
- **RISC-V Assembly**: Shows how arguments are passed via registers (`x10` to `x13`), how the `jal` instruction is used for function calls, and importantly, how to use the stack pointer (`sp`) to save and restore temporary registers (`x5`, `x6`, `x20`) across function boundaries.

### 2. Array Iteration and Searching (Linear Search)
The second section implements a linear search on an array of integers.
- **Functionality**: It iterates over an array of 9 elements (`11, 22, ..., 99`) searching for a specific target value (`88`).
- **RISC-V Assembly**: Demonstrates loading addresses with `la`, iterating with conditional branches (`bne`), accessing memory with offsets (`lw`), and using loops. If the target is found, it loads a success flag (`0xFF`); otherwise, a failure flag (`0x00`).

### 3. Recursive Functions (`fact`)
The final section implements a recursive factorial calculation.
- **Functionality**: Calculates the factorial of a given number `n` (in this case, 5) and stores the result in memory.
- **RISC-V Assembly**: Provides a detailed look at how the stack is used to maintain state during recursion. For every recursive call, the return address (`x1`) and current argument (`x10`) are pushed onto the stack. After the base case is reached, the stack is popped to retrieve the values and multiply them together as the recursion unwinds.
