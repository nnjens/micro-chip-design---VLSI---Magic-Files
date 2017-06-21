| #  EEC 116 Fall 2016
| #  Final Project testbench (functionality)
| #  You may change only the stepsize to test higher frequency operation.

stepsize 10000

| ||||||||||||||||||||||||||||||||||||||||||||
| #  Do not change anything below this line. |
| ||||||||||||||||||||||||||||||||||||||||||||

| #  Define input and output vectors

vector input input2:0
vector output out_hist7:0

| #  Define global clock phases
clock clk_top 0 1

| ||||||||||||||||||||||||||||||||||||
| #  Test Sequence 1 - Functionality |
| ||||||||||||||||||||||||||||||||||||

| #  Initialize Inputs
| #  Set all inputs low

setvector input 000
l clear
l calc_hist
l read_out

| #  Clock for two cycles for safety

c 2

| #  Clear Memory
| #  DESCRIPTION: Set the clear signal high.
| #  Sweep vector input from value 000 to value 111. Execute a single clock
| #  cycle at each intermediate value.
| #  The contents of your memory should be all zeros

h clear
for {set i 0} {$i < 8} {incr i} {
    setvector input 0d$i
    c
}
l clear
c 2

| #  Display Zeros In All Flip-Flops - Verify all contents are cleared

h read_out
for {set i 0} {$i < 8} {incr i} {
    setvector input 0d$i
    c
}
l read_out
c 2

| #  Do Histogram
| #  DESCRIPTION: Assert the signal "calc_hist"
| #  Increment the input vector through a sequence of random values. Cycle the
| #  clock once for each input value.

h calc_hist

setvector input 0d2; c
setvector input 0d3; c
setvector input 0d4; c
setvector input 0d1; c
setvector input 0d6; c
setvector input 0d7; c
setvector input 0d4; c
setvector input 0d2; c
setvector input 0d4; c
setvector input 0d5; c
setvector input 0d7; c
setvector input 0d2; c
setvector input 0d7; c
setvector input 0d7; c
setvector input 0d4; c
setvector input 0d0; c
setvector input 0d3; c
setvector input 0d3; c
setvector input 0d6; c
setvector input 0d6; c
setvector input 0d7; c
setvector input 0d1; c
setvector input 0d5; c
setvector input 0d3; c
setvector input 0d6; c
setvector input 0d7; c
setvector input 0d5; c
setvector input 0d7; c
setvector input 0d6; c
setvector input 0d6; c
setvector input 0d4; c
setvector input 0d5; c
setvector input 0d6; c
setvector input 0d5; c
setvector input 0d5; c
setvector input 0d7; c

setvector input 0d0
l calc_hist
c 2

| #  Read Out Contents of Memory
| #  DESCRIPTION: Sweep through the contents of memory, displaying the contents
| #  of each register to the output pins.
| #  The expected values are as follow:
| #  reg0 -> 0000 0001
| #  reg1 -> 0000 0010
| #  reg2 -> 0000 0011
| #  reg3 -> 0000 0100
| #  reg4 -> 0000 0101
| #  reg5 -> 0000 0110
| #  reg6 -> 0000 0111
| #  reg7 -> 0000 1000

h read_out
for {set i 0} {$i < 8} {incr i} {
    setvector input 0d$i
    c
}
l read_out
c 5

| ||||||||||||||||||||||
| Finish Test Sequence |
| ||||||||||||||||||||||

ana clk_top calc_hist read_out input output out_valid

| End Testbench

