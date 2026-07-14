# Day 24 - Shift Registers

## Objective

Learn the concept of **Shift Registers** in Verilog and understand how data can be shifted left or right through a register. Explore different types of shifting techniques, including **Logical Shift**, **Arithmetic Shift**, and **Cyclic (Rotate) Shift**, and understand their applications in digital systems.

## Design

### Shift Register

Inputs:

- Data Input (`data_in[7:0]`)
- Shift Amount (`shift_amt[2:0]`)

Outputs:

- Left Shift Output (`shifted_outl[7:0]`)
- Right Shift Output (`shifted_outr[7:0]`)
- Left Shift using Concatenation (`shifted_left[7:0]`)
- Right Shift using Concatenation (`shifted_right[7:0]`)

Functionality:

- Perform left and right logical shifts using shift operators (`<<`, `>>`).
- Perform left and right shifts using concatenation.
- Compare both methods and verify that they produce identical results for a one-bit shift.

## Flow

1. Learn Shift Registers
2. Understand Logical Shift
3. Understand Arithmetic Shift
4. Understand Cyclic (Rotate) Shift
5. Implement Shift Operator Method
6. Implement Concatenation Method
7. Create Testbench
8. Simulate Various Input Patterns
9. Analyze Waveforms

## Learnings

- Shift Registers
- Logical Shift
- Arithmetic Shift
- Cyclic Shift
- Shift Operators (`<<`, `>>`)
- Concatenation Operator (`{}`)
- Serial Data Movement
- Testbench Development

## Key Observation

During simulation:

- Logical left shift inserts **0** into the vacant LSB.
- Logical right shift inserts **0** into the vacant MSB.
- Arithmetic right shift preserves the sign bit (MSB).
- Cyclic (Rotate) shift wraps the shifted-out bit back into the opposite end.
- Concatenation provides an alternative hardware-friendly implementation for fixed shifts.
- Shift operator and concatenation produce identical results for fixed one-bit logical shifts.

## Assignment

Implement a **Parallel-to-Serial Converter** using a shift register to understand how serial communication interfaces transmit data one bit at a time. Write a suitable testbench to verify the serialization process.

## Assignment Design

### Parallel-to-Serial Converter

Inputs:

- Clock (`clk`)
- Reset (`rst`)
- Load (`load`)
- Parallel Data (`parallel_in[7:0]`)

Outputs:

- Serial Output (`serial_out`)
- Done (`done`)

Internal Blocks:

- 8-bit Shift Register
- Bit Counter

Functionality:

- Load 8-bit parallel data.
- Shift one bit out on every clock cycle.
- Assert `done` after transmitting all 8 bits.

## Assignment Flow

1. Design Shift Register
2. Add Parallel Load Logic
3. Shift Data Serially
4. Count Shifted Bits
5. Assert Done Signal
6. Create Testbench
7. Load Parallel Data
8. Observe Serial Output
9. Verify Complete Transmission

## Assignment Learnings

- Parallel-to-Serial Conversion
- Shift Register Design
- Data Serialization
- Sequential Logic
- Bit Counting
- Control Signals
- Testbench Development
- Waveform Analysis

## Key Observation

For every clock cycle:

- One bit is transmitted through the serial output.
- Remaining bits shift by one position.
- Data transmission completes after eight clock cycles.
- Parallel data is converted into a serial bit stream.
- Shift registers form the basis of serializers used in communication protocols.

## Comparison: Logical vs Arithmetic vs Cyclic Shift

| Feature | Logical Shift | Arithmetic Shift | Cyclic (Rotate) Shift |
|---------|---------------|------------------|------------------------|
| Vacant Bit | Filled with 0 | Filled with Sign Bit (Right Shift) | Wrapped Around |
| Sign Preservation | No | Yes | No |
| Data Loss | Yes | Yes | No |
| Hardware Complexity | Low | Low | Medium |
| Common Use | Unsigned Arithmetic | Signed Arithmetic | Circular Buffers, CRC, Cryptography |
| FPGA Implementation | Excellent | Excellent | Good |
| ASIC Implementation | Excellent | Excellent | Excellent |

## Conclusion

Shift Registers are one of the most fundamental sequential circuits in digital design. They enable efficient movement of data between registers and are widely used for serialization, deserialization, buffering, delay generation, CRC computation, and pseudo-random number generation. Understanding the different shifting techniques and their hardware implementations is essential for designing communication interfaces and high-speed digital systems.
