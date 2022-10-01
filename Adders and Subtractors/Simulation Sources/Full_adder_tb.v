module Full_adder_tb;

reg a_tb;
reg b_tb;
reg ci_tb;

wire s_tb;
wire co_tb;

Full_adder uut(.a(a_tb), .b(b_tb), .ci(ci_tb), .s(s_tb), .co(co_tb));

initial begin

    a_tb = 0;
    b_tb = 0;
    ci_tb = 0;
    #100;

    a_tb = 0;
    b_tb = 0;
    ci_tb = 1;
    #100;
    
    a_tb = 0;
    b_tb = 1;
    ci_tb = 0;
    #100;
    
    a_tb = 0;
    b_tb = 1;
    ci_tb = 1;
    #100; 
    
    a_tb = 1;
    b_tb = 0;
    ci_tb = 0;
    #100;  
    
    a_tb = 1;
    b_tb = 0;
    ci_tb = 1;
    #100; 
    
    a_tb = 1;
    b_tb = 1;
    ci_tb = 0;
    #100;
    
    a_tb = 1;
    b_tb = 1;
    ci_tb = 1;
    #100;
    
    //add table for expected outputs and screenshots
end
endmodule
