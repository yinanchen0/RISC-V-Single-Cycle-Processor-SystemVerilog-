module instruction_memory_pc(input logic [7:0] immediate,
                             input logic PCSrc, CLK, reset,
                         output logic [23:0] Instr);
//define inter-connection                 
logic [23:0] data_instruction_memory_pc [0:255];
logic [7:0] PC, az;

always_ff @ (posedge CLK) 
  begin
    if (reset) 
    PC <= 8'b0;//assign 8'b0 to PC
    else 
    PC <= az;//assign az to PC
  end
assign az=(PCSrc)? immediate:(8'b1+PC);
initial
//read file
$readmemh("program.txt",data_instruction_memory_pc);
assign Instr= data_instruction_memory_pc[PC];

endmodule