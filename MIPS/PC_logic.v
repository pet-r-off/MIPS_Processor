module PC_logic(
    input wire clk, reset,
    input wire [31:0] ImmSign, // input Sign Immidiate
    input wire [25:0] JUMP,    // input from Instr [25:0]

    input wire Jump_Control,
    input wire PCSrc,

    output wire [31:0]PC
    );


// PC logic
wire[31:0]pc_next; //MUX PC out
wire[31:0]pc_plus4; // ADDER + 4 out
wire[31:0]next_count; // MUX_JUMP out

PC pc_reg( .clk(clk), .reset(reset), .pc(next_count), .PC(PC));
ADDER pc_add( .in_1(PC), .in_2(32'd1), .out(pc_plus4));       // tut vmesto add+4 -> add+1 !!!!


// wire[31:0]ImmSign; // Sign Ext out / s12 in                              
wire[31:0]ImmSignLS; // s12 out
wire[31:0]PCBranch; // ADDER branch out

s12 immSL( .a(ImmSign), .y(ImmSignLS) );
ADDER pc_addbr( .in_1(ImmSignLS), .in_2(pc_plus4), .out(PCBranch));

MUX #(32) pc_mux( .state_1(pc_plus4), .state_2(PCBranch), .Control(PCSrc), .Out_Mux(pc_next) );


//JUMP logic

wire[27:0]jump_to_mux;
wire[31:0]jump_plus_4;

assign jump_plus_4 = {pc_plus4[31:28], jump_to_mux};



s12 jump_sl(  .a(JUMP), .y(jump_to_mux)  );

MUX #(32) mux_jump( .state_1(pc_next), .state_2(jump_plus_4), .Control(Jump_Control), .Out_Mux(next_count) );

endmodule
