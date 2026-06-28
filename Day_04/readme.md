# Day 4 - Understanding Floating Inputs and Unknown States

## Objective

Build a 2-bit Comparator in Verilog and observe the behavior of the design when input drivers are removed from the testbench.

## Design

2-Bit Comparator with outputs:

- A Greater Than B (`a_gt_b`)
- A Equal To B (`a_eq_b`)
- A Less Than B (`a_lt_b`)

## Flow

1. Create 2-Bit Comparator RTL
2. Develop Testbench with Driven Inputs
3. Verify Comparator Outputs
4. Remove Input Drivers from Testbench
5. Run Simulation Again
6. Observe `Z` (High Impedance) on Inputs
7. Observe `X` (Unknown) on Outputs

## Learnings

- Difference between driven and undriven signals
- Understanding `Z` (High Impedance) state
- Understanding `X` (Unknown) state
- Signal propagation in simulation
- Importance of proper input driving
- Debugging floating signals using waveforms
- Role of simulation in finding connection errors

## Key Observation

When the input drivers for `a_in` and `b_in` are removed:

- Inputs become floating (`Z`)
- Comparator cannot evaluate conditions correctly
- Outputs become unknown (`X`)
- Waveforms clearly show the propagation of invalid states

## Conclusion

A digital circuit requires all inputs to be properly driven. Floating inputs result in high-impedance (`Z`) states, which propagate through the logic and generate unknown (`X`) outputs. This experiment demonstrates the importance of signal integrity, proper connections, and waveform analysis during RTL verification.
