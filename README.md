# UART Loopback Communication System using Verilog HDL

A complete UART (Universal Asynchronous Receiver Transmitter) communication system designed and implemented in Verilog HDL featuring modular RTL architecture, simulation verification, and FPGA deployment on the Basys3 FPGA board. The project demonstrates serial communication between UART transmitter and receiver modules through loopback operation, where transmitted data is received back and displayed in real time on FPGA hardware.

The design was successfully verified through functional simulation and hardware implementation using the Basys3 FPGA board. Data entered through a serial terminal is transmitted serially, received correctly by the UART receiver, and displayed on the onboard seven-segment display for real-time validation.

The system also includes baud rate generation, clock division, finite state machine (FSM) based UART transmission and reception, and seven-segment display interfacing for hardware visualization.

The UART design was fully simulated, synthesized, and verified on real FPGA hardware.

---

# Project Overview

This project implements a UART serial communication system using Verilog HDL. The design consists of UART transmitter and receiver modules integrated in a loopback configuration for complete communication verification.

The system was:

- Designed using Verilog HDL
- Simulated and verified using Icarus Verilog and GTKWave
- Synthesized and deployed on the Basys3 FPGA board
- Tested using serial communication through PuTTY terminal
- Integrated with seven-segment display hardware for real-time output monitoring

The UART transmitter converts parallel input data into serial format, while the receiver reconstructs the serial data back into parallel form. The transmitted and received data were successfully verified both in simulation and on FPGA hardware.

The project was implemented and tested using Xilinx Vivado on the Basys3 FPGA development board.

---

# Key Features

- UART Transmitter and Receiver implementation
- Full duplex serial communication architecture
- Modular RTL design using Verilog HDL
- FSM-based UART transmission and reception
- Baud rate generator for UART timing
- Clock divider for Basys3 100 MHz system clock
- Serial-to-parallel and parallel-to-serial data conversion
- Loopback communication verification
- Seven-segment display interfacing
- Real-time hardware output visualization
- Functional simulation testbench
- XDC constraint file for Basys3 FPGA board
- Successfully synthesized and deployed on FPGA hardware

---

# RTL Modules

The project consists of the following RTL modules:

- UART Transmitter
- UART Receiver
- Baud Rate Generator
- Clock Divider
- Transmitter FSM
- Receiver FSM
- Seven Segment Display Controller
- Binary to Seven Segment Decoder
- Top Module
- Testbench

---

# Hardware Verification

The UART system was verified on the Basys3 FPGA board using serial terminal communication through PuTTY. ASCII characters entered through the keyboard were transmitted serially by the UART transmitter, received by the UART receiver, and displayed correctly on the FPGA hardware.

The successful loopback operation confirmed correct UART frame generation, serial data transmission, reception, and data reconstruction.

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

- Serial communication systems
- FPGA-based embedded systems
- UART protocol learning and verification
- Digital system design education
- FPGA hardware debugging and testing

---

# Future Improvements

- Configurable baud rate selection
- FIFO buffer integration
- UART interrupt support
- Full duplex communication enhancement
- Error detection and parity support
- AXI/UART peripheral integration

---

# Author

Developed as an FPGA-based UART communication project using Verilog HDL and Basys3 FPGA hardware.
