module mux_4to1( // Using 3 2to1 mux
    input a,
    input b,
    input c,
    input d,
    input [1:0]sel,
    output out
    );
    
    wire out1;
    wire out2;
    
    mux_2to1 uut1(.a(a), .b(b), .c(sel[0]), .out(out1));
    mux_2to1 uut2(.a(c), .b(d), .c(sel[0]), .out(out2));
    mux_2to1 uut3(.a(out1), .b(out2), .c(sel[1]), .out(out));
    
endmodule
