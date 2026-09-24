# Day 39 - Assignment: RAM & ROM Implementation Styles on FPGA

## Objective

Explore different methods of implementing **RAM** and **ROM** on an FPGA and understand how coding style influences hardware inference during synthesis.

Instead of manually instantiating FPGA memories, modern synthesis tools can automatically infer the appropriate memory resource based on the RTL description.

---

## Problem Statement

Study the different coding styles used to implement RAM and ROM in Verilog.

Understand how FPGA synthesis tools infer:

- Distributed RAM
- Block RAM (BRAM)
- Distributed ROM
- Block ROM

Learn when to use each implementation style.

---

# FPGA Memory Overview

```text
                     FPGA Memories

                           │
          ┌────────────────┴────────────────┐
          │                                 │
         RAM                               ROM
          │                                 │
     Read & Write                     Read Only
```

---

# RAM Implementation

RAM allows both reading and writing of data during runtime.

Typical Verilog implementation:

```verilog
reg [15:0] mem [255:0];

always @(posedge clk)
begin
    if(write_enable)
        mem[address] <= data_in;
    else
        data_out <= mem[address];
end
```

### Characteristics

- Supports read and write operations.
- Data can change during execution.
- Usually implemented as synchronous memory.
- Commonly inferred as **Block RAM (BRAM)** for larger memories.

---

# ROM Implementation

ROM stores constant values that never change after initialization.

Typical Verilog implementation:

```verilog
always @(*)
begin
    case(address)
        0 : data = 8'd10;
        1 : data = 8'd20;
        2 : data = 8'd30;
        ...
    endcase
end
```

### Characteristics

- Read-only memory.
- Contents remain constant.
- Suitable for lookup tables (LUTs).
- Can be synthesized as distributed ROM or Block ROM.

---

# Different Coding Styles

## 1. Case Statement ROM

```text
Address
   │
   ▼
Case Statement
   │
   ▼
Constant Output
```

### Advantages

- Very simple.
- Easy to understand.
- Suitable for small lookup tables.

### Applications

- Seven-segment decoders
- Opcode decoders
- Small lookup tables

---

## 2. Memory Array (RAM)

```verilog
reg [7:0] mem [0:255];
```

### Advantages

- Supports both read and write.
- Synthesizer can infer Block RAM automatically.
- Widely used in FPGA designs.

### Applications

- Data Buffers
- FIFOs
- Image Buffers
- Cache Memory

---

## 3. Memory Initialization Using MEM Files

```verilog
initial
begin
    $readmemh("memory.mem", mem);
end
```

### Advantages

- Initializes memory from an external file.
- Simplifies simulation.
- Useful for loading firmware, lookup tables, or test vectors.

### Applications

- Simulation
- Testbenches
- FPGA ROM Initialization

---

## 4. Block Memory Generator (Vivado IP)

```text
Python

      │

Generate COE File

      │

Vivado Block Memory Generator

      │

ROM / RAM

      │

Hardware
```

### Advantages

- Optimized FPGA implementation.
- Supports large memories.
- Uses dedicated Block RAM resources.
- No manual RTL memory implementation required.

### Applications

- Large ROMs
- DSP Lookup Tables
- DDS Waveform Storage
- AI Weight Storage
- Image Processing

---

# Memory Inference

One of the most important concepts in FPGA design is **memory inference**.

The synthesis tool examines the RTL code and automatically decides which FPGA resource should implement the memory.

Example:

```verilog
reg [15:0] mem [255:0];
```

Depending on the memory size and target FPGA, Vivado may infer:

```text
Small Memory

↓

Distributed RAM (LUTs)
```

or

```text
Large Memory

↓

Block RAM (BRAM)
```

This process is completely automatic unless the designer explicitly instantiates a memory IP.

---

# RAM vs ROM

| Feature | RAM | ROM |
|----------|-----|-----|
| Read Operation | ✅ | ✅ |
| Write Operation | ✅ | ❌ |
| Data Changes During Runtime | ✅ | ❌ |
| Requires Clock | Usually Yes | Optional |
| Data Storage | Temporary | Fixed |
| FPGA Resource | Distributed RAM / BRAM | Distributed ROM / Block ROM |

---

# Choosing the Right Implementation

| Coding Style | Best For |
|---------------|----------|
| Case Statement | Small ROMs |
| Memory Array | General-purpose RAM |
| `$readmemh` / `$readmemb` | Memory initialization in simulation |
| COE + Block Memory Generator | Large FPGA ROMs |
| Vivado Block Memory Generator IP | High-performance FPGA memories |

---

# Real-World Applications

### RAM

- FIFO Buffers
- Video Frame Buffers
- Data Logging
- Cache Memory
- Temporary Data Storage

### ROM

- Boot Code
- Lookup Tables
- DDS Waveform Storage
- Character Fonts
- AI/ML Weights
- Image Processing Kernels

---

# Learning Outcome

By studying different RAM and ROM implementation styles, I learned:

- The difference between RAM and ROM.
- How coding style affects FPGA synthesis.
- The concept of memory inference.
- Different methods of implementing memories in Verilog.
- When to use Block RAM, Distributed RAM, and Block Memory Generator IP.
- Practical applications of RAM and ROM in FPGA-based systems.

---

# Tools Used

- Verilog HDL
- Vivado Design Suite
- Vivado Simulator
- GTKWave
- Block Memory Generator IP
