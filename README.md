# SIGN LANGUAGE RECOGNITION AND TRANSLATION

## PROJECT DESCRIPTION

This project aims to close the communication gap between people with hearing loss and people without this handicap. 
This is done by implementing a system which recognizes the 26 letters of the standard American Sign Language (ASL), 
and displaying the signed word or sentence on a monitor.

5 flex sensors (one per finger) as well as an accelerometer were placed on a glove in order to measure hand positions that correlate to letters in sign language. 
An analog to digital converter was used to read the values from the flex sensors. The accelerometer communicates with the FPGA via SPI. 
The finger positions representing each letter are stored in memory and the data gathered from the peripherals is compared to the stored values to decide 
which letter the user is trying to communicate. Once a letter has been decided the FPGA displays the letter on a VGA display.

## HOW TO USE

To use: 
  1. Open the project ASL_Project. This contains the block diagram of the design. 
  2. Generate the bitstream after running synthesis and implementation, and export to SDK.
  3. Launch SDK, and open ASL_main.c
  4. Connect flex sensors to JXADC ports, the pinky to the audio connector, accelerometer to JA, and buttons to JB.
  5. Program FPGA. Make new configuration, and run program.

To modify:
  1. Open the IP to modify, and modify as necessary.
  2. Open ASL_Project and update IP. Check the base addresses of the blocks.
  3. Rerun synthesis, implementation, and regenerate bitstream.
  4. Export and open SDK. Make sure the base address used in ASL_main.c still matches those in the Microblaze system.
  5. Program FPGA. Make new configuration, and run program.

## REPOSITORY STRUCTURE

- doc
  - Final Report.pdf
  - Final Presentation.ppt
- src
  - ASL_Project
    * Includes the block diagram that connects the VGA, and all IP’s to a microblaze processor.
    * Includes the software code, ASL_main.c, that controls and enables communication between all the IP’s.
  - ASL_IP
    * Includes the custom IP to compute the letter based on sensor data
  - ADC
    * Includes the modified XADC IP to obtain the flex sensor data
  - ACCEL
    * Includes the modified IP with SPI to obtain the accelerometer data
  - HEX
    * Includes the modified IP to use the HEX display for debugging
  - board_files
    * Includes the board files necessary to use the DDR board
- hardware
  - glove.jpg
    * picture of the glove with flex sensors, accelerometer, and buttons

## AUTHORS

* Emily Miao
* Tomasz Piotrowski
* Ellen Zhu

## ACKNOWLEDGEMENTS

We would like to thank Professor Chow for providing the Xilinx FPGA boards and Pmods we used during this project, as well as for his help in mapping the XADC addresses.

We would also like to thank our TA, Fernando, for his continuous help and support throughout this project.
