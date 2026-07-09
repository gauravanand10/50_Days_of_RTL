# Day 20 - Asynchronous Reset

## Objective

Learn the concept of an **Asynchronous Reset** in Verilog and understand how a flip-flop can be reset immediately without waiting for a clock edge. Explore why asynchronous resets are commonly used during FPGA initialization and how they differ from synchronous resets.

## Design

### Asynchronous Reset D Flip-Flop

Inputs:

- Clock (`clk`)
- Reset (`reset`)
- Data Input (`d[7:0]`)

Output:

- Data Output (`q[7:0]`)

Functionality:

- Reset clears the output immediately whenever `reset` becomes HIGH.
- When `reset` is LOW, the D Flip-Flop captures the input data on the rising edge of the clock.

## Flow

1. Learn Asynchronous Reset
2. Understand the Sensitivity List
3. Design an Asynchronous Reset D Flip-Flop
4. Create the Testbench
5. Apply Reset Independently of the Clock
6. Observe Immediate Reset Behavior
7. Apply Data Inputs
8. Verify Data Capture on Clock Edge
9. Analyze the Waveform

## Learnings

- Asynchronous Reset
- D Flip-Flop
- Sensitivity List
- Sequential Logic
- Non-Blocking Assignment (`<=`)
- Immediate Reset Operation
- Testbench Development
- Waveform Analysis

## Key Observation

During simulation:

- The output resets immediately when `reset` is asserted.
- The flip-flop does **not** wait for the next rising edge of the clock during reset.
- When `reset` is deasserted, the flip-flop resumes normal operation.
- Input data is captured only on the rising edge of the clock.
- The sensitivity list includes both the clock and reset signals:
  ```verilog
  always @(posedge clk or posedge reset)
  ```
- Asserting `reset` forces the output to a known state regardless of the clock.

## Assignment

Design a simple **D Flip-Flop with an Asynchronous Reset**, where the input data is generated internally (without using an external input port). The flip-flop should store data on every rising edge of the clock and immediately reset the output to zero whenever the asynchronous reset is asserted. Write a suitable testbench to verify the functionality.

## Assignment Design

### Asynchronous Reset D Flip-Flop

Inputs:

- Clock (`clk`)
- Reset (`reset`)

Output:

- Data Output (`q`)

Internal Block:

- Internally Generated Data Signal (`d`)

Functionality:

- Immediate reset using asynchronous reset.
- Data captured on every positive edge of the clock after reset is released.

## Assignment Flow

1. Design the D Flip-Flop
2. Generate Internal Data
3. Implement Asynchronous Reset
4. Create Testbench
5. Apply Reset
6. Release Reset
7. Observe Data Capture
8. Assert Reset Midway Through Simulation
9. Verify Immediate Reset

## Assignment Learnings

- Asynchronous Reset Design
- Internal Signal Generation
- Sequential RTL Design
- D Flip-Flop Operation
- Immediate Reset Response
- Testbench Development
- Waveform Verification
- Reset Behavior Analysis

## Key Observation

For every simulation cycle:

- Reset immediately clears the flip-flop output.
- The reset action is independent of the clock.
- Data is stored only on the rising edge of the clock.
- Once reset is released, normal D Flip-Flop operation resumes.
- The output remains stable between clock edges.

## Conclusion

Asynchronous Reset allows a flip-flop to return to a known state immediately without waiting for a clock edge. This behavior makes it particularly useful during FPGA power-up and system initialization, where the clock may not yet be stable. Understanding asynchronous reset is essential for designing reliable sequential circuits and forms the foundation for more advanced reset strategies used in digital systems.
