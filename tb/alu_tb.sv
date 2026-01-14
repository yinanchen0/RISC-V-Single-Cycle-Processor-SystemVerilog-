`timescale 1ns/1ps // Define time units and resolution
`include "alu.sv" // Include all modules being used in this module
module alu_tb;
logic [7:0] tSrcA,tSrcB,tALUResult;
logic [1:0] tALUControl;
logic tZero;
 // Declare the variables being used by the testbench
alu dut(tSrcA,tSrcB,tALUControl,tALUResult,tZero); // Instantiate the module under test. dut (device
// under test) is the name we have chosen
initial begin // Single pass behaviour which starts at time 0 ns
$dumpfile("alu.vcd"); // Dump variable changes in the vcd file
$dumpvars(0, alu_tb); // Specifies which variables to dump in the vcd file
tALUControl = 00; tSrcA = 01000001; tSrcB=00000010; #20; // Set variable values and set time delays
tALUControl = 01; tSrcA = 00000001; tSrcB=00001010; #20;
tALUControl = 10; tSrcA = 00000001; tSrcB=00000011; #20;
tALUControl = 11; tSrcA = 00000001; tSrcB=00000011; #20;
end
initial begin // Single pass behaviour which starts at time 0 ns
$monitor("tALUControl = %b, tSrcA = %b, tSrcB = %b, tALUResult = %b, tZero=%d \n", tALUControl, tSrcA, tSrcB, tALUResult,tZero);
end // Print variable
// values on screen
endmodule