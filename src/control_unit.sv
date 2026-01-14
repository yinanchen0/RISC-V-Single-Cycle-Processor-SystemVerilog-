module control_unit(input logic [3:0] opcode,
          output logic [1:0] ALUControl,
          output logic Branch, ALUSrc, RegWrite
          );
always_comb begin
    case(opcode)
    4'b0000:  begin RegWrite =1;ALUSrc=0;Branch=0;ALUControl=2'b00;end
    4'b0001: begin RegWrite =1;ALUSrc=0;Branch=0;ALUControl=2'b01;end
    4'b0010:  begin RegWrite =1;ALUSrc=0;Branch=0;ALUControl=2'b10;end
    4'b0011:  begin RegWrite =1;ALUSrc=0;Branch=0;ALUControl=2'b11;end
    4'b0100:  begin RegWrite =1;ALUSrc=1;Branch=0;ALUControl=2'b00;end
    4'b0101:  begin RegWrite =1;ALUSrc=1;Branch=0;ALUControl=2'b01;end
    4'b0110:  begin RegWrite =1;ALUSrc=1;Branch=0;ALUControl=2'b10;end
    4'b0111: begin RegWrite =0;ALUSrc=0;Branch=1;ALUControl=2'b11;end
    endcase    

end
endmodule
