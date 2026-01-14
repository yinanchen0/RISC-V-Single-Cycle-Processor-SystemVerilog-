`timescale 1ps/1ps
`include "instruction_memory_pc.sv"

module instruction_memory_pc_tb;
logic [7:0] immediate;
logic [23:0] Instr;
logic PCSrc, CLK, reset;
instruction_memory_pc dut(immediate,PCSrc, CLK, reset,Instr);

initial begin // Generate clock signal with 20 ns period
CLK = 1;
forever #10 CLK = ~CLK;
end

initial begin // Apply stimulus
$dumpfile("instruction_memory_pc.vcd");
$dumpvars(0, instruction_memory_pc_tb);
reset=1;//00
//first vector
#20 immediate = 1; PCSrc = 1; reset = 1; //00
//second
#20 immediate = 1; PCSrc = 0; reset = 0; //01
//third
#20 immediate = 0; PCSrc = 0; reset = 0; //02
//fourth
#20 immediate = 0; PCSrc = 0; reset = 0; //03
//fifth
#20 immediate = 0; PCSrc = 0; reset = 0; //04
//sixth
#20 immediate = 0 ; PCSrc = 0; reset =0; //05
//seventh
#20 immediate = 6; PCSrc = 1; reset = 0; //06

//eighth
#20 immediate = 7; PCSrc = 1; reset = 0; //07
#20
$finish; // This system tasks ends the simulation
end
initial begin // Response monitor
$monitor ("t = %3d, CLK = %b, immediate=%b,PCSrc = %b reset = %b, \
Instr = %h", $time, CLK, immediate, PCSrc, reset, Instr);
end
endmodule