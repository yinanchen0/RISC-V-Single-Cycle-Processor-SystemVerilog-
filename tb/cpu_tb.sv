`timescale 1ns/1ps // Define time units and resolution
`include "cpu.sv" // Include all modules being used in this module
module cpu_tb;
logic [7:0] ALUResult,cpu_out;
logic CLK,reset;
 // Declare the variables being used by the testbench
cpu dut(CLK,reset,ALUResult,cpu_out); // Instantiate the module under test. dut (device
// under test) is the name we have chosen
initial begin // Generate clock signal with 20 ns period
CLK = 1;
forever #10 CLK = ~CLK;
end
initial begin // Single pass behaviour which starts at time 0 ns
$dumpfile("cpu.vcd"); // Dump variable changes in the vcd file
$dumpvars(0, cpu_tb); // Specifies which variables to dump in the vcd file
reset=1;//reset
#10//wait  for 10 unit
reset=0;//keep reset=0
#500
$finish;
end
initial begin // Single pass behaviour which starts at time 0 ns
$monitor("t = %3d,CLK = %b, reset = %b, ALUResult = %b, cpu_out=%b \n",$time, CLK,reset,ALUResult,cpu_out);
end // Print variable
// values on screen
endmodule