module Register_file_logic(
    input wire clk,

    input wire[31:0] Instr,

    input wire RegWrite,  // RF write enabled control
    input wire RegDst,    // MUX switch Instr to A3
    input wire MemToReg,  // MUX switch ALUResult or ReadData



    input wire [31:0]ALUResult,  //ALU output
    input wire [31:0]ReadData,   // Data File output


    output wire[31:0] SrcA,       // ALU in
    output wire[31:0] WriteData,  // outputs to ALU
    output wire[31:0] ImmSign     // Sign Ext output


    );


// Register file logic
wire[4:0]WriteReg;
wire[31:0]result;


Register_File RF( .clk(clk), .WE3(RegWrite), .A1(Instr[25:21]), .A2(Instr[20:16]),     //Instr input 
 .A3(WriteReg), .WD3(result), .RD1(SrcA), .RD2(WriteData) );

MUX #(5) wr_mux( .state_1(Instr[20:16]), .state_2(Instr[15:11]), .Control(RegDst), .Out_Mux(WriteReg) );

MUX #(32) res_mux( .state_1(ALUResult), .state_2(ReadData), .Control(MemToReg), .Out_Mux(result) ); // ReadData input from DataMem

Sign_Extend SE( .imm(Instr[15:0]), .sign_imm(ImmSign) ); // out to s12


endmodule
