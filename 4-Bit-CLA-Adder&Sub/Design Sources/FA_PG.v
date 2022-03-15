`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CSULB
// Engineers: Jose Aceves & Amin Rezaei
// Create Date: 08/20/2020 01:14:42 PM
// Design Name: 301_Lab1
// Module Name: FA_PG
// Revision 0.01 - File Created
//////////////////////////////////////////////////////////////////////////////////

module FA_PG(    
    input a, 
    input b,
    input c_in,
    output c_out,
    output c_prop,
    output c_gen,
    output sum
);

    assign {c_out, sum} = a + b + c_in;
    
    assign c_gen = a & b;   // a AND b
    assign c_prop = a ^ b;  // a XOR b
endmodule
