# Day 32 - Fractional Clock Dividers

## Objective

Learn the concept of **Fractional Clock Dividers** and understand how
non-integer frequency division can be achieved in digital systems.
Explore the generation of clock signals whose frequencies are fractional
multiples of the input clock and understand the role of **MMCMs and
PLLs** in clock generation, frequency synthesis, and phase management
using Vivado.

------------------------------------------------------------------------

## Design

### Fractional Clock Divider

A fractional clock divider generates an output clock whose frequency is
not necessarily an integer division of the input clock.

Unlike a simple integer clock divider:

``` text
Fout = Fin / N
```

a fractional divider can generate frequencies corresponding to
non-integer division factors.

For example:

``` text
Fout = Fin / 2.5
```

This requires the divider to alternate between different division
intervals instead of using one fixed integer count.

------------------------------------------------------------------------

### Divide-by-2 and Divide-by-3 Pattern

The fractional division concept can be understood by alternating the
number of input clock cycles used for output transitions.

For example:

``` text
2 cycles
3 cycles
2 cycles
3 cycles
...
```

The average division factor becomes:

``` text
Average Division = (2 + 3) / 2
                 = 2.5
```

Therefore:

``` text
Fout ≈ Fin / 2.5
```

This technique allows generation of a frequency that cannot be obtained
using a simple integer counter alone.

------------------------------------------------------------------------

## MMCM and PLL

FPGAs contain dedicated clock-management resources that can generate
different clock frequencies from an input clock.

Two important clock-management resources are:

-   **PLL - Phase-Locked Loop**
-   **MMCM - Mixed-Mode Clock Manager**

They can perform:

-   Frequency multiplication
-   Frequency division
-   Phase shifting
-   Clock synthesis
-   Clock management

------------------------------------------------------------------------

## Clocking Wizard

Vivado provides the **Clocking Wizard IP** to configure MMCM or PLL
resources without manually writing the primitive configuration.

The basic flow is:

``` text
Input Clock
     |
     v
Clocking Wizard
     |
     +----> MMCM / PLL
     |
     v
Output Clock
```

------------------------------------------------------------------------

## Vivado Configuration

For the practical implementation:

### Input Clock

``` text
Input Frequency = 100 MHz
```

### Clocking Primitive

``` text
MMCM
```

### Output Clock

``` text
Output Frequency = 40 MHz
```

The Clocking Wizard automatically calculates suitable multiplication and
division parameters.

The generated configuration therefore performs:

``` text
100 MHz → MMCM → 40 MHz
```

------------------------------------------------------------------------

## Generated Clocking Parameters

The configured MMCM uses parameters similar to:

``` text
CLKFBOUT_MULT_F = 10
DIVCLK_DIVIDE   = 1
CLKOUT0_DIVIDE  = 25
```

The resulting frequency is:

``` text
Fout = Fin × (M / D) / O

     = 100 × (10 / 1) / 25

     = 40 MHz
```

Therefore:

``` text
100 MHz → MMCM → 40 MHz
```

------------------------------------------------------------------------

## `locked` Signal

The Clocking Wizard provides a `locked` signal.

This signal indicates that the MMCM/PLL has successfully achieved stable
clock operation.

``` text
locked = 0
    |
    | Clock is stabilizing
    v
locked = 1
    |
    v
Stable output clock
```

The `locked` signal can therefore be used by the rest of the design to
determine when the generated clock is ready for use.

------------------------------------------------------------------------

## Flow

1.  Learn Clock Division
2.  Understand Integer Clock Dividers
3.  Understand Fractional Division
4.  Study Divide-by-2 and Divide-by-3 Patterns
5.  Understand Average Division Factor
6.  Learn PLL and MMCM
7.  Open Vivado Clocking Wizard
8.  Select MMCM
9.  Configure Input Clock
10. Configure Output Frequency
11. Generate Clocking Wizard IP
12. Analyze Generated RTL
13. Observe the Block Diagram
14. Analyze the Generated Clock

------------------------------------------------------------------------

## Learnings

-   Fractional Clock Division
-   Integer Clock Division
-   Divide-by-2
-   Divide-by-3
-   Average Division Factor
-   Duty Cycle Considerations
-   PLL
-   MMCM
-   Frequency Synthesis
-   Phase Management
-   Clocking Wizard
-   Clock Generation
-   `locked` Signal
-   Vivado IP Configuration

------------------------------------------------------------------------

## Key Observation

During the fractional clock-divider study:

-   A simple integer counter cannot directly generate every arbitrary
    frequency ratio.
-   Fractional division can be achieved by alternating between different
    division intervals.
-   Alternating divide-by-2 and divide-by-3 intervals produces an
    average division factor of 2.5.
-   Fractional division may introduce duty-cycle variations depending on
    the implementation.

During the Vivado Clocking Wizard implementation:

-   A 100 MHz input clock was configured.
-   An MMCM was selected as the clocking primitive.
-   The output frequency was configured to 40 MHz.
-   Vivado automatically generated the required MMCM configuration.
-   The generated IP provides a `locked` signal to indicate stable clock
    generation.

------------------------------------------------------------------------

## Assignment

Configure an **MMCM or PLL using the Vivado Clocking Wizard** to
generate a required output clock from a given input clock.

The assignment focuses on understanding how FPGA clock-management
resources are configured for **frequency synthesis and clock
generation**.

------------------------------------------------------------------------

## Assignment Design

### Clock Generation Using MMCM

Input:

``` text
100 MHz Clock
```

Clock Management Resource:

``` text
MMCM
```

Output:

``` text
40 MHz Clock
```

The Clocking Wizard performs the required frequency synthesis using
multiplication and division parameters.

------------------------------------------------------------------------

## Assignment Flow

1.  Create Vivado Project
2.  Open IP Catalog
3.  Select Clocking Wizard
4.  Configure Input Clock
5.  Select MMCM
6.  Configure Output Frequency
7.  Generate IP
8.  Generate Output Products
9.  Inspect Generated RTL
10. Analyze Block Diagram
11. Verify Clock Output
12. Observe `locked` Signal

------------------------------------------------------------------------

## Assignment Learnings

-   Vivado Clocking Wizard
-   MMCM Configuration
-   PLL Configuration
-   Frequency Synthesis
-   Clock Multiplication
-   Clock Division
-   Generated IP
-   Clock Stability
-   `locked` Signal
-   FPGA Clock Management

------------------------------------------------------------------------

## Comparison: Integer vs Fractional Clock Division

  Feature                 Integer Clock Divider   Fractional Clock Divider
  ----------------------- ----------------------- --------------------------------
  Division Factor         Integer                 Non-integer possible
  Implementation          Fixed Counter           Alternating Division Intervals
  Example                 ÷2, ÷4, ÷8              ÷2.5
  Duty Cycle              Easier to control       Can vary
  Hardware Complexity     Low                     Higher
  Frequency Flexibility   Limited                 Higher

------------------------------------------------------------------------

## Comparison: PLL vs MMCM

  Feature                 PLL                MMCM
  ----------------------- ------------------ ---------------------------
  Frequency Synthesis     Yes                Yes
  Clock Multiplication    Yes                Yes
  Clock Division          Yes                Yes
  Phase Control           Yes                More Advanced
  Fine Phase Adjustment   Limited            Better
  Typical FPGA Use        Clock Generation   Advanced Clock Management

------------------------------------------------------------------------

## Applications

-   I²C Clock Generation
-   UART Clock Generation
-   SPI Clock Generation
-   Communication Interfaces
-   Frequency Synthesis
-   FPGA Clock Management
-   Digital Signal Processing
-   Video Processing
-   Processor Clock Generation

------------------------------------------------------------------------

## Interview Questions

### 1. What is a fractional clock divider?

A fractional clock divider generates an output frequency corresponding
to a non-integer division factor by varying the division interval over
time.

### 2. How can divide-by-2 and divide-by-3 intervals produce divide-by-2.5?

By alternating between 2-cycle and 3-cycle intervals:

``` text
Average Division = (2 + 3) / 2 = 2.5
```

Therefore:

``` text
Fout ≈ Fin / 2.5
```

### 3. What is an MMCM?

MMCM stands for **Mixed-Mode Clock Manager**. It is a dedicated FPGA
clock-management resource used for frequency synthesis, clock division,
multiplication, and phase control.

### 4. What is a PLL?

PLL stands for **Phase-Locked Loop**. It is a clock-management circuit
that generates synchronized clocks using feedback and frequency
multiplication/division.

### 5. Why use Clocking Wizard instead of manually instantiating an MMCM?

The Clocking Wizard automatically calculates valid MMCM/PLL parameters
and generates the required RTL and supporting logic, reducing
configuration errors.

### 6. What does the `locked` signal indicate?

The `locked` signal indicates that the MMCM or PLL has achieved stable
operation and that the generated output clock is ready to be used.

### 7. Can a normal counter generate every fractional frequency?

No. A simple counter is naturally suited to integer division. Fractional
division requires varying the division interval or using dedicated
clock-management hardware such as an MMCM/PLL.

------------------------------------------------------------------------

## Key Takeaways

-   Learned how clock frequencies can be divided using sequential logic.
-   Understood the concept of fractional clock division.
-   Learned how alternating divide-by-2 and divide-by-3 intervals can
    produce an average divide-by-2.5 behavior.
-   Understood the limitations of simple integer clock dividers.
-   Learned the role of PLLs and MMCMs in FPGA clock management.
-   Configured an MMCM using Vivado Clocking Wizard.
-   Generated a 40 MHz clock from a 100 MHz input clock.
-   Learned the importance of the `locked` signal for stable clock
    generation.

------------------------------------------------------------------------

## Conclusion

Fractional clock division provides greater flexibility than conventional
integer clock dividers by allowing non-integer frequency ratios through
varying division intervals. For FPGA designs requiring accurate and
stable clock synthesis, dedicated resources such as **MMCMs and PLLs**
are preferred. Vivado's Clocking Wizard simplifies their configuration
and automatically generates the required clock-management logic.
