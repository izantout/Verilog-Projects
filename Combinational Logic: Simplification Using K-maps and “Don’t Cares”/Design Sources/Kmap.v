module Kmap(
    input a,
    input b,
    input c,
    input d,
    output k_out
    );
    wire p;
    wire q;
    wire w;
    wire e;
    assign p = (~a & b & ~d);
    assign q = (a & b & ~c & d);
    assign w = (~a & b & c);
    assign e = (b & c & ~d);
    
assign k_out = p | q | w | e;
    
    
endmodule
