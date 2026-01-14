# SystemVerilog CPU Design

This repository contains the design and verification of a simple CPU implemented in
**SystemVerilog**. The project focuses on modular hardware design and simulation-based
verification, with each major component implemented and tested independently.

## Overview
The CPU is composed of standard datapath and control components, including an ALU,
control unit, register file, program counter, and instruction memory. Individual
testbenches are provided to verify the functionality of each module as well as the
integrated CPU.

## Architecture
Main modules included in this project:
- **ALU** – Arithmetic and logic operations
- **Control Unit** – Instruction decoding and control signal generation
- **Register File** – Register read/write operations
- **Program Counter (PC)** – Instruction sequencing
- **Instruction Memory** – Instruction storage and fetch
- **Top-level CPU** – Integration of all modules

## Verification
Each hardware module is verified using a dedicated SystemVerilog testbench:
- `alu_tb.sv`
- `control_unit_tb.sv`
- `reg_file_tb.sv`
- `PC_tb.sv`
- `instruction_memory_tb.sv`
- `cpu_tb.sv`

Simulation waveforms were used to confirm correct functional behavior.

## File Structure
src/ # CPU and datapath modules (.sv)
tb/ # Testbenches (.sv)

## Tools
- SystemVerilog
- Icarus Verilog / ModelSim (for simulation)
- GTKWave (for waveform inspection)

## Notes
This project was developed as an educational CPU design exercise, with emphasis on
clean modular design and verification rather than performance optimization.


