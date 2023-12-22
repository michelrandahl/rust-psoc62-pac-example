# Connect to the debugger
target extended-remote :3333

# Prevent panic corruption of LR
# set backtrace limit 32
# 
# # Stop the device (just in case the debugger didnt)
monitor reset halt
# 
# # Program our code to flash
load
# 
# # Reset the device
#monitor reset halt
# 
# # Set a breakpoint at main()
#break src/main.rs:25
# 
# # Run until we hit main()
continue
