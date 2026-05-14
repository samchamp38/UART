# UART Loopback Communication System using Verilog HDL

A UART (Universal Asynchronous Receiver Transmitter) communication system designed and implemented in Verilog HDL using a modular RTL architecture. The project was simulated, verified, and deployed on the Basys3 FPGA board for real-time hardware validation.

The design implements UART transmission and reception using separate FSM-based TX and RX modules connected in loopback configuration. Data transmitted serially is received back correctly and verified through simulation as well as FPGA hardware testing.

The UART communication uses a standard **8N1 frame format**:
- 1 Start Bit
- 8 Data Bits
- No Parity Bit
- 1 Stop Bit

The baud rate generator was designed for **9600 baud communication** using the 100 MHz Basys3 onboard clock.

---

# Project Overview

This project implements a complete UART communication system using Verilog HDL. The transmitter converts 8-bit parallel data into serial format, while the receiver reconstructs the serial stream back into parallel data.

The project includes:
- UART Transmitter (`tx.v`)
- UART Receiver (`rx.v`)
- Baud Rate Generator (`baudgen.v`)
- UART Top Module (`simtopmod.v`)
- Simulation Testbench (`simtopmodtb.v`)
- FPGA Hardware Top Module (`vivadotop.v`)

The system was:
- Designed using Verilog HDL
- Simulated using Icarus Verilog and GTKWave
- Synthesized and implemented using Xilinx Vivado
- Verified on the Basys3 FPGA board
- Tested using PuTTY serial terminal communication

---

# Key Features

- UART Transmitter and Receiver implementation
- FSM-based serial communication
- 9600 baud rate operation
- Standard 8N1 UART frame format
- Modular RTL design
- Separate TX and RX baud tick generation
- Loopback communication testing
- Push-button triggered transmission
- LED and seven-segment display interfacing
- Functional simulation testbench
- FPGA hardware verification on Basys3

---

# Simulation Verification

The testbench transmits multiple 8-bit values through the UART transmitter and verifies that the receiver reconstructs the same data correctly.

Simulation was performed using:
- Icarus Verilog
- GTKWave

The transmitted and received outputs matched successfully for all tested values.

---

# FPGA Hardware Verification

The design was successfully deployed on the Basys3 FPGA board using Xilinx Vivado.

UART communication was tested using the PuTTY serial terminal. Data transmitted from the FPGA was received correctly, while received UART data was displayed using onboard LEDs and seven-segment displays for real-time verification.

---

# Tools and Technologies Used

- Verilog HDL
- Xilinx Vivado
- Icarus Verilog
- GTKWave
- Basys3 FPGA Board
- PuTTY Serial Terminal

---

# Applications

- FPGA-based serial communication
- Embedded system design
- UART protocol learning
- Digital communication systems
- Hardware verification and testing

---

# Future Improvements

- Configurable baud rate support
- FIFO buffer integration
- Parity and framing error detection
- Full duplex UART communication
- UART interrupt support

---

# Author

Developed as an FPGA-based UART communication project using Verilog HDL and the Basys3 FPGA platform.
