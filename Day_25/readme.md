# Day 25 - Custom Sequence Generators

## Objective

Learn the concept of **Custom Sequence Generators** in Verilog and understand how digital circuits generate predefined sequences of numbers or patterns. Explore **counter-based sequence generators**, **pseudo-random sequence generators (LFSRs)**, and understand the importance of **primitive polynomials** and **feedback taps**.

## Design

### 4-Bit Linear Feedback Shift Register (LFSR)

Inputs:

- Clock (`clk`)
- Reset (`reset`)

Output:

- LFSR Output (`lfsr_out[3:0]`)

Functionality:

- Generates a pseudo-random sequence using a 4-bit shift register.
- Feedback is generated using XOR between selected tap positions.
- The register shifts once every clock cycle.
- Reset initializes the LFSR with a non-zero seed value.

## Flow

1. Learn Sequence Generators
2. Understand Counter-Based Sequence Generators
3. Learn Pseudo-Random Sequence Generators
4. Understand LFSRs
5. Learn Primitive and Non-Primitive Polynomials
6. Understand Feedback Taps
7. Implement a 4-Bit LFSR
8. Simulate the Generated Sequence
9. Analyze the Waveform

## Learnings

- Sequence Generators
- Counter-Based Sequences
- LFSR
- Pseudo-Random Number Generation
- Primitive Polynomials
- Feedback Taps
- Shift Registers
- Testbench Development

## Key Observation

During simulation:

- The LFSR generates a deterministic pseudo-random sequence.
- The sequence repeats after completing its maximum length.
- Primitive polynomials produce the longest possible sequence.
- A non-zero seed is mandatory for normal operation.
- An all-zero initial state causes the LFSR to remain stuck at zero.
- Every clock cycle shifts the register by one position while inserting the feedback bit.

## Assignment

Design a sequence generator in Verilog that generates only **odd values for a 4-bit number**, while including **0** in the sequence. The generator should produce:

```
0 → 1 → 3 → 5 → 7 → 9 → 11 → 13 → 15 → repeat
```

The sequence should advance every clock cycle and reset to **0** using an asynchronous reset.

## Assignment Design

### Odd Number Sequence Generator

Inputs:

- Clock (`clk`)
- Reset (`reset`)

Output:

- Sequence Output (`seq[3:0]`)

Internal Blocks:

- State Register
- Next-State Logic

Generated Sequence:

```
0000 (0)
0001 (1)
0011 (3)
0101 (5)
0111 (7)
1001 (9)
1011 (11)
1101 (13)
1111 (15)
Repeat...
```

## Assignment Flow

1. Design State Register
2. Implement Next-State Logic
3. Apply Asynchronous Reset
4. Generate Odd Number Sequence
5. Create Testbench
6. Apply Clock
7. Observe State Transitions
8. Verify Sequence
9. Analyze Waveforms

## Assignment Learnings

- Custom Sequence Generation
- State Machine Design
- Sequence Control
- Sequential Logic
- LFSR Fundamentals
- Testbench Development
- Waveform Analysis
- Pattern Generation

## Key Observation

For every clock cycle:

- The sequence advances to the next predefined value.
- Only odd numbers (along with zero) are generated.
- Reset immediately forces the output back to zero.
- The sequence repeats continuously after reaching 15.
- Unlike a binary counter, only selected states are visited.

## Comparison: Counter-Based Generator vs LFSR

| Feature | Counter-Based Generator | LFSR |
|---------|-------------------------|------|
| Sequence Type | Fixed and Sequential | Pseudo-Random |
| State Order | Predictable | Appears Random |
| Hardware Complexity | Very Low | Low |
| Feedback Logic | Not Required | XOR Feedback Required |
| Maximum States | Depends on Counter Width | 2ⁿ−1 (Primitive Polynomial) |
| Seed Required | No | Yes (Non-Zero Seed) |
| Applications | Counters, FSMs, Timers | CRC, Encryption, Random Testing, BIST |

## Comparison: Primitive vs Non-Primitive Polynomial

| Feature | Primitive Polynomial | Non-Primitive Polynomial |
|---------|----------------------|--------------------------|
| Sequence Length | Maximum (2ⁿ−1) | Shorter |
| State Coverage | Visits Every Non-Zero State | Misses Some States |
| Randomness | Better | Poor |
| Feedback Taps | Carefully Selected | Arbitrary |
| Applications | CRC, LFSR, Scramblers | Rarely Used |

## Conclusion

Sequence generators are widely used for producing predefined or pseudo-random patterns in digital systems. Counter-based generators are simple and ideal for fixed sequences, while LFSRs efficiently generate long pseudo-random sequences using minimal hardware. Understanding primitive polynomials, feedback taps, and custom sequence generation is fundamental for designing communication systems, cryptographic circuits, CRC generators, and hardware verification environments.
