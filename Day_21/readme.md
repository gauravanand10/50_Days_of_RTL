# Day 21 - Synchronous Reset

## Objective

Learn the concept of a **Synchronous Reset** in Verilog and understand how a flip-flop resets only on the rising edge of the clock. Explore the difference between synchronous and asynchronous reset, and observe how synchronous reset provides controlled state transitions in sequential logic.

## Design

### Synchronous Reset D Flip-Flop

Inputs:

- Clock (`clk`)
- Reset (`reset`)
- Data Input (`d[7:0]`)

Output:

- Data Output (`q[7:0]`)

Functionality:

- When `reset` is HIGH, the output resets to zero only on the next rising edge of the clock.
- When `reset` is LOW, the D Flip-Flop captures the input data on every rising edge of the clock.

## Flow

1. Learn Synchronous Reset
2. Understand Clock-Based Reset Operation
3. Design a Synchronous Reset D Flip-Flop
4. Create the Testbench
5. Apply Reset
6. Observe Reset on Clock Edge
7. Apply Data Inputs
8. Verify Data Capture
9. Analyze the Waveform

## Learnings

- Synchronous Reset
- D Flip-Flop
- Clocked Sequential Logic
- Non-Blocking Assignment (`<=`)
- Reset Synchronization
- Testbench Development
- Waveform Analysis
- Reset Timing

## Key Observation

During simulation:

- The output resets only on the rising edge of the clock.
- Even if `reset` becomes HIGH between clock edges, the output does not change immediately.
- The flip-flop waits for the next positive clock edge before resetting.
- Once `reset` is deasserted, normal data capture resumes on subsequent clock edges.
- The sensitivity list contains only the clock:
  ```verilog
  always @(posedge clk)
  ```
- Reset is checked inside the clocked always block.

## Assignment

Design a simple **D Flip-Flop with a Synchronous Reset**, where the input data is generated internally (without using an external input port). The flip-flop should reset only on the rising edge of the clock whenever the reset signal is asserted. Write a suitable testbench to verify the functionality.

## Assignment Design

### Synchronous Reset D Flip-Flop

Inputs:

- Clock (`clk`)
- Reset (`reset`)

Output:

- Data Output (`q`)

Internal Block:

- Internally Generated Data Signal (`d`)

Functionality:

- Reset occurs only on the positive edge of the clock.
- Data is captured on every positive clock edge when reset is LOW.

## Assignment Flow

1. Design the D Flip-Flop
2. Generate Internal Data
3. Implement Synchronous Reset
4. Create Testbench
5. Apply Reset
6. Observe Reset on Clock Edge
7. Release Reset
8. Verify Data Capture
9. Analyze the Waveform

## Assignment Learnings

- Synchronous Reset Design
- Clocked Sequential Logic
- Internal Signal Generation
- D Flip-Flop Operation
- Reset Synchronization
- Testbench Development
- Waveform Verification
- Timing Analysis

## Key Observation

For every simulation cycle:

- Reset affects the output only on the next rising edge of the clock.
- No immediate output change occurs when reset is asserted.
- Data is sampled only on positive clock edges.
- The output remains stable between clock edges.
- Synchronous reset ensures all state changes occur in synchronization with the system clock.

## Comparison: Asynchronous Reset vs Synchronous Reset

| Feature | Asynchronous Reset | Synchronous Reset |
|---------|--------------------|-------------------|
| Reset Action | Immediate | On the next rising clock edge |
| Waits for Clock | ❌ No | ✅ Yes |
| Sensitivity List | `posedge clk or posedge reset` | `posedge clk` |
| Response Time | Faster | Clock dependent |
| Hardware Control | Independent of clock | Controlled by clock |
| FPGA Initialization | Commonly used | Less common |
| Timing Predictability | Lower | Higher |
| Typical Use | Power-up initialization | Normal system operation |

## Conclusion

Synchronous Reset ensures that all state changes occur only on the active clock edge, making the design easier to analyze and less susceptible to asynchronous timing issues. Although it does not reset the circuit immediately, it provides predictable behavior that integrates well with synchronous digital systems. Understanding both synchronous and asynchronous reset techniques is essential for designing robust and reliable sequential logic.
```
