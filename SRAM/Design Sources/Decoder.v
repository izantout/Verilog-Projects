`timescale 1ns / 1ps

module Decoder(
    input [4:0] address,
    input enable,
    output reg [31:0] out
    );
    
    always@(*) begin 
            
            if (enable == 1)
            out = ( 32'h00000001 << address);
            // h means its in hex. The 32h address is being shifted to the left by the address number
            else 
            out = 32'b0;       
    end 
endmodule
