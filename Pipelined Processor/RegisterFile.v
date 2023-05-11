module RegisterFile
(
    input CLK,RST,RegWrite,
    input [4:0] rs1,rs2,rd,
    input [63:0] write_data,
    output reg [63:0] read_data1,read_data2
);

reg [63:0] REGFILE [31:0];
integer i;
initial begin
    for(i=0; i<32; i=i+1)
        REGFILE[i]=0;
end

always @(posedge CLK) begin
    if(RegWrite && rd != 0) REGFILE[rd] = write_data;
end

always @(*) begin
    if(RST) begin
        read_data1 = 0;
        read_data2 = 0;
    end
    else begin
        read_data1 = REGFILE[rs1];
        read_data2 = REGFILE[rs2];
    end
end

endmodule