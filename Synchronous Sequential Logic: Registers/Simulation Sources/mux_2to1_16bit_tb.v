module mux_2to1_16bit_tb();
     reg [15:0] In0_tb;
     reg [15:0] In1_tb;
     reg Sel_tb;
     wire [15:0] Mux_out_tb;
    
    mux_2to1_16bit uut(.In0(In0_tb), .In1(In1_ttb), .Sel(Sel_tb), .Mux_out(Mux_out_tb));
    
    initial
    begin
    In0_tb = 16'h0001;
    In1_tb = 16'h0000;
    Sel_tb = 0;
    #100;
    
    Sel_tb = 1;
    
    end
endmodule
