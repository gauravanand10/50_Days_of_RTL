# Day 2 - Text Based Design Flow

## Objective

Understand the complete FPGA design flow by designing, simulating, synthesizing, implementing, and generating a bitstream for an RTL design.

## Design

8:1 Registered Multiplexer

### Inputs

- a (8-bit)
- b (8-bit)
- c (8-bit)
- d (8-bit)
- e (8-bit)
- f (8-bit)
- g (8-bit)
- h (8-bit)

### Select

- sel (3-bit)

### Output

- dout (8-bit)

## Flow

1. Create RTL Design
2. Develop Testbench
3. Run Behavioral Simulation
4. Perform Synthesis
5. Run Post-Synthesis Simulation
6. Perform Implementation
7. Run Post-Implementation Simulation
8. Generate Bitstream

## Learnings

- FPGA Design Flow
- Difference between RTL and Testbench
- Behavioral Simulation
- Clock Generation using Testbench
- Sequential Logic using `always @(posedge clk)`
- Non-Blocking Assignment (`<=`)
- Case Statements
- Constraint Files (`.xdc`)
- Synthesis Process
- Implementation Process
- Bitstream Generation
- Post-Synthesis and Post-Implementation Verification

## Key Observation

The registered multiplexer updates its output only on the rising edge of the clock:

- The selected input is determined by `sel`
- Output changes occur synchronously with the clock
- Simulation results remain consistent through synthesis and implementation stages
- The same RTL design progresses through multiple stages before deployment on FPGA

## Design Flow

RTL Design

↓  

Behavioral Simulation

↓  

Synthesis

↓  

Post-Synthesis Simulation

↓  

Implementation

↓  

Post-Implementation Simulation

↓  

Bitstream Generation

## Conclusion

This exercise introduced the complete FPGA design workflow using a text-based RTL design approach. It demonstrated how an RTL design moves from simulation to synthesis, implementation, and finally bitstream generation, providing a foundation for developing and deploying FPGA-based digital systems.
