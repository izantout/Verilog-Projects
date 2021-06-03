module top_counter_32bit(
    input clk_top,
    input reset_top,
    input count_en_top,
    input Sel_top,
    output [15:0] Q_top
    );
    
    wire [31:0] Q_Mux;
    
    counter_32bits cnt(.clk(clk_top), .reset(reset_top), .count_en(count_en_top), .Q(Q_Mux));
    mux_2to1_16bit mux(.In0(Q_Mux[15:0]), .In1(Q_Mux[31:16]), .Sel(Sel_top), .Mux_out(Q_top));
    
endmodule
