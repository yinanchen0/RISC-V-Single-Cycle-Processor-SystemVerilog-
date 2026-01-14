`timescale 1ps/1ps// Define time units and resolution
`include "PC.sv"// Include all modules being used in this module
module PC_tb;
logic [7:0] immediate,pc;
logic PCSrc, CLK, reset;
// Declare the variables being used by the testbench
PC dut(immediate,PCSrc, CLK, reset,pc);
initial begin // Generate clock signal with 20 ns period
CLK = 1;
forever #10 CLK = ~CLK;
end
initial begin // Apply stimulus
$dumpfile("PC.vcd");// Dump variable changes in the vcd file
$dumpvars(0, PC_tb);// Specifies which variables to dump in the vcd file
//first vector
immediate = 1; PCSrc = 1; reset = 1; 
//second
#20 immediate = 1; PCSrc = 0; reset = 0; 
//third
#20 immediate = 1; PCSrc = 0; reset = 0; 
//fourth
#20 immediate = 1; PCSrc = 0; reset = 0; 
//fifth
#20 immediate = 1; PCSrc = 0; reset = 0; 
//sixth
#20 immediate = 1; PCSrc = 1; reset = 0; 
//seventh
#20 immediate = 3; PCSrc = 1; reset = 0; 
//eighth
#20 immediate = 4; PCSrc = 1; reset = 0; 
$finish; // This system tasks ends the simulation
end
initial begin // Response monitor
$monitor ("t = %3d, CLK = %b, immediate=%b,PCSrc = %b reset = %b, \
pc = %d", $time, CLK, immediate, PCSrc, reset, pc);
end
endmodule
