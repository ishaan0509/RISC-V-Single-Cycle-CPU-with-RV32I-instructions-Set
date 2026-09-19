# RISC-V Single-Cycle CPU with RV32I Instruction Set

This project implements a minimal single-cycle RISC-V CPU datapath focused on the RV32I integer instruction subset. The design is organized into a few key Verilog modules that model the core execution units of a simple CPU.

## Project Overview

A single-cycle processor executes one instruction per clock cycle. In this design, the instruction fetch, decode, register access, ALU/data path, and immediate generation are handled in a simplified pipeline structure. The current repository contains the fundamental building blocks for instruction memory, program counter, register file, and immediate generation.

## Included Modules

### 1. Program Counter
File: `program_counter.v`

- Stores the current program counter value.
- Updates on the positive edge of the clock or resets to zero.
- Drives the next instruction fetch address.

### 2. Instruction Memory
File: `instruction_mem.v`

- Holds a memory array of 64 words.
- Reads the instruction using a word-aligned address (`read_address >> 2`).
- Provides the instruction to the decode stage.

### 3. Register File
File: `reg_file.v`

- Implements 32 general-purpose registers.
- Supports read ports for `rs1` and `rs2`.
- Supports write-back via `reg_write` and `write_data`.
- Resets the registers to a pattern for initialization.

### 4. Immediate Generator
File: `imm_gen.v`

- Generates the immediate values for different RV32I instruction formats.
- Supports common instruction types such as:
  - I-type loads and arithmetic
  - S-type stores
  - B-type branches
  - U-type upper-immediate instructions
  - J-type jumps
- Produces the sign-extended or shifted immediate for later use in execution.

## RV32I Focus

This project targets the RV32I instruction set, which includes integer computational and memory instructions. The immediate generator handles the most common instruction formats required to decode and execute these instructions correctly.

## Design Flow

The basic execution sequence in this CPU is:

1. The program counter provides the current instruction address.
2. The instruction memory fetches the corresponding instruction.
3. The instruction is decoded and routed to the required functional units.
4. The immediate generator extracts valid immediate values from the instruction.
5. The register file reads source operands and writes results when needed.
6. The next PC value is computed and fed back to the program counter.

## Procedure to Use / Extend This Project

1. Open the Verilog files in your HDL editor or Vivado.
2. Add the associated top-level CPU module to connect the components together.
3. Implement the decode and control logic for the RV32I instructions you want to support.
4. Add the ALU and data memory modules for complete execution.
5. Simulate the design using a testbench to validate instruction flow.
6. Synthesize and implement in Vivado for FPGA deployment.

## Typical Simulation Idea

A testbench can perform the following steps:

- Initialize `clk` and `rst`.
- Set an initial `PC` value.
- Fetch instructions from memory.
- Check register write behavior.
- Validate immediate decoding for various RV32I opcode classes.

## Notes

This repository is a foundational CPU implementation for learning and experimentation. It is intentionally modular and can be extended into a more complete RV32I processor by adding control, ALU, branch handling, and memory support.

## License

This project is shared for educational and learning purposes.
