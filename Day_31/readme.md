# Day 31 - Clock Dividers

## Objective

Learn the concept of **Clock Dividers** in Verilog by implementing frequency division circuits. Understand how high-frequency clocks can be divided into lower-frequency clocks using counters and sequential logic. Explore the implementation of **Divide-by-2**, **Divide-by-3**, and **Divide-by-4** clock dividers along with their timing characteristics and duty-cycle considerations.

---

## Design

### Clock Divider by 2

Inputs:

- Clock (`clk`)
- Reset (`reset`)

Outputs:

- Divided Clock (`clk_out`)

Functionality:

- Toggles the output clock on every rising edge of the input clock.
- Produces an output frequency equal to half of the input frequency.
- Generates a 50% duty cycle.

---

### Clock Divider by 4

Inputs:

- Clock (`clk`)
- Reset (`reset`)

Outputs:

- Divided Clock (`clk_out`)

Functionality:

- Uses a 2-bit counter.
- Toggles the output after every two input clock cycles.
- Produces one complete output cycle every four input clock cycles.
- Maintains a 50% duty cycle.

---

### Clock Divider by 3

Inputs:

- Clock (`clk`)
- Reset (`reset`)

Outputs:

- Divided Clock (`clk_out`)

Functionality:

- Uses a modulo-3 counter.
- Alternates between one clock cycle HIGH and two clock cycles LOW, followed by two clock cycles HIGH and one clock cycle LOW.
- Produces an average frequency of one-third the input clock.
- Demonstrates the difficulty of achieving an exact 50% duty cycle for odd clock division.

---

## Flow

1. Learn Clock Division
2. Understand Frequency Division
3. Implement Divide-by-2 Clock
4. Implement Divide-by-4 Clock
5. Implement Divide-by-3 Clock
6. Generate Lower Frequency Clock
7. Create Testbench
8. Analyze Waveforms

---

## Learnings

- Clock Division
- Frequency Scaling
- Sequential Logic
- Counter-Based Design
- Clock Toggling
- Even Clock Division
- Odd Clock Division
- Duty Cycle
- Testbench Development

---

## Key Observation

During simulation:

- Divide-by-2 toggles the output every input clock cycle.
- Divide-by-4 toggles the output every two input clock cycles.
- Divide-by-4 produces one complete clock cycle after four input clock cycles.
- Divide-by-3 cannot generate a perfect 50% duty cycle using a simple counter.
- Odd clock division requires additional logic compared to even clock division.

---

## Assignment

Generate a **400 kHz clock** from a **50 MHz** input clock, commonly used in **I²C communication**.

---

## Assignment Design

### 50 MHz to 400 kHz Clock Divider

Inputs:

- Clock (`clk`)
- Reset (`reset`)

Outputs:

- 400 kHz Clock (`clk_out`)

Internal Blocks:

- Counter
- Comparator
- Toggle Flip-Flop

Functionality:

- Count incoming 50 MHz clock cycles.
- Toggle the output after reaching the required count.
- Generate a stable 400 kHz output clock.
- Maintain a near 50% duty cycle.

---

## Assignment Flow

1. Determine Input Clock Frequency
2. Calculate Required Division Factor
3. Initialize Counter
4. Count Input Clock Cycles
5. Toggle Output Clock
6. Reset Counter
7. Repeat Continuously
8. Create Testbench
9. Verify Output Frequency

---

## Assignment Learnings

- Frequency Division Calculation
- Counter-Based Clock Generation
- Clock Toggling
- Comparator Logic
- Timing Analysis
- RTL Design
- Testbench Development
- Waveform Analysis

---

## Key Observation

During simulation:

- The counter continuously counts the incoming 50 MHz clock.
- The output clock toggles after the calculated number of clock cycles.
- One complete output cycle corresponds to approximately 400 kHz.
- Counter resets automatically after each toggle.
- Stable frequency generation is achieved using sequential logic.

---

## Comparison: Divide-by-2 vs Divide-by-3 vs Divide-by-4

| Feature | Divide-by-2 | Divide-by-3 | Divide-by-4 |
|---------|-------------|-------------|-------------|
| Counter Required | No | Yes | Yes |
| Toggle Interval | Every Clock | Variable | Every 2 Clocks |
| Frequency | Fin / 2 | Fin / 3 | Fin / 4 |
| Duty Cycle | 50% | Approximate | 50% |
| Complexity | Low | Medium | Low |
| Hardware Cost | Very Low | Medium | Low |

---

## Comparison: Even vs Odd Clock Division

| Feature | Even Divider | Odd Divider |
|---------|--------------|-------------|
| Duty Cycle | Easily 50% | Difficult to achieve 50% |
| Counter Logic | Simple | More Complex |
| Toggle Pattern | Uniform | Non-uniform |
| Hardware Complexity | Low | Medium |
| Examples | ÷2, ÷4, ÷8 | ÷3, ÷5, ÷7 |

---

## Applications

- UART Baud Rate Generators
- SPI Clock Generation
- I²C Clock Generation
- PWM Controllers
- Digital Clocks
- Frequency Synthesizers
- FPGA Clock Management
- Embedded Systems

---

## Conclusion

Clock dividers are fundamental sequential circuits used to generate lower-frequency clocks from a single high-frequency source. Even clock division can easily achieve a 50% duty cycle using simple counters and toggle logic, whereas odd clock division requires additional design considerations due to unequal high and low durations. Understanding clock dividers is essential for designing communication interfaces, timers, digital clocks, and FPGA-based systems where multiple clock domains are required.
