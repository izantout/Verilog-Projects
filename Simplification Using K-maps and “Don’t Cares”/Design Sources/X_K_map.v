module X_K_map(
    input a,
    input b,
    input c,
    input d,
    output XK_out
    );
    wire p;
    wire q;
    wire w;
    assign p = ~a & b;
    assign q = b & ~d;
    assign w = ~c & b;
    assign XK_out = p | q | w;
endmodule
