module Sign_Extend(
    input wire [15:0] imm,

    output reg [31:0] sign_imm
    );


always @(*) begin
    sign_imm <= { {16{imm[15]}}, imm };
end

endmodule
