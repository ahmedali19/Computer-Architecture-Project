`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/05/2023 11:58:28 AM
// Design Name: 
// Module Name: Hazard_detection_unit
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


module Hazard_detection_unit(
    input [4:0] rdIDEX, rs1, rs2,
    input MemReadIDEX,
    output reg IFIDwrite, PCWrite, control_mux
    );
    always @(*)
    begin
      if ((MemReadIDEX==1) && ((rdIDEX == rs1) || (rdIDEX == rs2)))
        begin
          PCWrite = 0;
          IFIDwrite = 0;
          control_mux = 0;
        end
      else
        begin
          PCWrite =1;
          IFIDwrite = 1;
          control_mux = 1;
        end
    end
endmodule
