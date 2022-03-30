module ALU(

    input wire [2:0] ALU_Control,
    input wire [31:0] A,
    input wire [31:0] B,

    output reg zero,
    output reg [31:0] ALU_Result
);


always @(*) begin
    case (ALU_Control)
        3'b000: begin
            ALU_Result <= A & B; // and
        end 
        3'b001: begin
            ALU_Result <= A | B; // or
        end 
        3'b010: begin
            ALU_Result <= A + B; // +
        end 
        3'b011: begin
            ALU_Result <= 0;
        end 
        3'b100: begin
            ALU_Result <= A & (!B); //  A and not B
        end                                        // some issue ! or ~  logic inversion or bit not?
        3'b101: begin
            ALU_Result <= A | (!B); //  A or not B
        end 
        3'b110: begin
            ALU_Result <= A - B; // -
            // if (ALU_Result == 0) begin
            //     zero <= 1;
            // end
        end 
        3'b111: begin
            if (A > B) begin    // comparison bigger than
                ALU_Result <= 1;
            end
            else begin
                ALU_Result <= 0;
            end
        end 

        default: ALU_Result = 0;
    endcase

if (ALU_Result == 0) begin
    zero <= 1;
end
else begin
    zero <= 0;
end

end

endmodule
