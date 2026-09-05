# Day 35 - Custom Waveform Generators

## Objective

Learn how digital systems generate **custom waveforms** such as sine, square, triangle, sawtooth, and Sinc waveforms using digital samples, ROM/LUTs, and address-generation logic.

This day also introduces **COE files, lookup tables, sampling, unsigned fixed-point representation, and the basic concept of DDS (Direct Digital Synthesis).**

---

## Introduction

A digital system represents a waveform using discrete samples.

```text
Waveform
   |
   v
Sampling
   |
   v
Digital Samples
   |
   v
ROM / LUT
   |
   v
Digital Waveform Output
```

Instead of calculating `sin()` in hardware, precomputed samples can be stored in a ROM and read sequentially.

---

## Sine Wave Generation

A sine wave is described by:

```text
y = A sin(theta)
```

where `A` is the amplitude.

For one complete cycle:

```text
theta = 0 to 2*pi
```

The continuous sine wave is converted into a finite number of digital samples.

For example:

```text
Number of samples = 256
Bit width          = 8
Amplitude           = 127
```

The samples represent one complete sine-wave period.

---

## Unsigned Sine Representation

A mathematical sine wave contains both positive and negative values, but an unsigned 8-bit value can represent only:

```text
0 to 255
```

Therefore, the waveform is shifted by an offset.

For 8 bits:

```text
Maximum value = 255
Offset        = 127
```

Conceptually:

```text
Signed Sine
     |
     | Add offset
     v
Unsigned Sine
```

Approximate range:

```text
Minimum ≈ 0
Maximum ≈ 254
Middle   ≈ 127
```

This makes the waveform suitable for storage in an unsigned ROM.

---

## Python Sample Generation

Python and NumPy can be used to generate the samples:

```python
theta = np.linspace(0, 2*np.pi, num_samples, endpoint=False)
sine_wave = amplitude * np.sin(theta)
```

The values are then shifted, rounded, and clipped to the required digital range.

Using Python avoids manually calculating hundreds of samples.

---

# COE File

A **COE (Coefficient) file** is commonly used with Vivado/Xilinx memory IP for memory initialization.

Example:

```text
memory_initialization_radix=10;

memory_initialization_vector=
127,
130,
133,
...
;
```

The radix specifies the representation of the stored values.

For example:

```text
memory_initialization_radix=10;
```

means decimal values are stored.

---

## Lookup Table / ROM

A waveform LUT stores precomputed samples:

```text
Address       Sample
   0          Sample 0
   1          Sample 1
   2          Sample 2
  ...           ...
 255          Sample 255
```

An address counter can continuously cycle through the table:

```text
0 -> 1 -> 2 -> ... -> 255 -> 0 -> ...
```

This produces a periodic waveform.

---

## Waveform Frequency

For a simple LUT where one sample is read on every clock:

```text
f_out = f_clk / N
```

where:

- `f_out` = waveform frequency
- `f_clk` = system clock frequency
- `N` = samples per waveform cycle

Example:

```text
f_clk = 100 MHz
N     = 256

f_out = 100 MHz / 256
      ≈ 390.625 kHz
```

---

# DDS - Direct Digital Synthesis

DDS provides more flexible frequency control.

A basic DDS contains:

```text
          Frequency Control Word
                    |
                    v
Clock ---> Phase Accumulator
                    |
                    v
               Phase / Address
                    |
                    v
                  ROM
                    |
                    v
             Waveform Output
```

The phase accumulator adds a fixed phase increment every clock.

Example:

```text
Increment = 1

0 -> 1 -> 2 -> 3 -> 4 -> ...
```

For a larger increment:

```text
Increment = 4

0 -> 4 -> 8 -> 12 -> ...
```

A larger phase increment moves through the LUT faster and therefore produces a higher output frequency.

---

# Custom Waveforms

The same ROM/LUT concept can generate many waveforms.

### Sine

```text
ROM contains sine samples
```

### Square

```text
ROM contains HIGH and LOW values
```

### Triangle

```text
ROM contains increasing and decreasing samples
```

### Sawtooth

```text
ROM contains continuously increasing samples
```

### Custom

Any desired set of samples can be stored in the LUT.

---

# Assignment - Sinc Waveform Generator

Build a system that generates a **Sinc waveform**.

The Sinc function is:

```text
sinc(x) = sin(pi*x) / (pi*x)
```

At:

```text
x = 0
```

the mathematical limit is:

```text
sinc(0) = 1
```

The waveform should be sampled, converted into digital values, stored in memory, and read sequentially by the RTL.

---

## Assignment Architecture

```text
       Sinc Sample Data
              |
              v
       +-------------+
       |     ROM     |
       +-------------+
              |
              v
       Address Counter
              |
              v
        Sinc Output
```

Python can be used to generate the Sinc samples and the required memory initialization file.

---

## Assignment Flow

1. Define the Sinc Function
2. Generate Sinc Samples
3. Handle the `x = 0` Case
4. Quantize the Samples
5. Convert Samples to Digital Values
6. Generate Memory Initialization Data
7. Store Samples in ROM
8. Generate ROM Addresses
9. Output Samples Sequentially
10. Create Testbench
11. Run Simulation
12. Analyze the Sinc Waveform

---

## Learnings

- Digital Waveform Generation
- Sampling
- Sine Wave Generation
- Sinc Waveform
- Lookup Tables
- ROM
- COE Files
- Memory Initialization
- Unsigned Fixed-Point Representation
- Address Generation
- Periodic Waveforms
- DDS
- Phase Accumulator
- Frequency Control
- RTL Design
- Testbench Development
- Waveform Analysis

---

## Key Observation

During simulation:

- A continuous waveform is represented using discrete digital samples.
- The ROM/LUT stores the precomputed waveform values.
- An address counter selects successive samples.
- Wrapping the address back to zero makes the waveform periodic.
- More samples per cycle provide a finer waveform representation.
- DDS uses a phase accumulator to control how quickly the LUT is traversed.
- Python is useful for generating large waveform tables automatically.
- The simulated output appears as a staircase-like digital waveform because the signal is represented using discrete samples.

---

# Comparison: LUT Waveform Generation vs DDS

| Feature | LUT + Counter | DDS |
|---------|---------------|-----|
| Address Generation | Counter | Phase Accumulator |
| Frequency Control | Mainly tied to clock/sample count | Frequency control word |
| Frequency Resolution | Limited | High |
| Hardware Complexity | Low | Medium |
| Flexibility | Lower | Higher |
| Typical Use | Simple waveform generation | Precise frequency synthesis |

---

# Comparison: COE vs MEM

| Feature | COE | MEM |
|---------|-----|-----|
| Main Use | FPGA memory/IP initialization | Simulation/memory initialization |
| Format | Structured initialization syntax | Usually one value per line |
| Typical Use | Vivado Memory IP | `$readmemh` / `$readmemb` |
| Advantage | Convenient for FPGA memory IP | Simple for simulation |

---

# Comparison: Analog vs Digital Waveform Generation

| Feature | Analog | Digital |
|---------|--------|---------|
| Representation | Continuous | Discrete samples |
| Storage | Not normally sample-based | ROM/LUT/Memory |
| Processing | Analog circuitry | Digital logic |
| Frequency Control | Analog components | Clock/DDS |
| FPGA Implementation | Requires analog interface | Directly implementable digitally |

---

## Applications

- FPGA Function Generators
- DDS Systems
- Digital Oscillators
- Signal Processing
- Communication Systems
- DSP Systems
- Test Signal Generation
- Audio Generation
- Radar and Instrumentation
- Custom FPGA Waveform Generators

---

# Interview Questions

### 1. Why is ROM used for waveform generation?

ROM stores precomputed waveform samples, avoiding expensive real-time mathematical calculations.

### 2. What is a LUT?

A Lookup Table is a memory containing precomputed values accessed using an address.

### 3. Why are sine values shifted before storing them as unsigned values?

A mathematical sine contains negative values. Adding an offset moves the waveform into the valid unsigned range.

### 4. What is DDS?

Direct Digital Synthesis is a technique for generating periodic digital waveforms using a phase accumulator and waveform lookup table.

### 5. What is a phase accumulator?

A register that repeatedly adds a phase increment every clock cycle. Its value represents the current phase of the generated waveform.

### 6. How does phase increment affect frequency?

A larger phase increment moves through the waveform LUT faster, producing a higher output frequency.

### 7. Why is `endpoint=False` used when generating one period?

It prevents duplicating the first sample at the end of the period.

### 8. What happens when the number of samples per cycle is increased?

The waveform is represented more finely, reducing the spacing between samples.

### 9. Why is Python useful for FPGA waveform generation?

Python can quickly generate large numbers of accurate samples and produce memory initialization files.

### 10. What is special about `sinc(0)`?

The expression has the form `0/0` at `x = 0`, but its mathematical limit is defined as:

```text
sinc(0) = 1
```

---

## Key Takeaways

- Learned how digital systems represent analog-like waveforms using samples.
- Generated sine-wave samples using Python and NumPy.
- Learned how signed waveform values can be shifted into an unsigned range.
- Understood COE files and memory initialization.
- Learned how ROM/LUT-based waveform generators work.
- Understood sequential address generation.
- Learned the basic concept of DDS and phase accumulation.
- Understood how phase increment controls output frequency.
- Learned that the same architecture can generate different custom waveforms.
- Applied the concept to the Sinc waveform assignment.

---

## Conclusion

Custom waveform generation in FPGA systems can be implemented efficiently using **ROM/LUT-based sample storage**. A waveform is first represented as digital samples, stored in memory, and then read sequentially by RTL logic.

Python is useful for generating large sets of waveform samples and creating memory initialization files. The introduction to **DDS and phase accumulation** provides the foundation for more flexible waveform generators with precise frequency control.

The Sinc waveform assignment extends the same concept from a simple sine LUT to a custom mathematically defined waveform.
