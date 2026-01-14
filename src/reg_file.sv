module reg_file(input logic [3:0] RA1,RA2,WA,
           input logic [7:0] ALUResult,
           input logic write_enable, clk,
           output logic [7:0] RD1,RD2,cpu_out);
logic [7:0] rf [0:15];
//when clock in rising edge
always_ff @ (posedge clk) 
  begin
    if (write_enable && WA > 0) // write to register A3 if enabled and address is not 0
    rf[WA] <= ALUResult;
    rf[0]=0; //position 0 equal to 0
  end
assign RD1 = rf[RA1]; // output value of register at address RA1
assign RD2 = rf[RA2]; // output value of register at address RA2
assign cpu_out = rf[15]; // output value of register at address 15
endmodule 