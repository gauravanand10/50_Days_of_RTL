# Day 15 - Blocking and Non-Blocking Assignments

## Objective

Learn the difference between Blocking (`=`) and Non-Blocking (`<=`) assignments in Verilog. Understand when each assignment type should be used and how they affect simulation and hardware behavior in combinational and sequential circuits.

## Design

### Blocking Assignment

Inputs:

- Input A (`a`)
- Input B (`b`)

Outputs:

- Temporary Register (`temp`)
- Output (`out`)

### Non-Blocking Assignment

Inputs:

- Clock (`clk`)
- Reset (`rst`)
- Data Input (`d`)

Outputs:

- Register Output (`q`)

## Flow

1. Learn Blocking Assignment (`=`)
2. Understand Sequential Execution
3. Implement Blocking Assignment Example
4. Learn Non-Blocking Assignment (`<=`)
5. Understand Parallel Register Updates
6. Implement Non-Blocking Assignment Example
7. Create Testbench
8. Simulate the Design
9. Compare Simulation Results

## Learnings

- Blocking Assignment (`=`)
- Non-Blocking Assignment (`<=`)
- Sequential Execution
- Parallel Execution
- Combinational Logic
- Sequential Logic
- Clocked Circuits
- RTL Coding Guidelines
- Simulation Behavior

## Key Observation

During simulation:

- Blocking assignments execute one statement after another in sequence.
- The next statement uses the updated value immediately.
- Non-blocking assignments schedule updates to occur together at the end of the current simulation time step.
- Blocking assignments are generally used for combinational logic.
- Non-blocking assignments are recommended for sequential (clocked) logic.

## Assignment

Design two Verilog modules to demonstrate the difference between Blocking (`=`) and Non-Blocking (`<=`) assignments. Simulate both designs using suitable testbenches and compare the output waveforms to understand the difference in execution order and hardware behavior.

## Assignment Design

### Blocking Assignment Module

Inputs:

- Input A (`a`)
- Input B (`b`)

Outputs:

- Temporary Register (`temp`)
- Output (`out`)

### Non-Blocking Assignment Module

Inputs:

- Clock (`clk`)
- Reset (`rst`)
- Data Input (`d`)

Outputs:

- Register Output (`q`)

## Assignment Flow

1. Design Blocking Assignment Module
2. Design Non-Blocking Assignment Module
3. Create Separate Testbenches
4. Apply Different Input Stimuli
5. Simulate Both Designs
6. Observe Execution Order
7. Compare Output Waveforms
8. Verify Correct Behavior
9. Analyze Differences

## Assignment Learnings

- Difference Between `=` and `<=`
- Combinational RTL Design
- Sequential RTL Design
- Event Scheduling
- Register Updates
- Coding Best Practices
- Testbench Development
- Waveform Analysis

## Key Observation

For Blocking Assignment:

- Statements execute sequentially.
- Updated values are available immediately to subsequent statements.
- Best suited for combinational logic.

For Non-Blocking Assignment:

- All register updates occur simultaneously after the current time step.
- Prevents race conditions in sequential logic.
- Best suited for clocked circuits and flip-flops.

## Conclusion

Blocking and Non-Blocking assignments are fundamental concepts in Verilog RTL design. Blocking assignments execute sequentially and are primarily used for combinational logic, while Non-Blocking assignments update registers simultaneously and are the preferred choice for sequential logic. Choosing the correct assignment operator ensures accurate simulation results and reliable synthesized hardware.
