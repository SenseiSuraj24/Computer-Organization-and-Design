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

## Lab 2

The files for Lab 2 are located in the `LAB2/` directory, accompanied by the lab manual (`Lab 2.pdf`). This lab focuses on array traversal, pointer arithmetic, and accumulation across various data bit-widths (32-bit words, 16-bit halfwords, and 8-bit bytes) in RISC-V (RV32), as well as multi-variable arithmetic expression evaluation.

### 1. Addition of N 32-bit Numbers (`code_1.s`)
- **Functionality**: Accumulates an array of $N = 5$ 32-bit integers defined as `.word` in memory.
- **RISC-V Assembly**: Demonstrates base address loading with `la`, 32-bit memory access with `lw`, word alignment stepping with `addi x1, x1, 4`, loop control with `bne`, and storing the final sum to memory using `sw`.

### 2. Addition of N 16-bit Numbers (`code_2.s`)
- **Functionality**: Accumulates an array of $N = 5$ 16-bit integers defined as `.half` in memory.
- **RISC-V Assembly**: Demonstrates loading unsigned 16-bit halfwords with zero-extension using `lhu`, pointer stepping by 2 bytes with `addi x1, x1, 2`, loop branching, and storing the halfword result back to memory using `sh`.

### 3. Addition of N 8-bit Numbers (`code_3.s`)
- **Functionality**: Accumulates an array of $N = 5$ 8-bit integers.
- **RISC-V Assembly**: Demonstrates loading unsigned byte values with zero-extension using `lbu`, byte stepping with `addi x1, x1, 1`, decrementing loop counter, and storing the byte sum into memory with `sb`.

### 4. Arithmetic Expression Evaluation (`code_4.s`)
- **Functionality**: Evaluates the arithmetic expression:
  $$X = (Y + M) - (L - D) + (Z + C) - D$$
  where operands $Y, M, L, D, Z, C$ are loaded from consecutive memory words.
- **RISC-V Assembly**: Demonstrates sequential memory reads with immediate offsets (`lw`), register-level intermediate evaluations using `add` and `sub`, and storing the computed output $X$ back to memory using `sw`.

