`timescale 1ns / 1ps

module FSM_tb();


    reg clk;
    reg reset;
    reg [3:0] switches;
    
    wire [11:0] out;
    
    FSM uut (.clk(clk), .reset(reset), .switches(switches), .out(out));
    
    always
    #10 clk = ~clk;
    
    initial begin
    clk = 0;
    reset = 0;
    switches = 4'b0000;
    #200;
    
    reset = 1;
    switches = 4'b0000;
    #200;
    
    reset = 0;
    switches = 4'b0000;
    #200;
    reset = 0;
    switches = 4'b0001;
    end


endmodule
