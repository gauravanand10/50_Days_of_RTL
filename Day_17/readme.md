# Day 17 - If-Else Statement

## Objective

Learn the use of the `if`, `else if`, and `else` statements in Verilog to implement conditional logic. Understand how decision-making is performed in combinational and sequential circuits based on one or more conditions.

## Design

### If-Else Based Comparator

Inputs:

- Input A (`a`)
- Input B (`b`)

Outputs:

- Greater (`a_gt_b`)
- Equal (`a_eq_b`)
- Less (`a_lt_b`)

## Flow

1. Learn the `if` Statement
2. Learn the `if-else` Statement
3. Learn the `if-else if-else` Statement
4. Understand Conditional Execution
5. Implement a Comparator Using If-Else
6. Create Testbench
7. Simulate the Design
8. Verify Output Conditions
9. Observe Waveforms

## Learnings

- `if` Statement
- `if-else` Statement
- `if-else if-else` Statement
- Conditional Logic
- Decision Making
- Combinational Logic
- Priority Logic
- RTL Coding
- Simulation Analysis

## Key Observation

During simulation:

- The `if` statement executes only when the specified condition is true.
- The `else` statement executes when the condition is false.
- The `if-else if-else` ladder checks conditions in sequence until one condition is satisfied.
- Conditions are evaluated in priority order from top to bottom.
- If-Else statements are commonly used to implement priority logic.

## Assignment

Design a **4-bit Priority Encoder** using Verilog and `if-else` statements. The encoder should examine a 4-bit input and generate the binary position of the highest-priority asserted input. If multiple inputs are HIGH simultaneously, the highest-priority input should be selected. Write a suitable testbench to verify all possible input combinations.

## Assignment Design

### 4-Bit Priority Encoder

Inputs:

- 4-Bit Input (`in[3:0]`)

Outputs:

- 2-Bit Encoded Output (`out[1:0]`)
- Valid Output (`valid`)

## Assignment Flow

1. Create Priority Encoder Module
2. Declare Inputs and Outputs
3. Implement Priority Logic Using If-Else
4. Generate Encoded Output
5. Generate Valid Signal
6. Create Testbench
7. Apply Different Input Patterns
8. Simulate the Design
9. Verify Priority Operation

## Assignment Learnings

- Priority Encoding
- If-Else Decision Making
- Priority Logic
- Conditional Statements
- Combinational RTL Design
- Testbench Development
- Waveform Analysis
- RTL Coding Style

## Key Observation

For every input combination:

- The highest-priority HIGH input is selected.
- Lower-priority inputs are ignored if a higher-priority input is asserted.
- The valid output indicates whether at least one input is HIGH.
- The encoder produces the correct binary output according to the highest-priority input.
- If-Else statements naturally implement priority logic because conditions are evaluated sequentially.

## Conclusion

The If-Else statement is one of the most fundamental decision-making constructs in Verilog. It is widely used for implementing priority-based logic and conditional execution in digital circuits. By designing a Priority Encoder, this exercise demonstrates how conditional statements evaluate inputs sequentially to determine the highest-priority condition, making If-Else an essential construct for RTL design.
