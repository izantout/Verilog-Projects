module Boolean_function(
    input a,
    input b,
    input c,
    output z
    );
    
    //implement z = ab' + a'c
    
    wire p; //for ab'
    wire q; //for a'c
    
    assign p = a & ~b;
    assign q = ~a & c;
    assign z = p | q;
    
endmodule
