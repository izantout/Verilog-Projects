`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  CSULB
// Engineer: Issam Zantout
//
// Create Date: 03/06/2022 02:14:48 PM
// Design Name: 
// Module Name: BCD_To_7seg
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module BCD_To_7seg(
    input [3:0] Q,
    output reg [7:0] cathode
    );
    
    always@(*) begin
        case(Q)
            4'b0000 : cathode = 8'b0000_0011;
            4'b0001 : cathode = 8'b1001_1111;
            4'b0010 : cathode = 8'b0010_0101;
            4'b0011 : cathode = 8'b0000_1101;
            4'b0100 : cathode = 8'b1001_1001;
            4'b0101 : cathode = 8'b0100_1001;
            4'b0110 : cathode = 8'b0100_0001;
            4'b0111 : cathode = 8'b0001_1111;
            4'b1000 : cathode = 8'b0000_0001;
            4'b1001 : cathode = 8'b0000_1001;
            4'b1010 : cathode = 8'b1111_1110;
            default : cathode = 8'b1100_1010;
        endcase
    end
endmodule
