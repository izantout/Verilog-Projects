module counter_32bits_tb();

reg clk_tb;
reg reset_tb;
reg count_en_tb;
wire [31:0] Q_tb;

counter_32bits uut(.clk(clk_tb), .reset(reset_tb), .count_en(count_en_tb), .Q(Q_tb));

always
#50 clk_tb = ~clk_tb;

initial
begin
reset_tb = 1;
clk_tb = 0;
count_en_tb = 0;
#100;

reset_tb = 0;
#200;

count_en_tb = 1;
#300;

count_en_tb = 0;
#150;

count_en_tb = 1;
#75;

reset_tb = 1;
#50;

reset_tb = 0;

end
endmodule
