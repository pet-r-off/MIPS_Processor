module TOP(

    input wire clk,
    input wire reset,
    

    output wire[31:0]RFrd2_to_DM,
    output wire[31:0]ALU_to_DM    //   need to be fixed


    );


wire[31:0]PC_to_IM;
wire[31:0]IM_to_Instr;
wire Mem_Write;
// wire[31:0]ALU_to_DM;      // 
// wire[31:0]RFrd2_to_DM;    //
wire[31:0]DM_to_RF;       //


MIPS CPU(  .clk(clk), .reset(reset), .Instr(IM_to_Instr), 
            .ReadData(DM_to_RF), .MemWrite(Mem_Write), 
            .PC(PC_to_IM), .ALUOut(ALU_to_DM), .WriteData(RFrd2_to_DM)
);

Instr_Mem IM(  .A(PC_to_IM), .RD(IM_to_Instr)  );

Data_Mem DM(   .clk(clk), .WE(Mem_Write), .A(ALU_to_DM), 
                .WD(RFrd2_to_DM), .RD(DM_to_RF)  
);

endmodule
