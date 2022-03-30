module Register_File(
    input wire clk,
    input wire WE3,

    input wire [4:0] A1,
    input wire [4:0] A2,
    input wire [4:0] A3,
    input wire [31:0] WD3,

    output wire [31:0] RD1,
    output wire [31:0] RD2   
    );


reg [31:0] mem [31:0];


always @(posedge clk) begin
    if (WE3 == 1'b1) begin
        mem[A3] <= WD3;
    end
    // else if(WE3 == 1'b0) begin
    //     RD1 <= mem[A1];
    //     RD2 <= mem[A2];     
    // end
end
    
assign RD1 = (A1 != 0) ? mem[A1] :0;
assign RD2 = (A2 != 0) ? mem[A2] :0;

endmodule
