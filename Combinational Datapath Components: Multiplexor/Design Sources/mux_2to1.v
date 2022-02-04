module mux_2to1(
    input a,
    input b,
    input c,
    output out
    );
    
    assign out = (c) ? a:b;
    
endmodule
