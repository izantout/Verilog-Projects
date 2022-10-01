`timescale 1ns / 1ps

module Top(
    input clk,
    input reset,
    input [1:0] sel,
    output [2:0] RGB,
    output [2:0] LED
    );
    
    // Define nesseary wires here.
    wire [2:0] solution;
    wire outIn;
    
    Solver S0(.clk(clk), .reset(reset), .in(outIn), .RGB(RGB), .solution(solution), .LED(LED));      
        
    CNF cnf0(.A(solution[2]), .B(solution[1]), .C(solution[0]), .sel(sel), .out(outIn));
endmodule
