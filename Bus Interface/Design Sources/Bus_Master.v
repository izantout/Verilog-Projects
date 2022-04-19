`timescale 1ns / 1ps

module Bus_Master(
    input clk,
    input reset,
    input req_in,
    input ack,
    input [1:0] data_in,
    output reg req_out,
    output reg [1:0] data_out
    );
    
    always@(posedge clk, posedge reset) begin
        if (reset) begin
            data_out <= 2'b0;
            req_out  <= 1'b0;
        end
        else if (ack) begin
            data_out <= data_in;
            req_out  <= req_in;
        end  
        else begin
            data_out <= 2'bZZ;
            req_out  <= req_in;
        end
    end 
endmodule
