`timescale 1ns/1ps // Define time units and resolution
`include "control_unit.sv" // Include all modules being used in this module
module control_unit_tb;
logic [3:0] opcode;
logic [1:0] ALUControl;
logic Branch, ALUSrc, RegWrite;

 // Declare the variables being used by the testbench
control_unit dut(opcode,ALUControl,Branch, ALUSrc, RegWrite); // Instantiate the module under test. dut (device
// under test) is the name we have chosen
initial begin // Single pass behaviour which starts at time 0 ns
$dumpfile("control_unit.vcd"); // Dump variable changes in the vcd file
$dumpvars(0, control_unit_tb); // Specifies which variables to dump in the vcd file
opcode=4'b0000; #20; // Set variable values and set time delays
opcode=4'b0001; #20;
opcode=4'b0010; #20;
opcode=4'b0011; #20;
opcode=4'b0100; #20;
opcode=4'b0101; #20;
opcode=4'b0110; #20;
opcode=4'b0111; #20;

$finish;
end
initial begin // Single pass behaviour which starts at time 0 ns
$monitor("opcode = %b, ALUControl = %b, Branch = %b, ALUSrc = %b, RegWrite=%b \n", opcode, ALUControl, Branch, ALUSrc,RegWrite);
end // Print variable
// values on screen
endmodule