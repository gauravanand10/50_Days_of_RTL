# Day 28 - Pipelining

## Objective

Learn the concept of **Pipelining** in Verilog and understand how dividing a complex operation into multiple stages improves system throughput. Explore how data flows through pipeline registers and understand the trade-off between **latency** and **throughput** in digital systems.

## Design

### 3-Stage Pipeline

Inputs:

- Clock (`clk`)
- Reset (`reset`)
- Input Data (`A`, `B`, `C`, `D`)

Output:

- Result (`result`)

Functionality:

- The arithmetic operation **((A + B) × C) - D** is divided into multiple stages.
- Each stage performs a part of the computation.
- Intermediate results are stored in pipeline registers.
- After the pipeline is filled, one output is produced every clock cycle.

### Pipeline Stages

**Stage 1**

- Compute `A + B`

**Stage 2**

- Multiply `(A + B)` with `C`

**Stage 3**

- Subtract `D`

---

## Flow

1. Learn Pipelining
2. Understand Pipeline Registers
3. Divide Complex Logic into Stages
4. Implement Stage 1
5. Implement Stage 2
6. Implement Stage 3
7. Create Testbench
8. Simulate Pipeline Operation
9. Analyze Waveforms

---

## Learnings

- Pipelining
- Pipeline Registers
- Throughput
- Latency
- Sequential Logic
- Stage-wise Processing
- Data Dependency
- Testbench Development

---

## Key Observation

During simulation:

- The first output appears only after the pipeline is completely filled.
- Once filled, one output is generated every clock cycle.
- Pipelining improves throughput without reducing the execution time of an individual operation.
- Multiple data items are processed simultaneously in different pipeline stages.
- Pipeline registers isolate combinational logic between stages.

---

## Assignment

Implement a **4-stage pipeline** to compute the expression:

```
((A + B) × C) + (D - E)
```

Design a suitable testbench to verify correct pipeline operation and observe how multiple inputs are processed concurrently.

---

## Assignment Design

### 4-Stage Arithmetic Pipeline

Inputs:

- Clock (`clk`)
- Reset (`reset`)
- Operands (`A`, `B`, `C`, `D`, `E`)

Output:

- Final Result (`result`)

Internal Blocks:

- Stage Registers
- Adder
- Multiplier
- Subtractor
- Final Adder

Functionality:

- Divide the arithmetic expression into four independent stages.
- Store intermediate values in pipeline registers.
- Produce one valid output every clock cycle after the pipeline is filled.

---

## Assignment Flow

1. Divide Expression into Pipeline Stages
2. Design Pipeline Registers
3. Implement Arithmetic Units
4. Connect Pipeline Stages
5. Create Testbench
6. Apply Multiple Input Sets
7. Observe Pipeline Filling
8. Verify Continuous Outputs
9. Analyze Waveforms

---

## Assignment Learnings

- Multi-stage Pipeline Design
- Pipeline Registers
- Arithmetic Unit Integration
- Data Flow Optimization
- Throughput Improvement
- Sequential Logic
- Testbench Development
- Waveform Analysis

---

## Key Observation

For continuous input data:

- Multiple operations execute simultaneously in different stages.
- The first result is delayed by the number of pipeline stages.
- Once the pipeline is full, one result is produced every clock cycle.
- Pipeline registers eliminate long combinational paths.
- Increasing the number of stages generally increases the maximum operating frequency.

---

## Comparison: Pipelined vs Non-Pipelined Design

| Feature | Non-Pipelined | Pipelined |
|---------|---------------|-----------|
| Number of Stages | One | Multiple |
| Throughput | Low | High |
| Latency | Lower for Single Input | Higher for First Output |
| Clock Frequency | Lower | Higher |
| Hardware Complexity | Low | Medium |
| Pipeline Registers | Not Required | Required |
| Resource Utilization | Lower | Higher |
| Applications | Simple Designs | CPUs, DSPs, Accelerators |

---

## Conclusion

Pipelining is one of the most important performance optimization techniques in digital design. By dividing a complex operation into smaller stages separated by pipeline registers, multiple inputs can be processed simultaneously, significantly improving throughput. Although the first output is delayed due to pipeline filling, pipelined architectures achieve much higher performance and are widely used in processors, DSP systems, AI accelerators, and high-speed digital circuits.
