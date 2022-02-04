module twoinputorgate( // Using 4to1 mux
    input in0,
    input in1,
    output o
    );
    
    mux_4to1 uut1 (.a(1'b1), .b(1'b1), .c(1'b1), .d(1'b0), .sel({in1,in0}), .out(o));
    
endmodule
