# Day 38 - Assignment: Random ROM Initialization Using COE & MEM Files

## Objective

Understand the purpose of **COE** and **MEM** file formats used in FPGA development and simulation.

Generate a random **COE** file to initialize a Block ROM, access random memory locations, and verify the ROM contents by comparing the output with the expected (golden) data.

---

## Problem Statement

Create a random **COE** file containing ROM initialization data.

Initialize a **Block Memory Generator (ROM)** using the generated COE file.

Generate random addresses, read the corresponding ROM data, and compare it against the expected (golden) data to verify correct memory initialization.

---

## Assignment Workflow

```text
Random Data Generation
          │
          ▼
Generate COE File
          │
          ▼
Initialize Block ROM
          │
          ▼
Generate Random Address
          │
          ▼
Read ROM Data
          │
          ▼
Compare with Golden Data
          │
          ▼
PASS / FAIL
```

---

# Understanding COE and MEM Files

Both **COE** and **MEM** files are used to initialize memories, but they are used in different stages of FPGA development.

| Feature | COE File | MEM File |
|----------|----------|----------|
| Full Form | Coefficient File | Memory Initialization File |
| Purpose | Initializes Block RAM/ROM IP | Initializes memory arrays during simulation |
| Used By | Vivado Block Memory Generator | Verilog (`$readmemh`, `$readmemb`) |
| Header Required | Yes | No |
| Used During | FPGA IP Generation | Simulation & Verification |
| Data Format | Initialization vector | Raw memory values |

---

## COE File Format

A COE file contains both the radix information and the memory initialization data.

Example:

```text
memory_initialization_radix=10;
memory_initialization_vector=
91,
14,
203,
55,
178,
39,
255;
```

Vivado reads this file while generating the Block Memory IP and stores these values permanently inside the ROM.

---

## MEM File Format

A MEM file contains only memory values without any header information.

Example (Hexadecimal)

```text
5B
0E
CB
37
B2
27
FF
```

Example (Binary)

```text
01011011
00001110
11001011
00110111
10110010
00100111
11111111
```

MEM files are commonly loaded in Verilog using:

```verilog
$readmemh("memory.mem", mem);
```

or

```verilog
$readmemb("memory.mem", mem);
```

where

- `$readmemh` reads hexadecimal values.
- `$readmemb` reads binary values.

---

# Step 1 – Generate Random Data

Random 8-bit values are generated using a scripting language such as Python.

Example

```text
91
14
203
55
178
39
12
255
```

These values represent the contents that will be stored inside the ROM.

---

# Step 2 – Generate the COE File

The generated random values are written into a COE file.

Example

```text
memory_initialization_radix=10;
memory_initialization_vector=
91,
14,
203,
55,
178,
39,
12,
255;
```

This file is later supplied to the Vivado Block Memory Generator.

---

# Step 3 – Initialize the ROM

The Block Memory Generator reads the COE file and initializes every memory location.

Example ROM contents

| Address | Data |
|---------:|-----:|
| 0 | 91 |
| 1 | 14 |
| 2 | 203 |
| 3 | 55 |
| 4 | 178 |
| 5 | 39 |
| 6 | 12 |
| 7 | 255 |

Each address permanently stores the corresponding value from the COE file.

---

# Step 4 – Generate Random Addresses

Instead of reading the memory sequentially, random addresses are generated.

Example

```text
Address = 2
```

ROM Output

```text
203
```

Another example

```text
Address = 5
```

ROM Output

```text
39
```

Random address generation helps verify that every memory location has been initialized correctly.

---

# Step 5 – Golden Data Comparison

The verification environment already knows the expected value stored at every address.

Suppose

```text
Address = 2
```

Expected Data

```text
203
```

ROM Output

```text
203
```

Result

```text
PASS
```

Another example

```text
Address = 5
```

Expected Data

```text
39
```

ROM Output

```text
39
```

Again

```text
PASS
```

If the ROM output differs from the expected value

```text
Expected Data = 178

ROM Output = 181
```

Result

```text
FAIL
```

This process is known as **Golden Reference Verification**.

---

# Why Use a Golden Reference?

A golden reference is the known correct data used to verify the output of a hardware design.

Instead of manually checking every memory location, the simulator automatically compares

```text
Expected Data

↓

Actual ROM Output

↓

PASS / FAIL
```

This is one of the most widely used verification techniques in FPGA and ASIC design.

---

# Difference Between COE and MEM in This Assignment

```text
             Python

                │
                ▼

        Random Data Generation

                │
                ▼

          Generate COE File

                │
                ▼

      Vivado Block Memory Generator

                │
                ▼

              Block ROM

                │
                ▼

        Read Random Addresses

                │
                ▼

           ROM Output

                ▲
                │

      MEM File / Golden Data

                │
                ▼

          PASS / FAIL
```

- **COE File** initializes the ROM contents.
- **MEM File** can be used during simulation as the golden reference.
- The ROM output is compared against the MEM contents to verify correct operation.

---

# Applications

- ROM Initialization
- Lookup Tables (LUTs)
- Direct Digital Synthesis (DDS)
- Image Processing Lookup Tables
- DSP Coefficient Storage
- AI/ML Weight Storage
- FPGA Verification
- ASIC Verification

---

# Key Learnings

- Learned the purpose of **COE** and **MEM** file formats.
- Understood how COE files initialize Block ROMs in Vivado.
- Learned how MEM files are loaded using `$readmemh` and `$readmemb`.
- Understood random address-based ROM verification.
- Learned the concept of **Golden Reference Comparison**.
- Explored a common FPGA verification workflow used in industry.

---

# Tools Used

- Python
- Vivado Block Memory Generator
- Verilog HDL
- Vivado Simulator
- COE File
- MEM File
