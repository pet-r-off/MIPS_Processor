module MUX #(parameter WIDTH = 32)(
    input wire[WIDTH - 1:0] state_1,
    input wire[WIDTH - 1:0] state_2,
    input wire Control,
    output reg[WIDTH - 1:0] Out_Mux
    );


always @(*) begin
    case (Control)
        1'b0: Out_Mux <= state_1;
        1'b1: Out_Mux <= state_2; 
        default: Out_Mux <= 0;
    endcase
end
endmodule
