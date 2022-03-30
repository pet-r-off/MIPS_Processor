module Instr_Mem(
    input wire [31:0] A,

    output reg [31:0] RD
    );

reg [31:0] MEM [63:0];

initial begin
    $readmemh("test.mem", MEM); 
end

always @(*) begin
    RD <= MEM[A];
end

endmodule
