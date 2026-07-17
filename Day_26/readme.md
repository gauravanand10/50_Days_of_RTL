# Day 26 - Edge Detectors

## Objective

Learn the concept of **Edge Detection** in Verilog and understand how digital circuits detect transitions in input signals. Explore the implementation of **Rising Edge**, **Falling Edge**, and **Dual Edge** detectors, and understand their importance in event detection and control logic.

## Design

### Rising Edge Detector

Inputs:

- Clock (`clk`)
- Input Signal (`signal_in`)

Output:

- Edge Detected (`edge_detected`)

Functionality:

- Detects a **0 → 1** transition.
- Generates a one-clock-cycle pulse whenever a rising edge occurs.

### Falling Edge Detector

Inputs:

- Clock (`clk`)
- Input Signal (`signal_in`)

Output:

- Edge Detected (`edge_detected`)

Functionality:

- Detects a **1 → 0** transition.
- Generates a one-clock-cycle pulse whenever a falling edge occurs.

### Dual Edge Detector

Inputs:

- Clock (`clk`)
- Input Signal (`signal_in`)

Output:

- Edge Detected (`edge_detected`)

Functionality:

- Detects both **rising** and **falling** edges.
- Generates a one-clock-cycle pulse whenever the input changes state.

## Flow

1. Learn Edge Detection
2. Understand Signal Transitions
3. Design a Rising Edge Detector
4. Design a Falling Edge Detector
5. Design a Dual Edge Detector
6. Create Testbench
7. Apply Input Transitions
8. Observe Edge Detection
9. Analyze the Waveforms

## Learnings

- Edge Detection
- Rising Edge Detection
- Falling Edge Detection
- Dual Edge Detection
- Previous State Storage
- Sequential Logic
- XOR Logic
- Testbench Development

## Key Observation

During simulation:

- Rising Edge Detector generates a pulse only during a **0 → 1** transition.
- Falling Edge Detector generates a pulse only during a **1 → 0** transition.
- Dual Edge Detector generates a pulse for both transitions.
- The output pulse remains HIGH for one clock cycle.
- The previous value of the input signal is stored and compared with the current value.

## Assignment

Design a system that counts the number of **100 MHz clock pulses** occurring between two consecutive **rising edges** of a slower **30 MHz** signal. Based on the measured clock count, estimate the frequency of the slower signal. Write a suitable testbench to verify the functionality.

## Assignment Design

### Pulse Counter System

Inputs:

- Fast Clock (`fast_clk`)
- Slow Signal (`slow_signal`)
- Reset (`reset`)

Outputs:

- Pulse Count (`count`)
- Measured Frequency (`frequency`)

Internal Blocks:

- Rising Edge Detector
- Counter
- Previous Signal Register

Functionality:

- Detect consecutive rising edges of the slow signal.
- Count the number of fast clock pulses between them.
- Estimate the signal frequency from the measured count.

## Assignment Flow

1. Detect Rising Edge
2. Reset Counter
3. Count Fast Clock Pulses
4. Detect Next Rising Edge
5. Store Pulse Count
6. Estimate Frequency
7. Create Testbench
8. Verify Counter Operation
9. Analyze Waveforms

## Assignment Learnings

- Edge Detection
- Pulse Counting
- Frequency Measurement
- Clock Domain Observation
- Sequential Logic
- Event Detection
- Testbench Development
- Waveform Analysis

## Key Observation

For every signal transition:

- Rising Edge Detector responds only to **0 → 1** transitions.
- Falling Edge Detector responds only to **1 → 0** transitions.
- Dual Edge Detector detects every transition.
- Edge detection relies on comparing the current and previous values of the input signal.
- Pulse counting provides an effective way to estimate signal frequency.

## Comparison: Rising vs Falling vs Dual Edge Detector

| Feature | Rising Edge Detector | Falling Edge Detector | Dual Edge Detector |
|---------|----------------------|-----------------------|--------------------|
| Detects | 0 → 1 | 1 → 0 | Both 0 → 1 and 1 → 0 |
| Logic Used | `~prev & signal` | `prev & ~signal` | `prev ^ signal` |
| Number of Edges Detected | One | One | Two |
| Output Pulse | One Clock Cycle | One Clock Cycle | One Clock Cycle |
| Hardware Complexity | Low | Low | Slightly Higher |
| Applications | Button Press, Interrupts | Reset Detection, End-of-Pulse Detection | Signal Monitoring, Frequency Measurement |

## Conclusion

Edge Detectors are fundamental sequential circuits used to detect transitions in digital signals. By storing the previous state of a signal and comparing it with the current state, they generate a single-clock-cycle pulse whenever the desired transition occurs. Rising, Falling, and Dual Edge Detectors are widely used in interrupt systems, communication protocols, pulse counters, frequency measurement circuits, and digital controllers.
