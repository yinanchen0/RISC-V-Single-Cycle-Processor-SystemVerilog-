`include"reg_file_alu.sv"         // Include all modules being used in this module
`include"instruction_memory_pc.sv"
`include"control_unit.sv"
 
module cpu(input logic CLK,reset,  // Declare the variables 
          output logic [7:0] ALUResult,cpu_out          
          );
                                     
instruction_memory_pc dut1(immediate,PCSrc, CLK, reset,Instr); // Declare the input & output in used modules
control_unit dut2(opcode,ALUControl,Branch, ALUSrc, RegWrite);
reg_file_alu  dut3(RA1, RA2, WA,immediate,write_enable,ALUSrc,CLK,ALUControl,ALUResult,cpu_out,Zero);
// define variables that mentioned above, but not inside the cpu module
logic [7:0] immediate; 
logic [3:0]opcode,RA1, RA2,WA;    
logic [1:0] ALUControl;   
logic Branch, ALUSrc, RegWrite,PCSrc,Zero;
logic [23:0] Instr;
//assign the variable mentioned above
assign write_enable=RegWrite;
assign RA1 = Instr[15:12];
assign RA2 = Instr[11:8];
assign WA=Instr[19:16];
assign immediate = Instr[7:0];
assign PCSrc=Branch&Zero;
assign opcode =Instr[23:20];

endmodule