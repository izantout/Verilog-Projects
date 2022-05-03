`timescale 1ns / 1ps

module Mux_32to1( 
    input clk,
    input reset,
    input [4:0] address,
    input wr_rd,
    input [7:0] data_in,
    output reg [7:0] data_out
    );
endmodule
