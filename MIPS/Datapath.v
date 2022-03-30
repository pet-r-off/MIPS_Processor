module Datapath(
    input wire clk, reset,

    input wire PCSrc,    // Control inputs
    input wire RegWrite,
    input wire RegDst,
    input wire ALUSrc,
    input wire MemToReg,
    input wire Jump_Control,  // JUMP Control


    input wire[2:0]ALUControl,


    input wire[31:0]ReadData,  // main inputs
    input wire[31:0]Instr,
    


    output wire[31:0] PC_out,  // main outputs
    output wire zero,
    output wire[31:0]ALUResult,
    output wire[31:0]WriteData
    );



//PC logic
wire[31:0]ExtOut;


PC_logic PCL(  .clk(clk), .reset(reset), .ImmSign(ExtOut), 
                .JUMP(Instr[25:0]), .Jump_Control(Jump_Control), .PCSrc(PCSrc),   // Jump added
                .PC(PC_out) 
);



//Register file logic
wire[31:0]RD1toALU;

Register_file_logic RFL(  .clk(clk), .Instr(Instr), .RegWrite(RegWrite), .RegDst(RegDst), 
            .MemToReg(MemToReg), .ALUResult(ALUResult), .ReadData(ReadData), 

            .SrcA(RD1toALU), .WriteData(WriteData), .ImmSign(ExtOut)  
);





//ALU logic

ALU_logic ALUL( .WriteData(WriteData), .ImmSign(ExtOut), .SrcA(RD1toALU), .ALUControl(ALUControl), 
                .ALUSrc(ALUSrc), .zero(zero), .ALUResult(ALUResult)  );


endmodule
