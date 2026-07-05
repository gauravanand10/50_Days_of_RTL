# Day 16 - Operators in Verilog

## Objective

Learn the different types of operators available in Verilog and understand how they are used to perform arithmetic, logical, relational, equality, reduction, shift, concatenation, and conditional operations while designing digital circuits.

## Design

### Operator Demonstration

Inputs:

- Input A (`a`)
- Input B (`b`)
- Select (`sel`)

Outputs:

- Result (`result`)

## Flow

1. Learn Arithmetic Operators
2. Learn Relational Operators
3. Learn Equality Operators
4. Learn Logical Operators
5. Learn Bitwise Operators
6. Learn Reduction Operators
7. Learn Shift Operators
8. Learn Conditional Operator
9. Simulate and Verify Results

## Learnings

- Arithmetic Operators (`+`, `-`, `*`, `/`, `%`)
- Relational Operators (`>`, `<`, `>=`, `<=`)
- Equality Operators (`==`, `!=`, `===`, `!==`)
- Logical Operators (`&&`, `||`, `!`)
- Bitwise Operators (`&`, `|`, `^`, `~`)
- Reduction Operators (`&`, `|`, `^`, `~&`, `~|`, `~^`)
- Shift Operators (`<<`, `>>`, `<<<`, `>>>`)
- Conditional (Ternary) Operator (`?:`)
- Operator Precedence

## Key Observation

During simulation:

- Arithmetic operators perform mathematical calculations.
- Relational operators compare values and produce a Boolean result.
- Equality operators compare operands for equality or inequality.
- Logical operators evaluate logical expressions.
- Bitwise operators operate on individual bits.
- Reduction operators combine all bits of a vector into a single-bit result.
- Shift operators move data left or right.
- The conditional operator selects one of two values based on a condition.

## Assignment

Design a **4-bit Arithmetic Logic Unit (ALU)** using Verilog. The ALU should perform multiple arithmetic and logical operations based on a **3-bit select (`sel`)** signal. Use Verilog operators to implement the required operations and verify the design using a suitable testbench.

## Assignment Design

### 4-Bit ALU

Inputs:

- 4-Bit Input A (`a[3:0]`)
- 4-Bit Input B (`b[3:0]`)
- 3-Bit Select (`sel[2:0]`)

Output:

- 5-Bit Result (`result[4:0]`)

## Assignment Flow

1. Create ALU Module
2. Declare Inputs and Output
3. Implement Arithmetic Operations
4. Implement Logical Operations
5. Implement Shift Operations
6. Use Select Signal to Choose Operation
7. Create Testbench
8. Apply Different Input Combinations
9. Verify ALU Functionality

## Assignment Learnings

- Arithmetic Operations
- Logical Operations
- Shift Operations
- Bitwise Operations
- Conditional Selection
- Combinational Logic Design
- RTL Coding
- Testbench Development
- Waveform Analysis

## Key Observation

For every value of the select signal:

- The ALU performs only one operation at a time.
- Arithmetic operations produce mathematical results.
- Logical operations manipulate individual bits.
- Shift operations move data left or right.
- The output changes immediately whenever the inputs or select signal change since the ALU is a combinational circuit.

## Conclusion

Operators are fundamental building blocks in Verilog and are extensively used to describe digital hardware. By implementing a 4-bit ALU, this exercise demonstrates how arithmetic, logical, bitwise, reduction, and shift operators work together to perform various operations. Understanding Verilog operators is essential for designing efficient combinational and sequential digital circuits.
