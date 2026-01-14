`timescale 1ps/1ps// Define time units and resolution
`include "reg_file_alu.sv"// Include module being used in this module
module reg_file_alu_tb;
logic [3:0]RA1,RA2,WA;
logic [7:0] immediate,ALUResult,cpu_out;
logic write_enable,ALUSrc,CLK,Zero;   
logic [1:0] ALUControl;      
reg_file_alu  dut(RA1, RA2, WA,immediate,write_enable,ALUSrc,CLK,ALUControl,ALUResult,cpu_out,Zero);
initial begin // Generate clock signal with 20 ns period
CLK = 1;
forever #10 CLK = ~CLK;
end
initial begin // Apply stimulus
$dumpfile("reg_file_alu_tb.vcd");
$dumpvars(0, reg_file_alu_tb);
//first vector
RA1 = 0; RA2 = 2; WA = 1;  write_enable = 1; ALUControl = 2'b00; immediate=8'd5;ALUSrc=1;
//second
#10 RA1 = 0; RA2 = 0; 
#10 WA = 2;  write_enable = 1;ALUControl = 2'b01;immediate=8'd5;ALUSrc=1;
//third
#10 RA1 = 2; RA2 = 2; 
#10 WA = 3;  ALUControl = 2'b10;immediate=8'd5;ALUSrc=1;
write_enable = 1;
//fourth
#10 RA1 = 3; RA2 = 3; 
#10  WA = 4; ALUControl = 2'b11;immediate=8'd5;ALUSrc=1;
 write_enable = 1;
//fifth
#10 RA1 = 3; RA2 = 3; 
#10 WA = 5; ALUControl = 2'b00;immediate=8'd5;ALUSrc=0;
 write_enable = 1;
//sixth
#10 RA1 = 3; RA2 = 5; 
#10 WA = 6;  ALUControl = 2'b01;immediate=8'd5;ALUSrc=0;
write_enable = 1;
//seventh
#10 RA1 = 3; RA2 = 6; 
#10  WA = 15;  ALUControl = 2'b10;immediate=8'd5;ALUSrc=0;
 write_enable = 1;
//eighth
#10 RA1 = 15; RA2 = 3; 
#10 WA = 8;  ALUControl = 2'b11;immediate=8'd5;ALUSrc=0;
write_enable = 1;
$finish; // This system tasks ends the simulation
end
initial begin // Response monitor
$monitor ("t = %3d, RA1 = %b RA2 = %b, \
WA = %b, immediate = %b,write_enable = %b,ALUSrc = %b,CLK=%b,ALUControl=%b,ALUResult=%b, cpu_out = %b, \
Zero=%b", $time,RA1, RA2, WA,immediate,write_enable,ALUSrc,CLK,ALUControl,ALUResult,cpu_out,Zero);
end
endmodule
