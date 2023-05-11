`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/05/2023 12:38:14 PM
// Design Name: 
// Module Name: forwarding _unit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module forwarding_unit(
    input [4:0] rdEXMEM, rdMEMWB,
    input RegWriteEXMEM, RegWriteMEMWB,
    output [1:0] forwardA, forwardB
    );
    always @ (*)
  begin
    if (RegWriteEXMEM && rd_EXMEM != 0 && Rd_EXMEM == Rs1_IDEX)
        ForwardA = 2'b10;
    else if (RegWrite_MEMWB && Rd_MEMWB != 5'b0 &&  Rd_MEMWB == rs1)
       ForwardA = 2'b01;
    else 
      ForwardA = 2'b00; 
    
   if (RegWriteEXMEM && rdEXMEM != 5'b0 && rd_EXMEM == rs1)
        ForwardB = 2'b10;
    else if (RegWrite_MEMWB && rdMEMWB != 5'b0 &&  rdMEMWB == rs1)
       ForwardB = 2'b01;
    else 
      ForwardB = 2'b00; 
  end
endmodule
