# Day 18 - Case Statement

## Objective

Learn the `case` statement in Verilog and understand how it is used to implement multi-way decision making. Explore how `case` simplifies complex conditional logic compared to long `if-else` statements and how it is commonly used in multiplexers, decoders, finite state machines (FSMs), and Arithmetic Logic Units (ALUs).

## Design

### Case Statement Based FSM

Inputs:

- Clock (`clk`)
- Reset (`reset`)
- Current State (`state[1:0]`)

Output:

- Next State (`next_state[1:0]`)

## Flow

1. Learn the `case` Statement
2. Understand Multi-Way Decision Making
3. Learn the Role of the `default` Case
4. Implement a Simple FSM Using `case`
5. Create Testbench
6. Simulate the Design
7. Verify State Transitions
8. Observe Waveforms
9. Compare `case` with `if-else`

## Learnings

- `case` Statement
- Multi-Way Selection
- `default` Case
- State Machine Basics
- State Encoding
- Decision Logic
- RTL Coding Style
- Combinational Logic
- Hardware Synthesis

## Key Observation

During simulation:

- The `case` statement evaluates the input expression once.
- Only the matching case item is executed.
- The `default` case handles invalid or unexpected values.
- The `case` statement improves readability when selecting among multiple conditions.
- Case statements are widely used for implementing multiplexers, decoders, ALUs, and FSMs.

## Assignment

Design a **4-bit Arithmetic Logic Unit (ALU)** using Verilog and the `case` statement. The ALU should perform different arithmetic and logical operations based on a **3-bit select (`sel`)** signal. Write a suitable testbench to verify each operation.

## Assignment Design

### 4-Bit ALU

Inputs:

- 4-Bit Input A (`a[3:0]`)
- 4-Bit Input B (`b[3:0]`)
- 3-Bit Select (`sel[2:0]`)

Output:

- 5-Bit Result (`result[4:0]`)

Operations:

- Addition
- Subtraction
- AND
- OR
- XOR
- NOT
- Left Shift
- Right Shift

## Assignment Flow

1. Create the ALU Module
2. Declare Inputs and Outputs
3. Use an `always @(*)` Block
4. Implement Operation Selection Using `case`
5. Add a `default` Case
6. Create Testbench
7. Apply Different Select Values
8. Simulate the Design
9. Verify ALU Operations

## Assignment Learnings

- Case Statement
- Multi-Way Decision Logic
- ALU Design
- Arithmetic Operations
- Logical Operations
- Shift Operations
- Combinational RTL Design
- Testbench Development
- Waveform Analysis

## Key Observation

For every value of the select signal:

- Only one ALU operation is performed at a time.
- The `case` statement selects the required operation based on the select input.
- Arithmetic and logical operations produce the expected result.
- The output changes immediately whenever the inputs or select signal change.
- The `default` case ensures predictable behavior for invalid select values.

## Conclusion

The `case` statement is an efficient and readable way to implement multi-way decision logic in Verilog. It is widely used in RTL design for multiplexers, decoders, finite state machines, and ALUs. By implementing a 4-bit ALU using a `case` statement, this exercise demonstrates how multiple hardware operations can be selected using a single control signal while maintaining clean and synthesizable RTL code.
