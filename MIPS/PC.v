module PC(
    input wire clk, reset,
    input wire [31:0] pc,
    
    output reg [31:0] PC
    );

initial begin
    PC = 0;
end

always @(posedge clk, posedge reset) begin
    if(reset == 1'b1) begin
        PC <= 0;
    end
    else begin
        PC <= pc;
    end
end

endmodule
