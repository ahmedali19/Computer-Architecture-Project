module BranchControl
(
    input Branch,zero,less,
    input [2:0] funct3,
    output reg BrCtrl
);

initial BrCtrl = 1'b0;
always @(*) begin
    if(Branch) begin
        case(funct3)
            3'b000: BrCtrl = zero; // beq
            3'b001: BrCtrl = ~zero; // bne
            3'b100: BrCtrl = less; // blt
            3'b101: BrCtrl = ~less; // bge
            default: BrCtrl = 1'b0;
        endcase
    end
    else BrCtrl = 1'b0;
end

endmodule