`timescale 1ns / 1ps

module Solver(
    input clk, 
    input reset,
    input in,
    output reg [2:0] RGB,
    output reg [2:0] solution,
    output reg [2:0] LED
    );
    
    
    always@(posedge clk, posedge reset) begin
        if(reset) begin
            solution <= 3'b0;
            LED <= 3'b000;
            RGB <= 3'b001; //RGB Code for Red.
        end
        else if(in) begin
            // Insert logic here for the case when a solution is found.
            RGB <= 3'b010; //RGB Code for Green.
            
        end
        else begin 
            // Insert logic here to iterate to the next test expression
            // when a solution has not yet been found. 
            // Hint: update LEDs and RGB here as well.
            
            
        end      
    end
endmodule
