# Lab 04-

[https://github.com/xcadaj00/Digital-electronics-1/](https://github.com/xcadaj00/Digital-electronics-1/)

## Tables with connection of 16 slide switches and 16 LEDs on Nexys A7 board

### LEDs

Transistor is closed when 3.3V applied to its base throught resistor, when 0V applied, transistor will open so digit can light up. 

| **Component** | **Pin** |
| :-: | :-: |
| LED0 |  |
| LED1 |  |
| LED2 |  |
| LED3 |  |
| LED4 |  |
| LED5 |  |
| LED6 |  |
| LED7 |  |


## Table of

| **Hex** | **Inputs** | **A** | **B** | **C** | **D** | **E** | **F** | **G** |
| :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: |
| 0 | 0000 | 0 | 0 | 0 | 0 | 0 | 0 | 1 |
| 1 | 0001 | 1 | 0 | 0 | 1 | 1 | 1 | 1 |
| 2 | 0010 | 0 | 0 | 1 | 0 | 0 | 1 | 0 |
| 3 | 0011 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
| 4 | 0100 | 1 | 0 | 0 | 1 | 1 | 0 | 0 |
| 5 | 0101 | 0 | 1 | 0 | 0 | 1 | 0 | 0 |
| 6 | 0110 | 0 | 1 | 0 | 0 | 0 | 0 | 0 |
| 7 | 0111 | 0 | 0 | 0 | 1 | 1 | 1 | 1 |
| 8 | 1000 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| 9 | 1001 | 0 | 0 | 0 | 0 | 1 | 0 | 0 |
| A | 1010 | 0 | 0 | 0 | 1 | 0 | 0 | 0 |
| b | 1011 | 1 | 1 | 0 | 0 | 0 | 0 | 0 |
| C | 1100 | 0 | 1 | 1 | 0 | 0 | 0 | 1 |
| d | 1101 | 1 | 0 | 0 | 0 | 0 | 1 | 0 |
| E | 1110 | 0 | 1 | 1 | 0 | 0 | 0 | 0 |
| F | 1111 | 0 | 1 | 1 | 1 | 0 | 0 | 0 |


## Two-bit wide 4-to-1 multiplexer

### VHDL architecture

```vhdl

```

### VHDL stimulus process

```vhdl

```

### Screenshot with simulated time waveforms

![](images/sim.png)


















## A Vivado tutorial

### Project creation

1. Open Vivado 2020.2
2. Under "Quick Start", click "Create Project"
3. Click "Next >"
4. Type project name and select project location, then click "Next>"
5. Click "Next >"

### Adding source file

6. Click "Create File", make sure your file type is "VHDL" and type file name, it should same as project name
7. Click "OK"
8. Click "Next >"
9. Click "Next >"
10. Click on "Boards" and select your board, for example "Nexys A7-50T"
11. Click "Next >"
12. Click "Finish"
13. Click "OK" and "Yes"

### Adding testbench file

14. Under "Sources", open folder "Simulation Sources"
15. Right click on folder "sim_1" and select "Add Sources..."
16. Click "Next >"
17. Click "Create File", make sure your file type is "VHDL" and type file name that begins with "tb_" and then your project name
18. Click "OK"
19. Click "Finish"
20. Click "OK" and "Yes"

### Running simulation

21. After you add your source code to previously created files, click "Run Simulation" in the left column and then select "Run Behavioral Simulation"
22. Wait for a moment, then your simulation graphs are opened in the new window, you can extend it by clicking the "Maximize" button in right corner of this window


