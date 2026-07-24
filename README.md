# EDGE-DETECTOR-IN-VERILOG-
Implemented and compared **Mealy** and **Moore** finite state machine (FSM) based edge detectors in Verilog. Designed RTL, developed testbenches, and analyzed differences in state count, output behavior, response latency, and hardware complexity through simulation.
# Mealy vs Moore Edge Detector (Verilog)

## Overview

This repository implements and compares **Mealy** and **Moore Finite State Machine (FSM)** based edge detectors in Verilog. The project demonstrates the differences between the two FSM models in terms of state requirements, output generation, response latency, and hardware complexity.

## Objectives

* Design a **Mealy FSM** for both-edge detection.
* Design a **Moore FSM** for both-edge detection.
* Verify both implementations using simulation testbenches.
* Compare the behavior and characteristics of Mealy and Moore FSMs.

## Repository Contents

```
├── design.sv                 # Mealy edge detector
├── edge_detector_moore.sv    # Moore edge detector
├── testbench.sv              # Testbench for Mealy FSM
├── tb_edge_detector_moore.sv # Testbench for Moore FSM
└── README.md
```

## Mealy Edge Detector

* **States:** 2
* **Output depends on:** Present state and current input
* **Advantages:**

  * Fewer states
  * Faster response (no extra clock-cycle delay)
  * Lower hardware complexity

## Moore Edge Detector

* **States:** 4
* **Output depends on:** Present state only
* **Advantages:**

  * Stable outputs
  * Easier timing analysis
* **Limitation:**

  * One clock-cycle latency compared to the Mealy implementation.

## Comparison

| Feature             | Mealy FSM     | Moore FSM             |
| ------------------- | ------------- | --------------------- |
| Number of States    | 2             | 4                     |
| Output Depends On   | State + Input | State Only            |
| Response Time       | Immediate     | One Clock Cycle Later |
| Hardware Complexity | Lower         | Higher                |

## Simulation

Both designs were verified using **QuestaSim** with dedicated testbenches. The simulation demonstrates correct detection of:

* Rising edge (0 → 1)
* Falling edge (1 → 0)
* Both-edge transitions

## Learning Outcomes

* Understanding the difference between Mealy and Moore FSMs.
* FSM state encoding and state transitions.
* RTL implementation using Verilog.
* Development of synchronous testbenches.
* Verification and comparison of FSM behavior through simulation.

## Tools Used

* Verilog HDL
* QuestaSim
* Git & GitHub
