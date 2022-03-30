`timescale 1ns / 1ps

module TOP_tb();
reg clk;
reg reset;

wire[31:0]RFrd2_to_DM;
wire[31:0]ALU_to_DM;

TOP dut(
    .clk(clk), .reset(reset), 
    .RFrd2_to_DM(RFrd2_to_DM), .ALU_to_DM(ALU_to_DM)
);

initial begin
    clk =0;
    reset =0;
end


always #5 clk = !clk;

initial begin
    reset =1;
    #10;
    reset =0;
    #10;
end


endmodule
