# Day 13 - Modeling Styles in Verilog

## Objective

Learn the different Verilog modeling styles used to describe digital circuits. Understand the difference between **Combinational Logic** and **Sequential Logic**, and implement simple examples using both approaches.

## Design

### Combinational Logic

Inputs:

- Input A (`a`)
- Input B (`b`)

Output:

- Output (`y`)

### Sequential Logic (D Flip-Flop)

Inputs:

- Clock (`clk`)
- Reset (`rst`)
- Data Input (`d`)

Output:

- Data Output (`q`)

## Flow

1. Learn Different Verilog Modeling Styles
2. Understand Combinational Logic
3. Implement Combinational Logic
4. Understand Sequential Logic
5. Implement a D Flip-Flop
6. Create Testbench
7. Simulate the Design
8. Observe Combinational Output
9. Observe Sequential Output

## Learnings

- Combinational Logic
- Sequential Logic
- Continuous Assignment (`assign`)
- Always Block
- Clocked Logic
- Asynchronous Reset
- Flip-Flop Behavior
- Timing Dependency
- RTL Modeling

## Key Observation

During simulation:

- Combinational logic responds immediately whenever the inputs change.
- No clock signal is required for combinational circuits.
- Sequential logic updates its output only on the active clock edge.
- The reset signal initializes the sequential circuit to a known state.
- Flip-flops store data and introduce memory into digital circuits.

## Assignment

Design a **4-bit Register** in Verilog using Sequential Logic. The register should load 4-bit input data on every positive edge of the clock (`clk`) when the enable (`en`) signal is HIGH. Include an asynchronous reset (`rst`) to clear the register. Write a testbench to verify its functionality.

## Assignment Design

### 4-Bit Register

Inputs:

- Clock (`clk`)
- Reset (`rst`)
- Enable (`en`)
- 4-Bit Data Input (`d[3:0]`)

Outputs:

- 4-Bit Data Output (`q[3:0]`)

## Assignment Flow

1. Design a 4-Bit Register
2. Add Clock Input
3. Add Enable Control
4. Add Asynchronous Reset
5. Load Input Data on Positive Clock Edge
6. Create Testbench
7. Apply Different Input Values
8. Simulate the Design
9. Verify Register Operation

## Assignment Learnings

- Register Design
- Sequential Logic
- Clock Synchronization
- Enable Signal
- Asynchronous Reset
- Data Storage
- Testbench Development
- Waveform Analysis

## Key Observation

For every clock cycle:

- When `rst` is asserted, the register is cleared to zero.
- When `en` is HIGH, the register stores the input data on the positive edge of the clock.
- When `en` is LOW, the register retains its previous value.
- The output changes only on the clock edge, demonstrating sequential behavior.

## Conclusion

Verilog supports multiple modeling styles, each suited for different types of digital circuits. Combinational logic produces outputs solely based on present inputs, while sequential logic introduces memory through storage elements such as flip-flops. By implementing both combinational and sequential examples, this exercise demonstrates the fundamental difference between logic that reacts immediately to inputs and logic that depends on clock events for state updates.
