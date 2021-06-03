module top_counter_32bit_tb();

    reg clk_tb;
    reg reset_tb;
    reg count_en_tb;
    reg Sel_top_tb;
    wire [15:0] Q_tb;
    
top_counter_32bit uut(.clk_top(clk_tb), .reset_top(reset_tb), .count_en_top(count_en_tb), .Sel_top(Sel_top_tb), .Q_top(Q_tb));

always
#50 clk_tb = ~clk_tb;
initial 
begin

clk_tb = 0;
reset_tb = 1;
count_en_tb = 0;
Sel_top_tb = 0;
#300;

reset_tb = 0;
#200;

count_en_tb = 1;
#6553600;

Sel_top_tb = 1;

//It is showing the bits from bit 16 to 32 which will need more time for the counter to change since Sel is 1. 
end

endmodule
