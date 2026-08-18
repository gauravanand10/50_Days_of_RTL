# Day 33 - Glue Logic

## Objective

Learn the concept of **Glue Logic** in digital systems and understand how small RTL circuits are used to connect modules or subsystems that have different interfaces, data widths, timing requirements, or data representations.

The day also covers common glue-logic operations such as **signal-width adjustment, endian conversion, byte addressing, data-format conversion, and interface handshaking**.

---

## Design

### Glue Logic

Glue logic refers to the small amount of additional logic required to make two otherwise incompatible modules communicate correctly.

```text
Subsystem A
    |
    | Different interface / width / format
    v
Glue Logic
    |
    | Compatible interface
    v
Subsystem B
```

Glue logic does not usually implement the main functionality of either subsystem. Its purpose is to **adapt and connect** them.

---

## Signal Width Adjustment

Different modules may use different data widths.

For example:

```text
8-bit Module
     |
     v
Glue Logic
     |
     v
16-bit Module
```

An 8-bit value can be zero-extended to 16 bits:

```verilog
assign out_data = {8'b0, in_data};
```

Example:

```text
Input  = 8'hAB
Output = 16'h00AB
```

---

## Endianness

Endianness defines how multi-byte data is arranged in memory.

The two common formats are:

- **Little Endian**
- **Big Endian**

Consider:

```text
32-bit value = 0x12345678
```

### Little Endian

The least significant byte is stored at the lowest memory address.

```text
Memory[0] = 0x78
Memory[1] = 0x56
Memory[2] = 0x34
Memory[3] = 0x12
```

### Big Endian

The most significant byte is stored at the lowest memory address.

```text
Memory[0] = 0x12
Memory[1] = 0x34
Memory[2] = 0x56
Memory[3] = 0x78
```

---

## Endian Conversion

Endian conversion can be implemented by rearranging the byte order.

```text
Input:
+--------+--------+--------+--------+
|   12   |   34   |   56   |   78   |
+--------+--------+--------+--------+

After byte swap:
+--------+--------+--------+--------+
|   78   |   56   |   34   |   12   |
+--------+--------+--------+--------+
```

---

## Byte Addressing

A 32-bit data bus contains four bytes:

```text
31          24 23          16 15           8 7            0
+-------------+-------------+-------------+-------------+
|   Byte 3    |   Byte 2    |   Byte 1    |   Byte 0    |
+-------------+-------------+-------------+-------------+
```

A byte-enable signal determines which byte is written.

```text
byte_enable = 4'b0001  -> Byte 0
byte_enable = 4'b0010  -> Byte 1
byte_enable = 4'b0100  -> Byte 2
byte_enable = 4'b1000  -> Byte 3
```

---

## Data Format Conversion

Glue logic can also convert one representation into another.

For example, Binary to Excess-3 conversion can be implemented by adding binary `3`:

```verilog
assign excess3_out = binary_in + 4'b0011;
```

Example:

```text
Binary input = 0101

0101 + 0011 = 1000

Excess-3 output = 1000
```

---

## Interface Handshaking

Glue logic can adapt handshaking between different interfaces.

For a VALID/READY style interface:

```text
Subsystem A
VALID + DATA
     |
     v
Glue Logic
     |
     v
Subsystem B
READY + DATA
```

A transfer occurs when:

```text
Transfer = VALID && READY
```

This prevents data from being accepted before the receiving subsystem is ready.

---

## Flow

1. Learn Glue Logic
2. Understand Module Interconnection
3. Study Signal Width Adjustment
4. Understand Little Endian and Big Endian
5. Implement Endian Conversion
6. Study Byte Addressing
7. Understand Byte Enables
8. Explore Data Format Conversion
9. Understand Interface Handshaking
10. Design Glue Logic
11. Create Testbench
12. Analyze Waveforms

---

## Learnings

- Glue Logic
- Module Interconnection
- Signal Width Conversion
- Zero Extension
- Endianness
- Little Endian
- Big Endian
- Byte Addressing
- Byte Enables
- Data Format Conversion
- Binary to Excess-3 Conversion
- VALID/READY Handshaking
- Interface Adaptation
- RTL Design
- Testbench Development

---

## Key Observation

During the study:

- Glue logic connects modules that cannot directly communicate.
- Data widths may need to be increased or adapted before connecting modules.
- Endian conversion requires rearranging the byte order of multi-byte data.
- A 32-bit word contains four individual bytes.
- Byte-enable signals allow individual bytes to be modified.
- Data formats can be converted using simple combinational logic.
- Interface handshaking allows modules with different control requirements to communicate safely.

---

## Assignment

Design a **glue logic circuit in Verilog** that connects two subsystems using different interface protocols.

Subsystem A generates a **VALID** signal along with an **8-bit data bus**, while Subsystem B requires the data to be accompanied by a **READY** signal before accepting it.

The glue logic must ensure correct handshaking between the two subsystems.

---

## Assignment Design

### Subsystem A

```text
DATA  : 8-bit
VALID : 1-bit
```

Subsystem A indicates that valid data is available by asserting:

```text
VALID = 1
```

### Subsystem B

```text
DATA  : 8-bit
READY : 1-bit
```

Subsystem B accepts data when it is ready.

The transfer condition is:

```text
VALID && READY
```

### Glue Logic

```text
Subsystem A
     |
     | DATA + VALID
     v
Glue Logic
     |
     | DATA + READY
     v
Subsystem B
```

The glue logic ensures that data is transferred only when the required handshake condition is satisfied.

---

## Assignment Flow

1. Define Subsystem A Interface
2. Define Subsystem B Interface
3. Connect the 8-bit Data Bus
4. Implement VALID Handling
5. Implement READY Handling
6. Detect `VALID && READY`
7. Transfer Data
8. Create Testbench
9. Test Different READY Conditions
10. Analyze Waveforms

---

## Assignment Learnings

- Interface Adaptation
- VALID/READY Handshaking
- Data Transfer Control
- Glue Logic Design
- Synchronous Communication
- Control Logic
- RTL Design
- Testbench Development
- Waveform Analysis

---

## Comparison: Little Endian vs Big Endian

| Feature | Little Endian | Big Endian |
|---------|----------------|------------|
| Lowest Address | LSB | MSB |
| Highest Address | MSB | LSB |
| `0x12345678` in Memory | `78 56 34 12` | `12 34 56 78` |
| Main Operation | Byte ordering | Byte ordering |

---

## Comparison: Direct Connection vs Glue Logic

| Feature | Direct Connection | Glue Logic |
|---------|-------------------|------------|
| Interface Compatibility | Must already match | Can adapt interfaces |
| Data Width | Same | Can be converted |
| Data Format | Same | Can be converted |
| Timing/Handshake | Must match | Can be adapted |
| Flexibility | Limited | High |

---

## Applications

- SoC Interconnects
- AXI to APB Bridges
- Processor Interfaces
- Memory Controllers
- Peripheral Interfaces
- Legacy System Integration
- Bus Width Conversion
- Endian Conversion
- Protocol Adaptation
- Data Format Conversion

---

## Interview Questions

### 1. What is Glue Logic?

Glue logic is additional logic used to connect different modules or subsystems and make their interfaces compatible.

### 2. Why is Glue Logic required?

It is required when modules have differences in data width, protocol, timing, byte order, or control signals.

### 3. What is the difference between Little Endian and Big Endian?

Little Endian stores the least significant byte at the lowest memory address, while Big Endian stores the most significant byte at the lowest memory address.

### 4. What is byte addressing?

Byte addressing allows individual bytes within a larger data word to be accessed or modified independently.

### 5. What is a byte-enable signal?

A byte-enable signal specifies which byte lanes of a wider data bus should participate in a read or write operation.

### 6. What is VALID/READY handshaking?

It is a communication mechanism where data transfer occurs when both VALID and READY are asserted:

```text
Transfer = VALID && READY
```

### 7. Give an example of Glue Logic in an SoC.

An AXI-to-APB bridge is a common example. The bridge converts transactions from the AXI protocol into the APB protocol so that an AXI master can communicate with an APB peripheral.

---

## Key Takeaways

- Learned the purpose of Glue Logic in digital systems.
- Understood how small RTL blocks can connect incompatible interfaces.
- Learned signal-width adjustment using zero extension.
- Understood Little Endian and Big Endian representations.
- Learned how endian conversion is performed by byte rearrangement.
- Understood byte addressing and byte-enable signals.
- Explored simple data-format conversion.
- Learned the basics of VALID/READY handshaking.
- Understood how Glue Logic is used in real SoC and bus interconnects.

---

## Conclusion

Glue logic plays an important role in digital system integration by adapting differences between modules without changing the internal design of either subsystem. It can perform operations such as **width conversion, endian conversion, byte addressing, data-format conversion, and protocol handshaking**. These small interface-adaptation circuits are fundamental when connecting processors, memories, peripherals, buses, and legacy components in larger FPGA and SoC designs.
