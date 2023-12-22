# rust-psoc62-pac-example
Blinks LED on the 4343W psoc62 prototyping board.
This program will run on the M4 core on the psoc62 and the program will not work after reseting the board.

## How to run the program

First connect to the board with the custom cypress `openocd` tool. I run it with following command:
```
sudo ./openocd -f interface/cmsis-dap.cfg -f target/psoc6_2m.cfg
```

Next simply execute `make run-m0` or `make run-m4` in this project. Note that programs loaded onto m0 will persist and start automatically after reset or powering the board off and on, whereas programs loaded onto m4 will not. Probably m0 is the first core to automatically be booted up and the programmer must somehow startup m4 from his code running on m0.

## How to connect to the 4343W board with `openocd` 
A custom version of `openocd` has to be compiled for the Infineon/cypress products. It comes as part of something called `cyprogrammer` which can be downloaded from Infineons website https://softwaretools.infineon.com/tools/com.ifx.tb.tool.cypressprogrammer. 
To be able to compile this custom version of openocd for NixOs, I have created the following repo https://github.com/michelrandahl/cypress-openocd-nix.
