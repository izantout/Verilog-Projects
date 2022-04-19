`timescale 1ns / 1ps

module Binary_Gray(
    input [3:0] num,
    input sel,
    output reg [3:0] out
    );
    
    always @(*) begin
        // num is binary, convert it to gray.
        if(sel == 0) begin
            out[3] = num[3];
            out[2] = num[3] ^ num[2];
            out[1] = num[2] ^ num[1];
            out[0] = num[1] ^ num[0];
        end
        // num is gray, convert to binary.
        else if(sel == 1) begin
            out[3] = num[3];
            out[2] = out[3] ^ num[2];
            out[1] = out[2] ^ num[1];
            out[0] = out[1] ^ num[0];
        end
    end
endmodule
