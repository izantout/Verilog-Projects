module mux_2to1_tb(
    );
    reg a_tb;
    reg b_tb;
    reg c_tb;
    
    wire out_tb;
    
    mux_2to1 uut(.a(a_tb), .b(b_tb), .c(c_tb), .out(out_tb));
    
    initial begin
    a_tb = 0;
    b_tb = 0;
    c_tb = 0;
    #100;

    a_tb = 0;
    b_tb = 0;
    c_tb = 1;
    #100;

    a_tb = 0;
    b_tb = 1;
    c_tb = 0;
    #100;

    a_tb = 0;
    b_tb = 1;
    c_tb = 1;
    #100;

    a_tb = 1;
    b_tb = 0;
    c_tb = 0;
    #100;

    a_tb = 1;
    b_tb = 0;
    c_tb = 1;
    #100;

    a_tb = 1;
    b_tb = 1;
    c_tb = 0;
    #100;
    
    a_tb = 1;
    b_tb = 1;
    c_tb = 1;
    #100;
    
    $finish;
    
    end
endmodule
