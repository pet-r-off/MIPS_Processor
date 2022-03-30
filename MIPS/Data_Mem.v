module Data_Mem(
    input wire clk,
    input wire WE,
    input wire [31:0] A,
    input wire [31:0] WD,

    output reg [31:0] RD
    );


reg [31:0] memory [63:0];


always @(posedge clk) begin
    if (WE == 1'b1) begin
        memory[A] <= WD;
    end
    else if (WE == 1'b0) begin
        RD <= memory[A];
    end
end

endmodule
