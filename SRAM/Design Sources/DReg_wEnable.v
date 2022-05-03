`timescale 1ns / 1ps

module DReg_wEnable(
    input clk,
    input reset,
    input e,
    input [7:0] D,
    output reg [7:0] Q
    );
    
    always@(posedge clk, posedge reset) begin 
        if(reset)
           Q = 8'hZZ;
        else if(e)
           Q = D;
    end
endmodule
