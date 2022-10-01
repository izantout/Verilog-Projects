`timescale 1ns / 1ps

module Top_tb();

reg clk, rst;
reg [1:0] sel;
wire [2:0] RGB, LED;

Top uut(.clk(clk), .reset(rst), .sel(sel), .RGB(RGB), .LED(LED));

always #10 clk = ~clk;

integer i;

initial begin
    clk = 0; rst = 1;
    #20;
    rst = 0;
    for(i = 0; i < 4; i = i + 1) begin
        sel = i;
        rst = 1;
        #20;
        rst = 0;
        #180;
    end
end
endmodule
