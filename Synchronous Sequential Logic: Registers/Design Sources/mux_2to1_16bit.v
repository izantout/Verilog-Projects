module mux_2to1_16bit(
    input [15:0] In0,
    input [15:0] In1,
    input Sel,
    output reg [15:0] Mux_out
    );
    
    always @(In0,In1,Sel)
        case(Sel)
        0 : Mux_out = In0;
        1 : Mux_out = In1;
        default: Mux_out <= 16'bZ;
        endcase
endmodule
