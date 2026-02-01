# 16-bit MIPS-Based Processor Design

**Course:** Digital System Design

**Authors:** Syed Sameer Ahmed, Abdul Qadeer and Adeel Nadeem 

**Institution:** DHA Suffa University

## 📌 Project Overview

This project presents the complete design and implementation of a custom **16-bit MIPS-based processor** using Verilog HDL. The processor performs arithmetic, logical, memory, and control operations, fulfilling the requirements of a modern digital processor.

To analyze performance and hardware complexity, two distinct architectures were implemented:

1. **Single-Cycle Architecture:** Executes every instruction in one clock cycle.
2. **Multi-Cycle Architecture:** Uses a Finite State Machine (FSM) to execute instructions over 3–5 clock cycles.

## ⚙️ Features

* **Architecture:** 16-bit RISC (MIPS-based)
* **Instruction Set:** Custom ISA supporting Arithmetic, Logical, Load/Store, and Branch operations.
* **Components:** * ALU (Arithmetic Logic Unit)
* Register File (8 General Purpose Registers)
* Control Unit (FSM for Multi-cycle)
* Instruction & Data Memory


* **Tools Used:** Verilog HDL, ModelSim (for simulation).

## 📝 Instruction Set Architecture (ISA)

The processor supports the following 16-bit instructions:

| Instruction | Type | Operation | Description |
| --- | --- | --- | --- |
| **ADD** | R | `Rd ← Rs + Rt` | Addition |
| **SUB** | R | `Rd ← Rs - Rt` | Subtraction |
| **AND** | R | `Rd ← Rs & Rt` | Bitwise AND |
| **OR** | R | `Rd ← Rs | Rt` | Bitwise OR |
| **LW** | I | `Rt ← Mem[Rs + Imm]` | Load Word |
| **SW** | I | `Mem[Rs + Imm] ← Rt` | Store Word |
| **BEQ** | I | `If Rs == Rt, branch` | Branch on Equal |
| **J** | J | `PC ← Address` | Jump |

## 🏗️ Architecture Diagrams

### Single-Cycle Design

<img width="315" height="585" alt="image" src="https://github.com/user-attachments/assets/81028523-bc2c-402e-a9ab-78413f26944a" />

> In the single-cycle CPU, all stages (Fetch, Decode, Execute, Memory, Write-Back) are completed in one clock cycle.

### Multi-Cycle Design (FSM)

<img width="277" height="585" alt="image" src="https://github.com/user-attachments/assets/7986d3f9-a3b7-40fa-8503-64175346f388" />

> The multi-cycle CPU uses an FSM controller. Instructions are broken down into discrete steps (Fetch, Decode, ALU, Memory, Write-back) to reuse hardware and improve efficiency.

## 📊 Simulation & Verification

The design was verified using ModelSim.

* **Single-Cycle:** Validated correct PC updates, ALU ops, and Register writes in 1 clock.
* **Multi-Cycle:** Verified state transitions (Fetch → Decode → Exec...) utilizing the FSM.

## 🚀 How to Run

1. Clone this repository:
```bash
git clone https://github.com/syedsameeerahmed/16bit-CPU-Verilog.git

```


2. Open the source files in **ModelSim** or **Vivado**.
3. Compile all modules in `src/`.
4. Run the testbench:
*   **For Single Cycle:** Compile `S16` top module and its testbench.
*   **For Multi-Cycle:** Compile `S16_MC` top module and its testbench.


5. View the waveform output.
