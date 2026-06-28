# Day 1 - Half Adder (Introduction to Verilog)

## Objective

Learn the fundamentals of Verilog HDL by designing, simulating, and verifying a Half Adder.

## Design

Half Adder with:

- Sum Output
- Carry Output

## Flow

1. Create Half Adder RTL
2. Define Inputs and Outputs
3. Implement Combinational Logic using `assign`
4. Create a Testbench
5. Apply Input Combinations
6. Run Behavioral Simulation
7. Verify Outputs using the Truth Table

## Learnings

- Verilog Module Structure
- Inputs and Outputs
- Continuous Assignment (`assign`)
- XOR (`^`) Operator
- AND (`&`) Operator
- Writing a Basic Testbench
- Running Behavioral Simulation
- Understanding Combinational Logic
- Verifying RTL Functionality

## Key Observation

The Half Adder performs the addition of two 1-bit inputs:

- Sum is generated using the XOR operation
- Carry is generated using the AND operation
- Simulation results match the expected truth table

## RTL

### Equations

Sum = A XOR B

Carry = A AND B

## Conclusion

A Half Adder is one of the simplest combinational circuits and serves as an excellent introduction to Verilog HDL. This exercise demonstrates module creation, combinational logic implementation, testbench development, and functional verification through simulation.
