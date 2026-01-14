`timescale 1ps/1ps
`include "reg_file.sv"
module reg_file_tb;
logic [3:0] RA1, RA2, WA;
logic clk, reset, write_enable;
logic [7:0] data_in, data_out1, data_out2;
reg_file dut (RA1, RA2, WA, data_in, clk, reset, write_enable, data_out1, data_out2);
initial begin // Generate clock signal with 20 ns period
clk = 0;
forever #10 clk = ~clk;
end
initial begin // Apply stimulus
$dumpfile("reg_file_tb.vcd");
$dumpvars(0, reg_file_tb);
RA1 = 1; RA2 = 2; WA = 0; data_in = 5; write_enable = 0;
reset = 1;
#10 reset = 0;
#15 write_enable = 1;
#20 WA = 1; data_in = 7;
#20 WA = 5; data_in = 13;
#20 write_enable = 0;
#20 RA2 = 5;
#30;
$finish; // This system tasks ends the simulation
end
initial begin // Response monitor
$monitor ("t = %3d, clk = %b, reset = %b, RA1 = %b RA2 = %b, \
WA = %b, write_enable = %b, data_in = %b, data_out1 = %b, \
data_out2 = %b", $time, clk, reset, RA1, RA2, WA, write_enable, data_in, data_out1, data_out2);
end
endmodule
