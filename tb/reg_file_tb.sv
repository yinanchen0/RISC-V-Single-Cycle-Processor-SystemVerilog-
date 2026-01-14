`timescale 1ps/1ps// Define time units and resolution
`include "reg_file.sv"// Include module being used in this module
module reg_file_tb;
logic [3:0] RA1, RA2, WA;
logic CLK, write_enable;
logic [7:0] ALUResult,cpu_out, RD1,RD2;
reg_file  dut(RA1, RA2, WA, ALUResult, write_enable, CLK,RD1,RD2,cpu_out);
initial begin // Generate clock signal with 20 ns period
CLK = 0;
forever #10 CLK = ~CLK;
end
initial begin // Apply stimulus
$dumpfile("reg_file.vcd");
$dumpvars(0, reg_file_tb);
//first vector
RA1 = 1; RA2 = 2; WA = 1; ALUResult = 1; write_enable = 0; 
//second
#10 RA1 = 1; RA2 = 2; 
#10 WA = 1; ALUResult = 3; write_enable = 1;
//third
#10 RA1 = 1; RA2 = 2; 
#10 WA = 2; ALUResult = 5; 
write_enable = 1;
//fourth
#10 RA1 = 1; RA2 = 3; 
#10  WA = 3; ALUResult = 7; 
 write_enable = 1;
//fifth
#10 RA1 = 2; RA2 = 3; 
#10 WA = 2; ALUResult = 9; 
 write_enable = 1;
//sixth
#10 RA1 = 1; RA2 = 2; 
#10 WA = 4; ALUResult = 11; 
write_enable = 1;
//seventh
#10 RA1 = 1; RA2 = 4; 
#10  WA = 15; ALUResult = 13; 
 write_enable = 1;
//eighth
#10 RA1 = 15; RA2 = 1; 
#10 WA = 15; ALUResult = 15; 
write_enable = 1;
$finish; // This system tasks ends the simulation
end
initial begin // Response monitor
$monitor ("t = %3d, CLK = %b, ALUResult=%b,RA1 = %b RA2 = %b, \
WA = %b, write_enable = %b, cpu_out = %b, RD1 = %b, \
RD2 = %b", $time, CLK, ALUResult, RA1, RA2, WA, write_enable, cpu_out, RD1,RD2);
end
endmodule
