# Day 27 - Arbiters

## Objective

Learn the concept of **Arbiters** in Verilog and understand how digital systems resolve conflicts when multiple requesters attempt to access a shared resource simultaneously. Explore the implementation of **Priority Arbiter** and **Round Robin Arbiter**, and understand their advantages, limitations, and applications.

## Design

### Priority Arbiter

Inputs:

- Request Signals (`req[3:0]`)

Output:

- Grant Signals (`grant[3:0]`)

Functionality:

- Assigns the shared resource to the highest-priority active request.
- Lower-priority requests must wait until higher-priority requests are serviced.
- Priority is fixed and does not change.

### Round Robin Arbiter

Inputs:

- Clock (`clk`)
- Reset (`reset`)
- Request Signals (`req[3:0]`)

Output:

- Grant Signals (`grant[3:0]`)

Functionality:

- Assigns the shared resource in a circular order.
- Every requester gets an equal opportunity to access the resource.
- Prevents starvation by rotating the priority after every successful grant.

## Flow

1. Learn Arbitration
2. Understand Resource Contention
3. Design a Priority Arbiter
4. Design a Round Robin Arbiter
5. Create Testbench
6. Apply Multiple Requests
7. Observe Grant Signals
8. Compare Arbitration Schemes
9. Analyze Waveforms

## Learnings

- Arbitration
- Resource Sharing
- Priority Arbitration
- Round Robin Arbitration
- Fairness
- Starvation
- Sequential Logic
- Testbench Development

## Key Observation

During simulation:

- Priority Arbiter always grants the highest-priority active request.
- Lower-priority requests may experience starvation if higher-priority requests remain active.
- Round Robin Arbiter rotates the priority after each grant.
- Every requester eventually receives access to the shared resource.
- Arbitration ensures that only one requester is granted access at any given time.

## Assignment

Compare **Priority Arbiter** and **Round Robin Arbiter** by implementing both designs and verifying their behavior under different request patterns. Observe how each arbitration scheme handles fairness and starvation.

## Assignment Design

### Arbitration Comparison

Inputs:

- Clock (`clk`)
- Reset (`reset`)
- Request Signals (`req[3:0]`)

Outputs:

- Priority Grant (`priority_grant[3:0]`)
- Round Robin Grant (`rr_grant[3:0]`)

Internal Blocks:

- Priority Arbiter
- Round Robin Arbiter

Functionality:

- Apply identical request patterns to both arbiters.
- Compare grant outputs.
- Observe fairness and starvation behavior.

## Assignment Flow

1. Design Priority Arbiter
2. Design Round Robin Arbiter
3. Create Testbench
4. Apply Different Request Patterns
5. Observe Grant Outputs
6. Compare Arbitration Results
7. Verify Fairness
8. Verify Starvation Behavior
9. Analyze Waveforms

## Assignment Learnings

- Arbitration Techniques
- Fixed Priority Scheduling
- Fair Resource Allocation
- Starvation Prevention
- Sequential Logic
- Testbench Development
- Waveform Analysis
- Hardware Resource Management

## Key Observation

For different request patterns:

- Priority Arbiter always favors higher-priority requests.
- Continuous high-priority requests can prevent lower-priority requests from being serviced.
- Round Robin Arbiter distributes grants fairly among all active requesters.
- Round Robin eliminates starvation at the cost of slightly increased hardware complexity.
- Choosing the appropriate arbiter depends on the application's fairness and latency requirements.

## Comparison: Priority Arbiter vs Round Robin Arbiter

| Feature | Priority Arbiter | Round Robin Arbiter |
|---------|------------------|---------------------|
| Priority | Fixed | Rotating |
| Fairness | Low | High |
| Starvation | Possible | Eliminated |
| Hardware Complexity | Low | Medium |
| Throughput | High | High |
| Latency | Low for High-Priority Requests | Uniform for All Requests |
| Best Use Case | Interrupt Controllers, Real-Time Systems | Bus Arbitration, Network Routers, Shared Resources |

## Conclusion

Arbiters are essential components in digital systems that manage access to shared resources. A **Priority Arbiter** offers simple and fast decision-making but may cause starvation for lower-priority requests. A **Round Robin Arbiter** provides fair access by rotating priorities, making it well suited for systems where equal resource allocation is important. Understanding both arbitration techniques is fundamental for designing efficient buses, memory controllers, processors, and communication systems.
