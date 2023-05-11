`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/05/2023 12:45:19 PM
// Design Name: 
// Module Name: forwarding_unit
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
    input [4:0] rs1IDEX, rs2IDEX,
    output reg [1:0] forwardA, forwardB
    );
    always @ (*)
  begin
    if (RegWriteEXMEM && rdEXMEM != 0 && rdEXMEM == rs1IDEX)
        forwardA = 2'b10;
    else if (RegWriteMEMWB && rdMEMWB != 5'b0 &&  rdMEMWB == rs1IDEX)
       forwardA = 2'b01;
    else 
       forwardA = 2'b00; 
    
   if (RegWriteEXMEM && rdEXMEM != 5'b0 && rdEXMEM == rs2IDEX)
        forwardB = 2'b10;
    else if (RegWriteMEMWB && rdMEMWB != 5'b0 &&  rdMEMWB == rs2IDEX)
       forwardB = 2'b01;
    else 
       forwardB = 2'b00; 
  end
endmodule
