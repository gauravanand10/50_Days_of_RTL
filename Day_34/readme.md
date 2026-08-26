# Day 34 - Error Detection & Corrections

## Objective

Learn the fundamentals of **Error Detection and Error Correction** used in digital communication and data storage systems.

The day focuses on **Parity, CRC, and Hamming Code**, and helps understand the difference between detecting an error and actually locating and correcting it.

---

## Introduction

During data transmission or storage, bits may become corrupted because of noise, interference, timing problems, or hardware faults.

```text
Original Data
     |
     v
  Channel
     |
     v
Received Data
     |
     v
Error Detection / Correction
```

Error-handling techniques add redundant information to the original data so that the receiver can determine whether the data has been corrupted and, in some schemes, correct the corrupted data.

---

## Error Detection vs Error Correction

### Error Detection

Error detection determines whether the received data contains an error.

Examples:

- Parity
- Checksum
- CRC

Detection generally tells the receiver that something is wrong, but does not necessarily identify or repair the corrupted bit.

### Error Correction

Error correction provides enough redundant information to locate and correct an error.

Examples:

- Hamming Codes
- Reed-Solomon Codes
- BCH Codes
- Convolutional Codes
- LDPC
- Turbo Codes

---

# Parity

A parity bit is an additional bit used to make the total number of `1`s either even or odd.

Two common types are:

- Even parity
- Odd parity

For even parity:

```text
Data = 1011001
Number of 1s = 4
Parity = 0
```

For:

```text
Data = 1011101
Number of 1s = 5
Parity = 1
```

The parity bit makes the total number of `1`s even.

### Limitation

Simple parity can detect many single-bit errors, but it cannot determine the location of the corrupted bit and cannot correct the error.

---

# CRC - Cyclic Redundancy Check

CRC is a powerful error-detection technique widely used in digital communication and storage systems.

It treats data as a polynomial and performs **modulo-2 division** using a generator polynomial.

Modulo-2 addition and subtraction are equivalent to XOR:

```text
0 XOR 0 = 0
1 XOR 1 = 0
1 XOR 0 = 1
0 XOR 1 = 1
```

Therefore, CRC hardware is mainly based on **XOR operations and shift registers**.

## CRC Working Principle

If the generator polynomial has degree `r`, append `r` zeros to the message.

```text
Message + r zeros
       |
       v
Modulo-2 division
       |
       v
CRC remainder
```

The transmitted codeword becomes:

```text
Original Data + CRC Remainder
```

At the receiver, the received codeword is divided by the same generator.

```text
Remainder = 0
```

generally indicates that no detectable error was found.

A non-zero remainder indicates that an error was detected.

## CRC Example

Consider:

```text
Data      = 11010110
Generator = 1011
```

The generator has degree 3, so three zeros are appended:

```text
11010110 000
```

Modulo-2 division is performed using XOR. The resulting remainder is the CRC.

The final transmitted data is:

```text
Original Data + CRC
```

CRC is especially useful for detecting burst errors.

---

# Hamming Code

Hamming Code is an **error-correcting code**.

For the implementation studied on this day:

```text
Data bits   = 4
Parity bits = 3
Total bits  = 7
```

This is called:

```text
Hamming (7,4)
```

## Hamming (7,4) Bit Arrangement

The seven positions are:

```text
Position:  1   2   3   4   5   6   7
           P1  P2  D1  P3  D2  D3  D4
```

Parity bits are placed at positions that are powers of two:

```text
1, 2, 4
```

Data bits occupy:

```text
3, 5, 6, 7
```

## Parity Equations

For:

```text
D1 = data[0]
D2 = data[1]
D3 = data[2]
D4 = data[3]
```

the parity bits are:

```text
P1 = D1 ^ D2 ^ D4
P2 = D1 ^ D3 ^ D4
P3 = D2 ^ D3 ^ D4
```

The encoded word is:

```text
P1 P2 D1 P3 D2 D3 D4
```

---

# Hamming Syndrome

At the receiver, parity checks are performed again.

The resulting check bits form the **syndrome**.

```text
Syndrome = 000
```

means:

```text
No single-bit error detected
```

A non-zero syndrome identifies the position of a single-bit error.

For example:

```text
Syndrome = 101
```

Since:

```text
101(binary) = 5(decimal)
```

bit position 5 is identified as the corrupted bit.

The decoder flips that bit to correct the error.

## Hamming Example

Suppose bit 5 of a valid 7-bit codeword becomes corrupted.

The decoder calculates:

```text
Syndrome = 101
```

Therefore:

```text
Error position = 5
```

The decoder performs:

```text
corrected[4] = ~corrected[4]
```

and then extracts the original four data bits.

---

## RTL Implementation

### CRC Generator

The CRC RTL demonstrates:

- Shift-register based processing
- XOR operations
- Generator polynomial
- Remainder generation
- Sequential processing

### Hamming Encoder

The encoder demonstrates:

- Parity-bit generation
- Bit-position mapping
- Combinational XOR logic
- Hamming (7,4) encoding

### Hamming Decoder

The decoder demonstrates:

- Syndrome generation
- Error detection
- Error-position identification
- Single-bit correction
- Original data extraction

---

## Flow

1. Understand Data Corruption
2. Learn Error Detection
3. Study Parity
4. Understand CRC
5. Learn Modulo-2 Division
6. Implement CRC Hardware
7. Understand Error Correction
8. Study Hamming (7,4)
9. Calculate Hamming Parity Bits
10. Understand Syndrome
11. Detect a Single-Bit Error
12. Correct the Error
13. Create Testbench
14. Analyze Simulation Waveforms

---

## Learnings

- Error Detection
- Error Correction
- Parity
- Even and Odd Parity
- CRC
- Generator Polynomial
- Modulo-2 Division
- XOR-Based Arithmetic
- CRC Remainder
- Hamming Code
- Hamming (7,4)
- Parity Bit Placement
- Syndrome
- Single-Bit Error Correction
- Sequential RTL
- Combinational RTL
- Testbench Development
- Waveform Analysis

---

## Key Observation

During simulation:

- CRC detects corruption by producing a non-zero remainder.
- CRC does not directly identify which bit is corrupted.
- Hamming Code uses redundant parity bits to identify the error position.
- A zero Hamming syndrome means no single-bit error was detected.
- A non-zero syndrome represents the position of the erroneous bit.
- Hamming (7,4) can correct a single-bit error.
- CRC uses XOR-based modulo-2 arithmetic.
- Hamming uses parity equations and syndrome decoding.

---

# Assignment

Design a **CRC generator for an 8-bit message using a 4-bit generator polynomial**.

The design should calculate the CRC remainder and provide the generated CRC value for the input message.

A suitable testbench should:

- Apply different 8-bit messages.
- Calculate CRC values.
- Display the results.
- Verify the CRC operation.
- Observe the output in simulation.

## Assignment Flow

1. Apply 8-bit Message
2. Select Generator Polynomial
3. Append Required Zeros
4. Perform XOR-Based Division
5. Generate CRC Remainder
6. Assert Completion
7. Create Testbench
8. Test Different Messages
9. Observe CRC Output
10. Analyze Waveform

## Assignment Learnings

- CRC Generation
- Polynomial Division
- XOR-Based Arithmetic
- Shift Registers
- Sequential Processing
- Error Detection
- RTL Design
- Testbench Development
- Waveform Analysis

---

# Comparison: Error Detection vs Error Correction

| Feature | Error Detection | Error Correction |
|---------|-----------------|------------------|
| Detects Error | Yes | Yes |
| Locates Error | Usually No | Yes, depending on code |
| Corrects Error | No | Yes |
| Extra Bits | Required | Required |
| Examples | Parity, CRC, Checksum | Hamming, BCH, Reed-Solomon |
| Main Purpose | Identify corruption | Identify and repair corruption |

---

# Comparison: Parity vs CRC vs Hamming

| Feature | Parity | CRC | Hamming Code |
|---------|--------|-----|--------------|
| Type | Detection | Detection | Correction |
| Hardware Complexity | Very Low | Medium | Medium |
| Detects Single-Bit Error | Yes | Yes | Yes |
| Corrects Single-Bit Error | No | No | Yes |
| Error Location | No | No | Yes |
| Main Operation | XOR | XOR / Polynomial Division | XOR / Syndrome |
| Typical Use | UART | Ethernet, Storage | ECC Memory |

---

# Comparison: CRC vs Hamming Code

| Feature | CRC | Hamming Code |
|---------|-----|--------------|
| Primary Purpose | Error Detection | Error Correction |
| Error Location | Not directly provided | Syndrome identifies position |
| Single-Bit Correction | No | Yes |
| Arithmetic | Polynomial modulo-2 division | Parity equations |
| Output Information | Remainder | Syndrome |
| Common Application | Communication and Storage | ECC Memory |

---

## Applications

### CRC

- Ethernet
- USB
- Storage systems
- Communication protocols
- Data packets
- Embedded systems

### Hamming Code

- ECC memory
- Communication systems
- Digital data links
- Reliable storage
- Error-correcting hardware

---

## Interview Questions

### 1. What is the difference between error detection and error correction?

Error detection determines whether data has been corrupted, while error correction also provides enough information to locate and correct the corrupted data.

### 2. Why is XOR used in CRC?

CRC uses modulo-2 arithmetic. In modulo-2 arithmetic, addition and subtraction are equivalent to XOR.

### 3. What is a generator polynomial?

It is the polynomial used as the divisor during CRC modulo-2 division.

### 4. What does a zero CRC remainder indicate?

For a correctly received codeword, division by the same generator polynomial produces a zero remainder.

### 5. Can CRC correct an error?

CRC is primarily an error-detection technique. It detects errors but does not normally identify and correct the corrupted bit.

### 6. What is Hamming (7,4)?

It is a Hamming code containing 4 data bits and 3 parity bits, producing a 7-bit codeword.

### 7. Why are Hamming parity bits placed at positions 1, 2, and 4?

These positions are powers of two and allow the parity checks to encode the binary position of an erroneous bit.

### 8. What is a syndrome?

The syndrome is the collection of parity-check results used by the Hamming decoder to determine whether an error occurred and, for a single-bit error, identify its position.

### 9. What does syndrome `000` mean?

It indicates that no single-bit error was detected.

### 10. What does syndrome `101` mean?

`101` is decimal 5, so bit position 5 is identified as the erroneous bit.

---

## Key Takeaways

- Learned why redundant information is required for reliable communication.
- Understood the difference between error detection and error correction.
- Learned the basic operation of parity.
- Understood CRC as XOR-based modulo-2 polynomial division.
- Learned how the CRC remainder is generated.
- Understood Hamming (7,4) encoding.
- Learned how parity bits are positioned and calculated.
- Understood syndrome generation.
- Learned how a single-bit error can be located and corrected.
- Implemented the concepts using RTL and testbenches.

---

## Conclusion

Error detection and correction are fundamental techniques for building reliable digital systems. **Parity and CRC** provide mechanisms for detecting corrupted data, while **Hamming Code** extends this concept by providing the ability to locate and correct a single-bit error.

These concepts form a foundation for more advanced ECC schemes used in memories, communication systems, storage devices, and high-reliability hardware.
