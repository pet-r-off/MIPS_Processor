module Main_Decoder(
    input wire[5:0]OPcode,

    output reg MemToReg,
    output reg MemWrite,
    output reg Branch,
    output reg ALUSrc,
    output reg RegDst,
    output reg RegWrite,
    output reg Jump,

    output reg [1:0]ALUOp

    );

always @(*) begin
    case (OPcode)
        6'b000000: begin         // R-type
            RegWrite <= 1'b1;
            RegDst   <= 1'b1;
            ALUSrc   <= 1'b0;
            Branch   <= 1'b0;
            MemToReg <= 1'b0;
            MemWrite <= 1'b0;
            ALUOp[1:0] <= 2'b10;
            Jump     <= 1'b0;
        end


        6'b100011: begin        // lw
            RegWrite <= 1'b1;
            RegDst   <= 1'b0;
            ALUSrc   <= 1'b1;
            Branch   <= 1'b0;
            MemToReg <= 1'b0;
            MemWrite <= 1'b1;
            ALUOp[1:0] <= 2'b00;
            Jump     <= 1'b0;
        end


        6'b101011: begin        // sw
            RegWrite <= 1'b0;
            RegDst   <= 1'bx;
            ALUSrc   <= 1'b1;
            Branch   <= 1'b0;
            MemToReg <= 1'b1;
            MemWrite <= 1'bx;
            ALUOp[1:0] <= 2'b00;
            Jump     <= 1'b0;
        end


        6'b000100: begin      // beq
            RegWrite <= 1'b0;
            RegDst   <= 1'bx;
            ALUSrc   <= 1'b0;
            Branch   <= 1'b1;
            MemToReg <= 1'b0;
            MemWrite <= 1'bx;
            ALUOp[1:0] <= 2'b01;
            Jump     <= 1'b0;
        end


        6'b001000: begin     // addi
            RegWrite <= 1'b1;
            RegDst   <= 1'b0;
            ALUSrc   <= 1'b1;
            Branch   <= 1'b0;
            MemToReg <= 1'b0;
            MemWrite <= 1'b0;
            ALUOp[1:0] <= 2'b00;
            Jump     <= 1'b0;
        end


        6'b000010: begin     // jump
            RegWrite <= 1'b0;
            RegDst   <= 1'bx;
            ALUSrc   <= 1'bx;
            Branch   <= 1'bx;
            MemToReg <= 1'b0;
            MemWrite <= 1'bx;
            ALUOp[1:0] <= 2'bxx;
            Jump     <= 1'b1;
        end



        default: begin
                MemToReg <= 1'bx; 
                MemWrite <= 1'bx;
                Branch <= 1'bx;
                ALUSrc <= 1'bx;
                RegDst <= 1'bx;
                RegWrite <= 1'bx;
                Jump <= 1'bx;
                ALUOp[1:0] <= 2'bxx;
        end

    endcase
end


endmodule
