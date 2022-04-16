`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: CSULB
// Engineer: Amin Rezaei
// Create Date: 1/14/2021 04:37:31 PM
// Design Name: 301_Lab4
// Module Name: Top_Module
// Revision 0.01 - File Created
//////////////////////////////////////////////////////////////////////////////////

module Top_Module(
    input clk,
    input reset,
    input [1:0] data_in1,
    input req_in1,
    input [1:0] data_in2,
    input req_in2,
    input [1:0] data_in3,
    input req_in3,
    output [7:0] cathode,
    output [7:0] anode
    );
    
    assign anode = 8'b0111_1111; // We just want to active the left-most 7-segment display on the board.
    
    wire ack1, ack2, ack3, req1, req2, req3;
    wire [1:0] data_out;
    
    // Connect Bus_Masters, Arbiter, and BCD_to_7seg together based on the diagram.

    Bus_Master 
    bm1(.ack(ack1), .data_in(data_in1), .req_in(req_in1), .data_out(data_out), .req_out(req1), .reset(reset), .clk(clk)), 
    bm2(.ack(ack2), .data_in(data_in2), .req_in(req_in2), .data_out(data_out), .req_out(req2), .reset(reset), .clk(clk)), 
    bm3(.ack(ack3), .data_in(data_in3), .req_in(req_in3), .data_out(data_out), .req_out(req3), .reset(reset), .clk(clk));
        
    Arbiter a0(.Req1(req1), .Req2(req2), .Req3(req3), .Ack1(ack1), .Ack2(ack2), .Ack3(ack3), .clk(clk), .reset(reset));    
         
    BCD_To_7seg bcd(.Q({2'b0,data_out}), .cathode(cathode));
        
endmodule
