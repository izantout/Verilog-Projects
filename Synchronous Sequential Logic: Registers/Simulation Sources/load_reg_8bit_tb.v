module load_reg_8bit_tb();
    reg clk_tb;
    reg reset_tb;
    reg ld_tb;
    reg [7:0] Din_tb;
    wire [7:0] Q_tb;
    
load_reg_8bit uut(.clk(clk_tb), .reset(reset_tb), .ld(ld_tb), .Din(Din_tb), .Q(Q_tb));

always
#50 clk_tb = ~clk_tb;

initial
begin

reset_tb = 1;
clk_tb = 0;
ld_tb = 0;
#300;

reset_tb = 0;
Din_tb = 8'h01;
#100;

ld_tb = 1;
Din_tb = 8'h02;
#150

Din_tb = 8'h03;
#100;

Din_tb = 8'hA2;
#50;

reset_tb = 1;
ld_tb = 1;
Din_tb = 8'h04;
#50;

Din_tb = 8'hA4;
#60;

reset_tb = 0;
ld_tb = 0;
Din_tb = 8'h05;
#100;

reset_tb = 0;
ld_tb = 1;

end

endmodule
