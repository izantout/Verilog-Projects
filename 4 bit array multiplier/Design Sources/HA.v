module HA(    
    input a, 
    input b,
    output c_out,
    output sum
);

    assign {c_out, sum} = a + b;
endmodule
