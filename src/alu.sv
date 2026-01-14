module alu(input logic [7:0] SrcA,SrcB,
           input logic [1:0] ALUControl,
           output logic [7:0] ALUResult,
           output logic Zero);
always_comb 
case(ALUControl)
    2'b00 : ALUResult = SrcA & SrcB; // bitwise SrcA AND SrcB
    2'b01 : ALUResult = SrcA | SrcB; // bitwise SrcA OR SrcB
    2'b10 : ALUResult = SrcA + SrcB; // addition SrcA + SrcB
    2'b11 : ALUResult = SrcA - SrcB; // subtraction SrcA - SrcB
default : ALUResult = 8'bx;
endcase    
always_latch begin 
    if(ALUResult == 0) 
        Zero = 1;
    else 
        Zero = 0;
end
endmodule 