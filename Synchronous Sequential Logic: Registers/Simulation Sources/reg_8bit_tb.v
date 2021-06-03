module reg_8bit_tb(   );
    reg clk_tb;
    reg reset_tb;
    reg [7:0] Din_tb;
    wire [7:0] Q_tb;
    
reg_8bit uut(.clk(clk_tb), .reset(reset_tb), .Din(Din_tb), .Q(Q_tb));

always
    #50 clk_tb = ~clk_tb;
    
initial 
begin
    reset_tb = 1;
    clk_tb = 0;
    #300;
    
    reset_tb = 0;
    Din_tb = 8'h01;
    #100;
    
    Din_tb = 8'h02;
    #150;
    
    Din_tb = 8'h03;
    #100;
    
    Din_tb = 8'hA2;
    
    reset_tb = 1;
    
    Din_tb = 8'h04;
    #200
    
    Din_tb = 8'hA5;
    #150;
    
    reset_tb = 0;
    
    Din_tb = 8'h05;
    #60;
    
    Din_tb = 8'h07;
 
 end   
    
endmodule
