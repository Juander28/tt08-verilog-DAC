<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

This project implements a 7-bit Digital-to-Analog Converter (DAC) that converts digital signals into corresponding current levels. The DAC adds the current contributions from each bit, transforming the summed current into a proportional voltage output. This voltage is then fed into a series of comparators, which measure the voltage levels digitally to determine the corresponding output state.

## How to test

To test the DAC, you will need a logic state analyzer connected to the outputs of the comparators to measure the signals and ensure they correspond correctly to the expected digital values. The digital input to the DAC can be generated using an FPGA, which will provide various combinations of digital signals to fully test the DAC's performance across all possible input states.

## External hardware

- **Comparators**: Used to measure the output voltage levels and convert them into corresponding digital signals.
- **FPGA**: Generates different digital input combinations to test the DAC. The FPGA controls the input signals fed into the DAC.
- **Logic State Analyzer**: Used to monitor the output signals from the comparators, ensuring correct digital signal generation based on the DAC's output.

