module twoinputorgate_tb( // Using 4to1 mux
    );
    reg in0_tb;
    reg in1_tb;
    
    wire o_tb;
    
    twoinputorgate uut (.in0(in0_tb), .in1(in1_tb), .o(o_tb));
    
    initial begin
    
    in1_tb =0;
    in0_tb =0;
    #100;

    in1_tb =0;
    in0_tb =1;
    #100;

    in1_tb =1;
    in0_tb =0;
    #100;

    in1_tb =1;
    in0_tb =1;
    #100;
        
    $finish;
    end
    
endmodule
