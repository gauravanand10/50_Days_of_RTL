# Day 29 - Concurrency

## Objective

Learn the concept of **Concurrency** in Verilog and understand how multiple hardware operations execute simultaneously. Explore how concurrent execution differs from sequential software execution and implement a **Pulse Width Modulation (PWM) Generator** to demonstrate concurrent hardware behavior.

---

## Design

### PWM Generator

Inputs:

- Clock (`clk`)
- Reset (`reset`)
- Duty Cycle (`duty_cycle[7:0]`)

Output:

- PWM Output (`pwm_out`)

Functionality:

- Generates a PWM signal using an 8-bit counter.
- The counter continuously increments with every clock cycle.
- The PWM output remains HIGH while the counter value is less than the duty cycle.
- The duty cycle determines the percentage of time the output remains HIGH within one PWM period.

---

## Flow

1. Learn Concurrency
2. Understand Parallel Hardware Execution
3. Learn PWM Fundamentals
4. Design an 8-bit Counter
5. Compare Counter with Duty Cycle
6. Generate PWM Output
7. Create Testbench
8. Simulate Different Duty Cycles
9. Analyze Waveforms

---

## Learnings

- Concurrency
- Parallel Hardware Execution
- PWM Generation
- Counters
- Duty Cycle
- Clock-Driven Sequential Logic
- Continuous Comparison Logic
- Testbench Development

---

## Key Observation

During simulation:

- The counter increments independently every clock cycle.
- The comparator continuously evaluates the counter against the duty cycle.
- Both operations execute simultaneously, demonstrating hardware concurrency.
- Increasing the duty cycle increases the HIGH duration of the PWM signal.
- Changing the duty cycle immediately affects the generated waveform.

---

## Assignment

Design a **Variable Frequency PWM Generator** where both the **frequency** and **duty cycle** can be adjusted dynamically. Write a suitable testbench to verify different operating conditions and observe the resulting PWM waveforms.

---

## Assignment Design

### Variable Frequency PWM Generator

Inputs:

- Clock (`clk`)
- Reset (`reset`)
- Duty Cycle (`duty_cycle[7:0]`)
- Frequency Divider (`freq_divider[7:0]`)

Outputs:

- PWM Output (`pwm_out`)

Internal Blocks:

- Clock Divider
- PWM Counter
- Comparator

Functionality:

- Divide the system clock using the programmable frequency divider.
- Generate a PWM signal using the divided clock.
- Control the duty cycle independently of the output frequency.
- Produce different PWM waveforms based on user-defined settings.

---

## Assignment Flow

1. Design Clock Divider
2. Design PWM Counter
3. Compare Counter with Duty Cycle
4. Generate PWM Output
5. Adjust Frequency
6. Create Testbench
7. Apply Different Duty Cycles
8. Apply Different Frequencies
9. Analyze Waveforms

---

## Assignment Learnings

- Concurrent Hardware Design
- PWM Generation
- Frequency Control
- Duty Cycle Control
- Clock Division
- Sequential Logic
- Testbench Development
- Waveform Analysis

---

## Key Observation

For different input configurations:

- Increasing the duty cycle increases the HIGH portion of the PWM signal.
- Changing the frequency divider changes the PWM frequency while maintaining the selected duty cycle.
- The clock divider, counter, and comparator all operate concurrently.
- PWM is generated continuously without processor intervention.
- Hardware concurrency enables efficient real-time signal generation.

---

## Comparison: Sequential Execution vs Concurrent Execution

| Feature | Sequential Execution | Concurrent Execution |
|---------|----------------------|----------------------|
| Execution Style | One operation at a time | Multiple operations simultaneously |
| Typical Domain | Software | Digital Hardware |
| Dependency | Instructions execute in order | Independent hardware blocks run in parallel |
| Performance | Limited by instruction sequence | Higher throughput |
| Verilog Constructs | Procedural Statements | Continuous Assignments & Always Blocks |
| Example | C Program | RTL Circuit |

---

## Comparison: Software vs Hardware Concurrency

| Feature | Software | Hardware |
|---------|----------|----------|
| Parallelism | Limited (Threads/Processes) | True Parallel Execution |
| Clock Dependency | CPU Scheduler | System Clock |
| Resource Sharing | CPU Time | Dedicated Hardware |
| Execution Speed | Sequential or Time-Sliced | Simultaneous |
| Example | Multithreading | Multiple RTL Modules Running Together |

---

## Conclusion

Concurrency is one of the defining characteristics of digital hardware. Unlike software, where instructions execute sequentially, hardware modules operate simultaneously whenever their inputs change or a clock event occurs. The PWM Generator demonstrates this concept by allowing the counter, comparator, and output logic to function concurrently, producing continuous real-time output. Understanding concurrency is fundamental for designing efficient RTL systems such as processors, communication interfaces, signal-processing units, and FPGA/ASIC accelerators.
