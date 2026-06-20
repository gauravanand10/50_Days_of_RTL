# Day 2 - Text Based Design Flow

## Objective

Understand the complete FPGA design flow:

RTL
→ Behavioral Simulation
→ Synthesis
→ Post-Synthesis Simulation
→ Implementation
→ Post-Implementation Simulation
→ Bitstream Generation

---

## Design

8:1 Registered Multiplexer

Inputs:
- a,b,c,d,e,f,g,h (8-bit)

Select:
- sel (3-bit)

Output:
- dout (8-bit)

## Flow

1. Behavioral Simulation
2. Synthesis
3. Post-Synthesis Simulation
4. Implementation
5. Post-Implementation Simulation

## Learnings

- FPGA Design Flow
- Difference between RTL and Testbench
- Clock Generation using Testbench
- Sequential Logic using `always @(posedge clk)`
- Non-Blocking Assignment (`<=`)
- Case Statements
- Constraint Files (.xdc)
- Synthesis and Implementation Flow


