| # EEC 116 Fall 2016
| # Final Project testbench (speed)
| # You may change only the stepsize to test higher frequency operation.

stepsize 545

| ||||||||||||||||||||||||||||||||||||||||||
| # Do not change anything below this line. |
| ||||||||||||||||||||||||||||||||||||||||||

| # Define input and output vectors

vector input input2:0
vector output out_hist7:0

| # Define global clock phases
clock clk_top 0 1

| |||||||||||||||||||||||||
| Test Sequence 2 - Speed |
| |||||||||||||||||||||||||

setvector input 000
l clear
l calc_hist
l read_out

| # Clear Memory
| # DESCRIPTION: Set the clear signal high.
| # Sweep vector input from value 000 to value 111. Execute a single clock
| # cycle at each intermediate value.
| # The contents of your memory should be all zeros

h clear
for {set i 0} {$i < 8} {incr i} {
    setvector input 0d$i
    c
}
l clear
c 2

| # Speed test sequence. Increment register 7 to value 0111 1111.

setvector input 0d7
h calc_hist
c 127

| # Switch input to 000 for one clock cycle to get worst case transition
| # when switching back to 111.

setvector input 0d0
c

| # Transition Register 7 from 01111111 -> 10000000
setvector input 0d7
c

| # Increment reg7 to 255 by clocking 127 more times

c 127

| # set_ylim input away from 0d7 and back to exercise critical transition
setvector input 0d0
c

| # Transition Register 7 from 11111111 -> 00000000
setvector input 0d7
c

l calc_hist

| # Read Out Contents of Memory
| # Should be the following:
| # reg0 -> 0000 0010
| # reg1 -> 0000 0000
| # reg2 -> 0000 0000
| # reg3 -> 0000 0000
| # reg4 -> 0000 0000
| # reg5 -> 0000 0000
| # reg6 -> 0000 0000
| # reg7 -> 0000 0000

h read_out
for {set i 0} {$i < 8} {incr i} {
    setvector input 0d$i
    c
}
l read_out
c 10

| ||||||||||||||||||||||
| Finish Test Sequence |
| ||||||||||||||||||||||

ana clk_top calc_hist read_out input output out_valid

| End Testbench

