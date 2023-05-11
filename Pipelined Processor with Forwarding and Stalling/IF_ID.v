module IF_ID
(
    input CLK,RST, 
    input [63:0] inst,
    input [63:0] pc, 
    output IFIDwrite,
    output reg [63:0] pcIFID,
    output reg [63:0] ins); 
always@(posedge CLK)
    begin
      if (RST == 1'b1)
        begin
          pcIFID = 64'b0;
          ins = 64'b0;
        end
      else if (IFIDwrite)
        begin
          pcIFID = pc;
          ins = inst;
        end
    end
    
    

endmodule