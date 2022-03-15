`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CSULB
// Engineer: Issam Zantout
// Create Date: 08/20/2020 01:44:22 PM
// Design Name: 301_Lab1
// Module Name: AddSubCLA_4bit
// Revision 0.01 - File Created
//////////////////////////////////////////////////////////////////////////////////

module AddSubCLA_4bit(
    input [3:0] a,
    input [3:0] b,
    input sel,
    output [3:0] sum,
    output carry,
    output overflow
    );
    
    wire [3:0] p,g;
    wire c1, c2, c3;
    assign c2 = g[1] | (p[1] & g[0]) | (p[1] & p[0] & sel);
    assign c3 = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & sel);
    assign overflow = c3 ^ carry;
        
    FA_PG FA0(.a(a[0]), .b(b[0] ^ sel), .c_in(sel), .c_out(c1), .c_prop(p[0]), .c_gen(g[0]), .sum(sum[0]));   
    FA_PG FA1(.a(a[1]), .b(b[1] ^ sel), .c_in(c1), .c_out(), .c_prop(p[1]), .c_gen(g[1]), .sum(sum[1]));
    FA_PG FA2(.a(a[2]), .b(b[2] ^ sel), .c_in(c2), .c_out(), .c_prop(p[2]), .c_gen(g[2]), .sum(sum[2]));
    FA_PG FA3(.a(a[3]), .b(b[3] ^ sel), .c_in(c3), .c_out(carry), .c_prop(), .c_gen(), .sum(sum[3]));
    
endmodule
