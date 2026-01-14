# SystemVerilog CPU Datapath Design

This repository contains a **modular CPU datapath implementation** written in
**SystemVerilog**, developed as an academic digital hardware design project.
The design demonstrates how instructions are **fetched, decoded, and executed
in simulation** using standard CPU building blocks.

## What This Project Does
- Implements core CPU components (ALU, register file, PC, control logic)
- Integrates modules into a functional CPU datapath
- Executes instructions in **simulation**
- Verifies correctness using dedicated **SystemVerilog testbenches**

The project outcome is a **working, simulatable CPU design**, validated through
waveform-based verification.

## CPU Block Diagram (Conceptual)
At a high level, the CPU operates as follows:
1. The **Program Counter (PC)** supplies an address to instruction memory
2. **Instruction Memory** outputs the current instruction
3. The **Control Unit** decodes the instruction into control signals
4. The **Register File** provides operands to the datapath
5. The **ALU** performs arithmetic or logic operations
6. Results are written back to the register file
7. The PC updates to fetch the next instruction

This reflects a standard **single-cycle CPU datapath structure** used in
introductory processor design.

## File Structure
- src/        # SystemVerilog CPU modules (ALU, PC, control, register file, etc.)
- tb/         # Testbenches for individual modules and integrated CPU
- programs/   # Example instruction/program files
- README.md


## Tools
- SystemVerilog
- Icarus Verilog / ModelSim (for simulation)
- GTKWave (for waveform inspection)

## Notes
This project was developed as an educational CPU design exercise, with emphasis on
clean modular design and verification rather than performance optimization.
