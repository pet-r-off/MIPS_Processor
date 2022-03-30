module ALU_logic(
    input wire [31:0]WriteData, // RF RD2 output
    input wire [31:0]ImmSign,   // Imm Extend output
    input wire [31:0]SrcA,      // RF RD1 output

    input wire [2:0]ALUControl,
    input wire ALUSrc,          // MUX SrcB control

    output wire zero,
    output wire [31:0]ALUResult

    );


// // ALU logic
wire[31:0]SrcB;   // MUX output

MUX #(32) alu_mux( .state_1(WriteData), .state_2(ImmSign), .Control(ALUSrc), .Out_Mux(SrcB)  );        

ALU alu(  .A(SrcA), .B(SrcB), .ALU_Control(ALUControl), .zero(zero), .ALU_Result(ALUResult) );


endmodule
