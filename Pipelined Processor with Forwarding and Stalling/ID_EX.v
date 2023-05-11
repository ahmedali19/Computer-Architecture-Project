`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/04/2023 06:26:46 PM
// Design Name: 
// Module Name: ID_EX
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


module ID_EX(
    input CLK,RST, 
    input [63:0] pcIFID, read_data1, read_data2,
    output reg [63:0] pcIDEX, read_data1IDEX, read_data2IDEX, imm, immeIDEX, 
    input [4:0] rd,
    input [2:0] funct3,
    output reg [4:0] rdIDEX,
    input MemtoReg, RegWrite, Branch, MemWrite, MemRead, ALUSrc, 
    input [1:0] ALUOp,
    output reg [4:0] rdIDEX,
    output reg MemtoRegIDEX, RegWriteIDEX, BranchIDEX, MemWriteIDEX, MemReadIDEX, ALUSrcIDEX,
    output reg [1:0] ALUOpIDEX,
    output reg [2:0] funct3IDEX
    );
    
    always@(posedge CLK)
	begin
      if(RST == 1'b0)
        begin
          pcIDEX = pcIFID;
          read_data1IDEX = read_data1;
          read_data2IDEX = read_data2;
          immeIDEX = imm;
          funct3IDEX = funct3;
          rdIDEX = rd;
          MemtoRegIDEX =  MemtoReg;
          RegWriteIDEX = RegWrite;
          BranchIDEX = Branch;
          MemWriteIDEX = MemWrite;
          MemReadIDEX = MemRead;
          ALUSrcIDEX = ALUSrc;
          ALUOpIDEX = ALUOp;
        end
      else
        begin
          pcIDEX = 0;
          read_data1IDEX = 0;
          read_data2IDEX = 0;
          immeIDEX = 0;
          funct3IDEX = 0;
          rdIDEX = 0;
          MemtoRegIDEX =  0;
          RegWriteIDEX = 0;
          BranchIDEX = 0;
          MemWriteIDEX = 0;
          MemReadIDEX = 0;
          ALUSrcIDEX = 0;
          ALUOpIDEX = 0;
        end
	end
endmodule
