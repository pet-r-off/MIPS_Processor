module MIPS(
    input wire clk,
    input wire reset,

    input wire[31:0]Instr,
    input wire[31:0]ReadData,


    output wire MemWrite,

    output wire[31:0]PC,
    output wire[31:0]ALUOut,
    output wire[31:0]WriteData

    );


wire PC_Src;
wire Reg_Write;
wire Reg_Dst;
wire Mem_To_Reg;
wire ALU_Src;
wire[2:0]ALU_Control;
wire Z_ero;
wire Jump_Cntrl;

Datapath DP( 
        .clk(clk), .reset(reset), .PCSrc(PC_Src), 
        .RegWrite(Reg_Write), .RegDst(Reg_Dst), .MemToReg(Mem_To_Reg), 
        .ALUSrc(ALU_Src), .Jump_Control(Jump_Cntrl), .ALUControl(ALU_Control), .ReadData(ReadData), 
        .Instr(Instr[31:0]), .PC_out(PC), .zero(Z_ero), .ALUResult(ALUOut), 
        .WriteData(WriteData)
 );


Control_Unit CU(
        .Op(Instr[31:26]), .Funct(Instr[5:0]), .zero(Z_ero), .RegWrite(Reg_Write), 
        .RegDst(Reg_Dst), .ALUSrc(ALU_Src), .ALUControl(ALU_Control), 
        .MemWrite(MemWrite), .MemToReg(Mem_To_Reg), .PCSrc(PC_Src), .Jump(Jump_Cntrl)
);







endmodule
