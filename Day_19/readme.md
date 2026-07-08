# Day 19 - Tasks and Functions

## Objective

Learn the concepts of **Tasks** and **Functions** in Verilog and understand their differences. Explore how reusable procedural blocks simplify RTL design, improve code readability, and reduce code duplication while implementing common hardware operations.

## Design

### Function Example

Input:

- 8-Bit Data Input (`data[7:0]`)

Output:

- Parity Bit (`parity_bit`)

Function:

- Even Parity Generator

### Task Example

Inputs:

- Address (`addr`)
- Write Data (`data_in`)
- Write Enable (`write_en`)
- Read Enable (`read_en`)

Outputs:

- Read Data (`data_out`)

Tasks:

- Memory Write Task
- Memory Read Task

## Flow

1. Learn Functions
2. Understand Function Declaration
3. Implement an Even Parity Function
4. Learn Tasks
5. Understand Task Declaration
6. Implement Memory Read and Write Tasks
7. Create Testbenches
8. Simulate the Designs
9. Compare Tasks and Functions

## Learnings

- Functions
- Tasks
- Reusable Code
- Function Declaration
- Task Declaration
- Input Arguments
- Output Arguments
- Timing Control
- Synthesizable Tasks

## Key Observation

During simulation:

- Functions accept only input arguments and return a single value.
- Functions execute immediately and do not support timing controls.
- Tasks can accept input, output, and inout arguments.
- Tasks can return multiple values using output arguments.
- Tasks are commonly used for repetitive operations such as memory transactions.
- Reusable Tasks and Functions reduce code duplication and improve RTL readability.

## Assignment

Develop a **synthesizable task** to generate **write** and **read** transactions for memory operations. The design should include reusable tasks for writing data into memory and reading data back from memory. Write a suitable testbench to verify correct write and read functionality.

## Assignment Design

### Memory Read/Write System

Inputs:

- Clock (`clk`)
- Reset (`rst`)
- Write Enable (`write_en`)
- Read Enable (`read_en`)
- Address (`addr[3:0]`)
- Write Data (`data_in[7:0]`)

Output:

- Read Data (`data_out[7:0]`)

Internal Block:

- 16 × 8 Memory Array

Tasks:

- Write Memory Task
- Read Memory Task

## Assignment Flow

1. Design Memory Module
2. Declare Memory Array
3. Create Write Task
4. Create Read Task
5. Implement Sequential Control Logic
6. Create Testbench
7. Perform Write Transactions
8. Perform Read Transactions
9. Verify Memory Contents

## Assignment Learnings

- Task-Based RTL Design
- Memory Read Operation
- Memory Write Operation
- Synthesizable Tasks
- Reusable Procedural Blocks
- Sequential Logic
- Testbench Development
- Waveform Analysis

## Key Observation

For every memory transaction:

- The write task stores data at the specified memory location.
- The read task retrieves data from the specified memory location.
- Tasks simplify repetitive memory operations.
- Synthesizable tasks improve RTL readability without affecting synthesized hardware.
- Memory contents remain unchanged until another write operation occurs.

## Conclusion

Tasks and Functions provide an efficient way to write reusable Verilog code. Functions are best suited for combinational calculations that return a single value without timing control, while Tasks are ideal for procedural operations that may involve multiple outputs and reusable sequences of statements. By implementing memory read and write operations using synthesizable tasks, this exercise demonstrates how reusable procedural blocks improve code organization, maintainability, and overall RTL design quality.
