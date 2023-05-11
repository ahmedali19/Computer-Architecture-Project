module Mux2x1
(
    input sel,
    input [63:0] in1,
    input [63:0] in2,
    output reg [63:0] out
);

always @(*) out = sel ? in2 : in1;

endmodule