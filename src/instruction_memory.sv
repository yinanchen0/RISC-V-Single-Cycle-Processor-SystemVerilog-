module instruction_memory(input logic [7:0] pc,
                         output logic [23:0] Instr);
logic [23:0] data_instruction_memory [0:255];
initial
$readmemh("program.txt",data_instruction_memory);//READ FILE
assign Instr= data_instruction_memory[pc];
endmodule
 