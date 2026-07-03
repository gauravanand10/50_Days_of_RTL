# Day 14 - Event Control

## Objective

Learn the concept of Event Control in Verilog by understanding how procedural blocks respond to changes in signals. Explore different event control mechanisms such as level-sensitive and edge-sensitive events, and observe how Verilog executes statements based on signal transitions.

## Design

### Event-Controlled Logic

Inputs:

- Request (`req`)
- Acknowledgment (`ack`)

Output:

- Output (`out`)

## Flow

1. Learn Event Control in Verilog
2. Understand Procedural Blocks
3. Study Level-Sensitive Event Control
4. Study Edge-Sensitive Event Control
5. Implement Event-Controlled Logic
6. Create Testbench
7. Simulate the Design
8. Observe Signal Changes
9. Verify Output Behavior

## Learnings

- Event Control
- Procedural Blocks
- `always` Block
- Sensitivity List
- Level-Sensitive Events
- Edge-Sensitive Events
- Combinational Logic
- Signal Monitoring
- Simulation Behavior

## Key Observation

During simulation:

- The `always` block executes whenever a signal in the sensitivity list changes.
- The output becomes HIGH immediately when both `req` and `ack` are HIGH.
- If either `req` or `ack` becomes LOW, the output immediately returns to LOW.
- Event control enables hardware to react automatically to signal transitions.

## Assignment

Design a Verilog system that continuously monitors the `req` (request) and `ack` (acknowledgment) signals. The output should become HIGH as soon as both signals are asserted (`req = 1` and `ack = 1`). When either signal is deasserted, the output should immediately return to LOW. Write a suitable testbench to verify all possible input combinations.

## Assignment Design

### Request-Acknowledge Logic

Inputs:

- Request (`req`)
- Acknowledgment (`ack`)

Output:

- Output (`out`)

## Assignment Flow

1. Create Verilog Module
2. Declare Request and Acknowledgment Inputs
3. Declare Output Signal
4. Implement Event-Controlled Logic
5. Create Testbench
6. Apply All Input Combinations
7. Simulate the Design
8. Observe Output Changes
9. Verify Correct Request-Acknowledge Operation

## Assignment Learnings

- Event-Driven Simulation
- Sensitivity List
- Combinational Logic Design
- Request-Acknowledge Handshake
- Signal Monitoring
- RTL Coding
- Testbench Development
- Waveform Analysis

## Key Observation

For every input combination:

- When `req = 0` and `ack = 0`, the output remains LOW.
- When only one signal is HIGH, the output remains LOW.
- When both `req` and `ack` become HIGH, the output immediately becomes HIGH.
- If either signal changes back to LOW, the output immediately returns to LOW.
- The output continuously follows the status of the two input signals without requiring a clock.

## Conclusion

Event Control is a fundamental concept in Verilog that allows procedural blocks to execute whenever specified signals change. By implementing a simple request-acknowledge system, this exercise demonstrates how event-driven hardware responds immediately to input changes. Understanding event control is essential for designing both combinational and sequential digital circuits.
