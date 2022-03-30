module ADDER(
    input wire[31:0] in_1,
    input wire[31:0] in_2,
    output wire[31:0] out
    );


assign out = in_1 + in_2;

endmodule 