`timescale 1ns / 1ps
module TB_Pipelined_Processor();
reg CLK,RST;
wire [63:0]	y_data_mem0,
            y_data_mem1,
            y_data_mem2,
            y_data_mem3,
            y_data_mem4,
            y_data_mem5,
            y_data_mem6,
            y_data_mem7,
            y_data_mem8,
            y_data_mem9;
  
Pipelined_Processor PP (
    .CLK(CLK),
    .RST(RST),
    .x_data_mem0(y_data_mem0),
    .x_data_mem1(y_data_mem1),
    .x_data_mem2(y_data_mem2),
    .x_data_mem3(y_data_mem3),
    .x_data_mem4(y_data_mem4),
    .x_data_mem5(y_data_mem5),
    .x_data_mem6(y_data_mem6),
    .x_data_mem7(y_data_mem7),
    .x_data_mem8(y_data_mem8),
    .x_data_mem9(y_data_mem9)
);
  
initial begin
	CLK = 1'b0;
  	RST = 1'b0;
end

always #5 CLK = ~CLK;

endmodule