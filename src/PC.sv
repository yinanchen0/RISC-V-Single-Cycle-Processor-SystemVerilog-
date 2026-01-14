module PC(input logic [7:0] immediate,
          input logic PCSrc, clk, reset,
          output logic [7:0] PC);
wire [7:0] az;
assign az=(PCSrc)? immediate:(8'b1+PC);
always_ff @ (posedge clk) 
  begin
    if (reset) 
    PC <= 8'b0;
    else 
    PC = az;
  end
endmodule 