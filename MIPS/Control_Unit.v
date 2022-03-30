module Control_Unit(
    input wire[5:0]Op,
    input wire[5:0]Funct,

    input wire zero,

    output wire RegWrite,
    output wire RegDst,
    output wire ALUSrc,
    output wire[2:0]ALUControl,
    output wire MemWrite,
    output wire MemToReg,
    output wire Jump,

    output wire PCSrc
    );


wire[1:0]alu_op;
wire Branch;


Main_Decoder MD(  .OPcode(Op), .MemToReg(MemToReg), 
                .MemWrite(MemWrite), .Branch(Branch), 
                .RegDst(RegDst), .RegWrite(RegWrite),  
                .ALUSrc(ALUSrc), .Jump(Jump),
                .ALUOp(alu_op) );



ALU_Decoder AD(   .Funct(Funct), .ALUOp(alu_op), .ALUControl(ALUControl) );



assign PCSrc = Branch & zero;

endmodule
