# Day 43 -- Mathematical Operations: Multiplication and Booth Multiplier

## Overview

Day 43 of the **50 Days of RTL Challenge** explores how mathematical
operations are represented in digital hardware, with a focus on binary
multiplication, signed and unsigned numbers, and the Booth
multiplication algorithm.

The day contains two designs:

1.  **Class Code:** a simple 4-bit unsigned multiplier using Verilog's
    multiplication operator (`*`).
2.  **Assignment:** a 4-bit signed multiplier with an 8-bit signed
    product.

> **Important distinction:** The assignment RTL below uses Verilog's `*`
> operator to demonstrate signed multiplication. It does **not**
> explicitly implement the Booth algorithm. If the requirement is to
> demonstrate the internal Booth algorithm itself, use an algorithmic
> Booth implementation with the accumulator, multiplier register,
> previous-bit register, arithmetic shifts, and iteration control.

------------------------------------------------------------------------

## Learning Objectives

-   Understand how binary multiplication is performed in digital
    hardware.
-   Distinguish signed two's-complement values from unsigned values.
-   Select an appropriate output width for multiplication.
-   Understand the role of FPGA DSP blocks and LUT-based logic.
-   Learn the basic idea behind Booth multiplication.
-   Write synthesizable Verilog and verify it using a testbench.
-   Generate `wave.vcd` for inspection in GTKWave.

------------------------------------------------------------------------

## Directory Structure

``` text
Day_43/
├── README.md
├── Class_Code/
│   ├── multiplier_4bit.v
│   └── tb_multiplier_4bit.v
├── Assignment/
│   ├── booth_multiplier_4bit.v
│   └── tb_booth_multiplier_4bit.v
└── Waveform/
    └── wave.vcd
```

The generated `wave.vcd` is created when the testbench runs. Save or
move it into `Waveform/` if you want to keep waveforms separate from
source files.

------------------------------------------------------------------------

## 1. Theory: Binary Multiplication

Binary multiplication follows the same general idea as decimal
multiplication. Each multiplier bit determines whether a shifted copy of
the multiplicand contributes to the result.

For example:

``` text
  0011   (3)
× 0010   (2)
------
  0000
 0110
------
 0110   (6)
```

A hardware multiplier can be implemented in several ways. The synthesis
tool may map a multiplication expression to dedicated FPGA DSP resources
or construct logic from LUTs and adders, depending on the device,
constraints, and synthesis settings.

### Common multiplier approaches

  -----------------------------------------------------------------------
  Approach                Basic idea              Typical trade-off
  ----------------------- ----------------------- -----------------------
  Built-in `*` operator   Describe multiplication Simple RTL; synthesis
                          behaviorally            tool chooses
                                                  implementation

  Shift-and-add           Shift and conditionally Can use modest
                          add partial products    hardware, but iterative
                                                  versions take multiple
                                                  cycles

  Array multiplier        Generate and combine    Regular layout, but can
                          partial products in a   require substantial
                          regular structure       logic

  Booth multiplier        Recodes multiplier bits Useful for signed
                          to reduce/add-subtract  multiplication and
                          partial products        reducing
                                                  partial-product count

  Wallace/Dadda tree      Compress partial        Often used for
                          products using adder    high-performance
                          trees                   multiplier structures
  -----------------------------------------------------------------------

No algorithm is universally best: the choice depends on timing, area,
power, operand width, and the target technology.

------------------------------------------------------------------------

## 2. Signed vs. Unsigned Numbers

A 4-bit **unsigned** number ranges from 0 to 15. A 4-bit **signed
two's-complement** number ranges from -8 to +7.

  4-bit pattern     Unsigned interpretation   Signed interpretation
  --------------- ------------------------- -----------------------
  `0000`                                  0                       0
  `0001`                                  1                       1
  `0111`                                  7                       7
  `1000`                                  8                      -8
  `1110`                                 14                      -2
  `1111`                                 15                      -1

The bit pattern itself does not change. Its numeric meaning depends on
whether the signal is declared or treated as signed.

### Verilog declarations

``` verilog
input      [3:0] a;  // unsigned
input signed [3:0] b;  // signed
```

For signed multiplication, declare both operands and the product as
signed:

``` verilog
input  signed [3:0] multiplicand;
input  signed [3:0] multiplier;
output signed [7:0] product;
```

### Why is the product 8 bits?

The full product of two 4-bit operands may require 8 bits. For signed
4-bit inputs, the operand range is -8 through +7, so the product range
is -56 through +64. An 8-bit two's-complement result can represent -128
through +127.

------------------------------------------------------------------------

## 3. Booth Multiplication: Core Idea

Booth's algorithm is a method for multiplying signed binary numbers
represented in two's complement. The classic radix-2 algorithm examines
the pair consisting of the current least-significant multiplier bit `Q0`
and the previous bit `Q-1`.

  `Q0 Q-1`   Operation
  ---------- ------------------------------------------------
  `00`       No add/subtract operation
  `01`       Add the multiplicand to the accumulator
  `10`       Subtract the multiplicand from the accumulator
  `11`       No add/subtract operation

After the selected operation, the combined accumulator/multiplier state
is shifted arithmetically right. The process repeats for the operand
width.

An arithmetic right shift preserves the sign bit. A sequential Booth
design typically uses an accumulator (`A`), multiplicand (`M`),
multiplier (`Q`), previous bit (`Q-1`), and iteration counter/control
logic.

------------------------------------------------------------------------

# Part A --- Class Code: 4-bit Unsigned Multiplier

## Design description

This introductory design multiplies two unsigned 4-bit inputs and
produces an 8-bit product. It uses the Verilog `*` operator, allowing
the synthesis tool to infer an appropriate multiplier implementation.

### RTL: `Class_Code/multiplier_4bit.v`

``` verilog
module multiplier_4bit (
    input  [3:0] a,
    input  [3:0] b,
    output [7:0] product
);

assign product = a * b;

endmodule
```

### Testbench: `Class_Code/tb_multiplier_4bit.v`

``` verilog
`timescale 1ns/1ps

module tb_multiplier_4bit;

    reg  [3:0] a;
    reg  [3:0] b;
    wire [7:0] product;

    multiplier_4bit uut (
        .a(a),
        .b(b),
        .product(product)
    );

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb_multiplier_4bit);

        $display("--------------------------------");
        $display("  A    B    Product");
        $display("--------------------------------");

        a = 4'd2;  b = 4'd3;  #10;
        $display("%2d   %2d      %3d", a, b, product);

        a = 4'd5;  b = 4'd4;  #10;
        $display("%2d   %2d      %3d", a, b, product);

        a = 4'd7;  b = 4'd6;  #10;
        $display("%2d   %2d      %3d", a, b, product);

        a = 4'd10; b = 4'd5;  #10;
        $display("%2d   %2d      %3d", a, b, product);

        a = 4'd15; b = 4'd15; #10;
        $display("%2d   %2d      %3d", a, b, product);

        $display("--------------------------------");
        $finish;
    end

endmodule
```

### Expected class-code results

     A    B   Product
  ---- ---- ---------
     2    3         6
     5    4        20
     7    6        42
    10    5        50
    15   15       225

### Class-code observation

The design is combinational: when either input changes, the product
updates after the simulator's combinational evaluation. There is no
clock or internal state.

------------------------------------------------------------------------

# Part B --- Assignment: 4-bit Signed Multiplier

## Design description

The assignment specifies two signed 4-bit inputs and an 8-bit signed
output. The implementation below demonstrates correct signed
multiplication in a compact, synthesizable form.

### RTL: `Assignment/booth_multiplier_4bit.v`

``` verilog
module booth_multiplier_4bit (
    input  signed [3:0] multiplicand,
    input  signed [3:0] multiplier,
    output signed [7:0] product
);

assign product = multiplicand * multiplier;

endmodule
```

### Testbench: `Assignment/tb_booth_multiplier_4bit.v`

``` verilog
`timescale 1ns/1ps

module tb_booth_multiplier_4bit;

    reg signed [3:0] multiplicand;
    reg signed [3:0] multiplier;
    wire signed [7:0] product;

    booth_multiplier_4bit uut (
        .multiplicand(multiplicand),
        .multiplier(multiplier),
        .product(product)
    );

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb_booth_multiplier_4bit);

        $display("---------------------------------------------");
        $display(" Multiplicand  Multiplier  Product");
        $display("---------------------------------------------");

        multiplicand =  4'sd3;  multiplier =  4'sd2;  #10;
        $display("%6d        %6d      %6d", multiplicand, multiplier, product);

        multiplicand = -4'sd3;  multiplier =  4'sd2;  #10;
        $display("%6d        %6d      %6d", multiplicand, multiplier, product);

        multiplicand =  4'sd5;  multiplier = -4'sd2;  #10;
        $display("%6d        %6d      %6d", multiplicand, multiplier, product);

        multiplicand = -4'sd4;  multiplier = -4'sd2;  #10;
        $display("%6d        %6d      %6d", multiplicand, multiplier, product);

        multiplicand =  4'sd7;  multiplier =  4'sd7;  #10;
        $display("%6d        %6d      %6d", multiplicand, multiplier, product);

        multiplicand = -4'sd8;  multiplier =  4'sd7;  #10;
        $display("%6d        %6d      %6d", multiplicand, multiplier, product);

        multiplicand = -4'sd8;  multiplier = -4'sd8;  #10;
        $display("%6d        %6d      %6d", multiplicand, multiplier, product);

        $display("---------------------------------------------");
        $finish;
    end

endmodule
```

### Expected assignment results

    Multiplicand   Multiplier   Expected signed product
  -------------- ------------ -------------------------
               3            2                         6
              -3            2                        -6
               5           -2                       -10
              -4           -2                         8
               7            7                        49
              -8            7                       -56
              -8           -8                        64

### Important implementation note

Although the module is named `booth_multiplier_4bit`, the RTL above
describes multiplication using `*`; it does **not** explicitly implement
Booth's recoding steps. This is fine for practicing signed
multiplication, but if the instructor expects an actual Booth algorithm
implementation, the assignment should be upgraded to an explicit Booth
datapath.

------------------------------------------------------------------------

## 4. Simulation Workflow

Run the class design from the `Class_Code` directory:

``` bash
iverilog -o sim multiplier_4bit.v tb_multiplier_4bit.v
vvp sim
gtkwave wave.vcd
```

Run the assignment from the `Assignment` directory:

``` bash
iverilog -o sim booth_multiplier_4bit.v tb_booth_multiplier_4bit.v
vvp sim
gtkwave wave.vcd
```

If you run both simulations in the same directory, each testbench writes
a file named `wave.vcd`, so the second run can overwrite the first
waveform. Run them in separate directories or move/rename the waveform
after each run.

### GTKWave signals to inspect

-   `a`, `b`, `product` for the class design.
-   `multiplicand`, `multiplier`, `product` for the signed assignment.
-   Verify the output after each input update.
-   For negative values, check the product's signed decimal
    interpretation as well as its binary representation.

------------------------------------------------------------------------

## 5. Class Code vs. Assignment

  -----------------------------------------------------------------------
  Feature                 Class: Unsigned         Assignment: Signed
                          Multiplier              Multiplier
  ----------------------- ----------------------- -----------------------
  Operand width           4 bits each             4 bits each

  Operand interpretation  Unsigned                Signed two's complement

  Input range             0 to 15                 -8 to +7

  Output width            8 bits                  8 bits

  RTL operator            `*`                     `*`

  Clock required          No                      No

  Main learning goal      Basic multiplication    Signed arithmetic and
                                                  number representation

  Explicit Booth          No                      No, not in the compact
  algorithm                                       RTL shown
  -----------------------------------------------------------------------

------------------------------------------------------------------------

## 6. Applications

Multiplication hardware is used in:

-   Digital signal processing (DSP)
-   FIR/IIR filters and image processing
-   Neural-network and matrix-multiplication accelerators
-   CPU arithmetic logic units
-   Fixed-point arithmetic
-   Graphics and audio processing

------------------------------------------------------------------------

## 7. Common Mistakes

1.  **Forgetting `signed`:** A bit pattern such as `4'b1110` is 14 when
    unsigned and -2 when interpreted as signed two's complement.
2.  **Using an undersized product:** A full 4-bit by 4-bit product
    should be represented with 8 bits.
3.  **Confusing the operator with the algorithm:** `a * b` describes
    multiplication behavior; it does not prove that the synthesized
    hardware uses Booth multiplication.
4.  **Expecting a clocked waveform:** These multiplier examples are
    combinational and have no clock input.
5.  **Overwriting `wave.vcd`:** Running multiple testbenches in the same
    directory may replace the waveform from the previous simulation.

------------------------------------------------------------------------

## 8. Interview Questions

**Q1. What is the difference between signed and unsigned numbers?**

Unsigned numbers represent zero and positive values. Signed
two's-complement numbers represent both negative and non-negative
values. For 4 bits, their ranges are 0 to 15 and -8 to +7, respectively.

**Q2. Why is an 8-bit output used for a 4-bit multiplier?**

The full product can require up to 8 bits. For example, the unsigned
maximum is 15 × 15 = 225, and the signed minimum-times-minimum case is
(-8) × (-8) = 64.

**Q3. What is Booth multiplication?**

It is a signed binary multiplication technique that examines adjacent
multiplier bits to choose between adding, subtracting, or doing nothing
before an arithmetic shift.

**Q4. What does `>>>` do in a Booth implementation?**

An arithmetic right shift preserves the sign bit of a signed value,
which is important when shifting two's-complement intermediate values.

**Q5. Does writing `a * b` guarantee a Booth multiplier?**

No. It specifies the multiplication operation. The synthesis tool
chooses a hardware implementation based on the target device and
optimization settings.

**Q6. Is this multiplier sequential?**

No. Both designs shown here are combinational. A sequential Booth
multiplier normally performs one iteration per clock cycle and needs
state registers and control logic.

------------------------------------------------------------------------

## 9. Key Takeaways

-   Binary multiplication can be expressed behaviorally or built from
    partial products and adders.
-   Signedness changes how a bit pattern is interpreted.
-   Use appropriately sized outputs to preserve the full product.
-   FPGA synthesis tools may map multiplication into DSP blocks or
    fabric logic.
-   Booth multiplication uses recoding and arithmetic shifts to handle
    signed multiplication efficiently.
-   Always distinguish a behavioral `*` multiplier from an RTL
    implementation of the Booth algorithm itself.

## Conclusion

Day 43 introduces the RTL representation of multiplication and the
importance of signed versus unsigned arithmetic. The class multiplier
establishes the basics, while the signed assignment verifies positive
and negative operand cases. The next step for a strict Booth-algorithm
requirement is to implement the algorithm explicitly and verify each
iteration in the waveform.
