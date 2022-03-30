module ALU_Decoder(
    input wire[5:0]Funct,
    input wire[1:0]ALUOp,

    output reg[2:0]ALUControl
    );

always @(*) begin
   case (ALUOp)
       2'b00: ALUControl[2:0] <= 3'b010;   // lw sw addi
       2'b01: ALUControl[2:0] <= 3'b110;   // beq
       default: begin

           case (Funct)                   // R-type
               6'b100000: ALUControl[2:0] <= 3'b010; //  add +
               6'b100010: ALUControl[2:0] <= 3'b110; //  sub -
               6'b100100: ALUControl[2:0] <= 3'b000; //  and
               6'b100101: ALUControl[2:0] <= 3'b001; //  or
               6'b101010: ALUControl[2:0] <= 3'b111; //  slt

               default: ALUControl[2:0] <= 3'bxxx;
           endcase

       end
   endcase 
end


endmodule
