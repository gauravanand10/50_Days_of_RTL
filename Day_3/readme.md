# Day 3 - Graphic Based Design Flow

## Objective

Learn how to create FPGA designs using Vivado Block Design by integrating reusable IP blocks instead of writing the complete design in RTL.

## Design

1-Bit Full Adder using:

- Half Adder #1
- Half Adder #2
- OR Gate

## Flow

1. Create Half Adder RTL
2. Package RTL as Custom IP
3. Create Vivado Block Design
4. Add IP Blocks to the Design
5. Connect Blocks Graphically
6. Validate Design
7. Generate HDL Wrapper
8. Run Behavioral Simulation

## Learnings

- Difference between Text-Based and Graphic-Based Design
- Creating Reusable IP Blocks
- IP Packaging in Vivado
- Using Vivado Block Design
- Graphical Module Integration
- Connecting Modules without RTL Coding
- HDL Wrapper Generation
- Design Validation
- Building a Full Adder using Half Adders
- IP Integration Concepts

## Key Observation

The Full Adder can be constructed by integrating smaller building blocks:

- Two Half Adders generate intermediate Sum and Carry signals
- An OR Gate combines the Carry outputs
- Vivado Block Design enables graphical system integration
- HDL Wrapper automatically generates the top-level HDL required for synthesis and simulation

## Design Hierarchy

Half Adder #1

↓

Half Adder #2

↓

OR Gate

↓

Full Adder

## Conclusion

This exercise introduced the graphic-based FPGA design methodology using Vivado Block Design. By packaging RTL as reusable IP and integrating blocks graphically, complex systems can be developed more efficiently while promoting modularity, reusability, and easier system-level design.
