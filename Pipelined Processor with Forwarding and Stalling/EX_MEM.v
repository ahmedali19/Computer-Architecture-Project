module EX_MEM
(
    input CLK,RST, 
    input [63:0] next_pc2, 
    input [4:0] rdIDEX,
    input MemtoRegIDEX, RegWriteIDEX, BranchIDEX, MemWriteIDEX, MemReadIDEX, less, 
    input [2:0] funct3IDEX, 
    input zero, 
    input [63:0] alu_result,
    output reg [63:0] next_pcEXMEM, 
    output reg [4:0] rdEXMEM, 
    output reg MemtoRegEXMEM, RegWriteEXMEM, BranchEXMEM, MemWriteEXMEM, MemReadEXMEM, zeroEXMEM, 
    output reg [63:0] alu_resultEXMEM, 
    output reg lessEXMEM, 
    output reg [4:0] funct3EXMEM);
    
    always@(posedge CLK)
	begin
	  if(RST == 1'b0)
        begin
          next_pcEXMEM = next_pc2;
          alu_resultEXMEM = alu_result;
          MemtoRegEXMEM =  MemtoRegIDEX;
          RegWriteEXMEM = RegWriteIDEX;
          BranchEXMEM = BranchIDEX;
          MemWriteEXMEM = MemWriteIDEX;
          MemReadEXMEM = MemReadIDEX;
          rdEXMEM = rdIDEX;
          zeroEXMEM = zero;
        end
	  else
        begin
          next_pcEXMEM = 0;
          alu_resultEXMEM = 0;
          MemtoRegEXMEM =  0;
          RegWriteEXMEM = 0;
          BranchEXMEM = 0;
          MemWriteEXMEM = 0;
          MemReadEXMEM = 0;
          rdEXMEM = 0;
          zeroEXMEM = 0;
        end
	end
    

endmodule