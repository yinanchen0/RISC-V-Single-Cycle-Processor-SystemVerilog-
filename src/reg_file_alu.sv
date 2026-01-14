module reg_file_alu(input logic [3:0] RA1,RA2,WA,
           input logic [7:0] immediate,
           input logic write_enable,ALUSrc,clk,
           input logic [1:0] ALUControl,
           output logic [7:0] ALUResult,cpu_out,
           output logic Zero);
//interconnection          
 logic [7:0] rf [0:15];
 logic [7:0] SrcA,SrcB,RD2;

assign SrcA = rf[RA1]; // output value of register at address RA1
assign RD2 = rf[RA2];
assign SrcB = (ALUSrc)? immediate : RD2; 
//select between immuediate and RD2, which depends on ALUSrc, when it==0, choose RD2
assign cpu_out = rf[15]; // output value of register at address 15
//when clock in rising edge
always_ff @ (posedge clk) 
  begin
    if (write_enable && WA > 0)
    begin // write to register A3 if enabled and address is not 0
        rf[WA] <= ALUResult;
    end
    rf[0]<=8'd0;
  end
always_comb 
case(ALUControl)
    2'b00 : ALUResult = SrcA & SrcB; // bitwise SrcA AND SrcB
    2'b01 : ALUResult = SrcA | SrcB; // bitwise SrcA OR SrcB
    2'b10 : ALUResult = SrcA + SrcB; // addition SrcA + SrcB
    2'b11 : ALUResult = SrcA - SrcB; // subtraction SrcA - SrcB
endcase    
always_latch begin 
    if(ALUResult == 0) 
        Zero = 1;
    else 
        Zero = 0;
end
endmodule