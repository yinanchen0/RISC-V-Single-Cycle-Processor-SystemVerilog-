`timescale 1ps/1ps
`include "instruction_memory.sv"
module instruction_memory_tb;
logic [7:0] pc;
logic [23:0] Instr;
instruction_memory dut(pc,Instr);
initial begin
    $dumpfile("instruction_memory_tb.vcd");
    $dumpvars(0, instruction_memory_tb);   
    pc=8'h00;
    #10;   pc= 8'h00;
    #10;   pc= 8'h01;
    #10;   pc= 8'h02;
    #10;   pc= 8'h03;
    #10;   pc= 8'h04;
    #10;   pc = 8'h05;
    #10;   pc = 8'h06;
    #10;   pc = 8'h07;
    #10
    $finish;
 end   
initial begin // Response monitor
$monitor ("t = %3d, pc = %b Instr = %h", $time,pc,Instr);
end
endmodule 