# rust-psoc62-pac-example
Blinks LED on the 4343W psoc62 prototyping board.

First connect to the board with the custom cypress `openocd` tool. I run it with following command:
```
sudo ./openocd -f interface/cmsis-dap.cfg -f target/psoc6_2m.cfg
```

next simply execute `cargo run` in this project.
