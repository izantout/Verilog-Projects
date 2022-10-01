module mux_4to1_tb(  // Using 3 2to1 mux
    );
    
    reg a_tb;
    reg b_tb;
    reg c_tb;
    reg d_tb;
    reg [1:0] sel_tb;
    
    wire out_tb;
    
    mux_4to1 uut(.a(a_tb), .b(b_tb), .c(c_tb), .d(d_tb), .sel(sel_tb), .out(out_tb));
    
    initial begin
    a_tb=1;
    b_tb=1;
    c_tb=1;
    d_tb=0;
    sel_tb = 2'b00;
    #100;
    
    a_tb=0;
    b_tb=0;
    c_tb=0;
    d_tb=1;
    sel_tb = 2'b00;
    #100;
    
    a_tb=0;
    b_tb=0;
    c_tb=1;
    d_tb=0;    
    sel_tb = 2'b01;
    #100;
    
    a_tb=1;
    b_tb=1;
    c_tb=0;
    d_tb=1;   
    sel_tb = 2'b01;
    #100;
    
    a_tb=0;
    b_tb=1;
    c_tb=0;
    d_tb=0;    
    sel_tb = 2'b10;
    #100;
    
    a_tb=1;
    b_tb=0;
    c_tb=1;
    d_tb=1;    
    sel_tb = 2'b10;
    #100;
    
    a_tb=1;
    b_tb=0;
    c_tb=0;
    d_tb=0;    
    sel_tb = 2'b11;
    #100;
    
    a_tb=0;
    b_tb=1;
    c_tb=1;
    d_tb=1;                     
    sel_tb = 2'b11;
    #100;
    
    $finish;
    
    end
    
endmodule
