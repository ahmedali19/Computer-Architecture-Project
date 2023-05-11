`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/04/2023 05:40:05 PM
// Design Name: 
// Module Name: MEM_WB
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


module MEM_WB(
    input CLK,RST,
    input [4:0] rdEXMEM,
    input MemtoRegEXMEM, RegWriteEXMEM, MemWriteEXMEM, MemReadEXMEM,  
    input [63:0] alu_resultEXMEM,
    output reg [4:0] rdMEMWB,
    input  [63:0] read_data, 
    output reg [63:0] read_dataMEMWB,
    output reg MemtoRegMEMWB, RegWriteMEMWB, MemWriteMEMWB, MemReadMEMWB, 
    output reg[63:0] alu_resultMEMWB
    );
    
  always@(posedge CLK)
  begin 
    if(RST == 1'b0)
      begin
      alu_resultMEMWB = alu_resultEXMEM;
      read_dataMEMWB = read_data;
      rdMEMWB = rdEXMEM;
      MemtoRegMEMWB = MemtoRegEXMEM;
      RegWriteMEMWB = RegWriteEXMEM;
        
      end
   else
     begin
      alu_resultMEMWB = 64'b0;
      read_dataMEMWB = 64'b0;
      rdMEMWB = 5'b0;
      MemtoRegMEMWB = 1'b0;
      RegWriteMEMWB = 1'b0;
     end
   end
endmodule
