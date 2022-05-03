`timescale 1ns / 1ps

module SRAM(
    input clk,
    input reset,
    input [4:0] address,
    input wr_rd,
    input [7:0] data_in,
    output reg [7:0] data_out
    );
    
    wire [31:0] dec_out;
    wire [7:0] d0_out, d1_out, d2_out, d3_out, d4_out, d5_out, d6_out, d7_out, d8_out, d9_out, d10_out, d11_out,
                d12_out, d13_out, d14_out, d15_out, d16_out, d17_out, d18_out, d19_out, d20_out, d21_out, d22_out, d23_out,
                d24_out, d25_out, d26_out, d27_out, d28_out, d29_out, d30_out, d31_out;
    
    
    // 32 to 1 mux with low active enable 
    // wr_rd serves as low active enable and address serves as the select line            
    always@(*) begin 
        case({wr_rd, address})
            6'b0_00000: data_out = d0_out; //What value of wr_rd should we check?
                    6'b0_00001: data_out = d1_out;
                    6'b0_00010: data_out = d2_out;
                    6'b0_00011: data_out = d3_out;
                    6'b0_00100: data_out = d4_out;
                    6'b0_00101: data_out = d5_out;
                    6'b0_00110: data_out = d6_out;
                    6'b0_00111: data_out = d7_out;
                    6'b0_01000: data_out = d8_out;
                    6'b0_01001: data_out = d9_out;
                    6'b0_01010: data_out = d10_out;
                    6'b0_01011: data_out = d11_out;
                    6'b0_01100: data_out = d12_out;
                    6'b0_01101: data_out = d13_out;
                    6'b0_01110: data_out = d14_out;
                    6'b0_01111: data_out = d15_out;
                    6'b0_10000: data_out = d16_out;
                    6'b0_10001: data_out = d17_out;
                    6'b0_10010: data_out = d18_out;
                    6'b0_10011: data_out = d19_out;
                    6'b0_10100: data_out = d20_out;
                    6'b0_10101: data_out = d21_out;
                    6'b0_10110: data_out = d22_out;
                    6'b0_10111: data_out = d23_out;
                    6'b0_11000: data_out = d24_out;
                    6'b0_11001: data_out = d25_out;
                    6'b0_11010: data_out = d26_out;
                    6'b0_11011: data_out = d27_out;
                    6'b0_11100: data_out = d28_out;
                    6'b0_11101: data_out = d29_out;
                    6'b0_11110: data_out = d30_out;
                    6'b0_11111: data_out = d31_out;
                    6'b1_?????: data_out = 8'bZ;
                    default: data_out = 8'bZ;
            
        endcase    
    end              

    Decoder  dec(.address(address),.enable(wr_rd),.out(dec_out));
    
    DReg_wEnable
            d0 (.clk(clk), .reset(reset), .e(dec_out[0]),  .D(data_in), .Q(d0_out)),
            d1 (.clk(clk), .reset(reset), .e(dec_out[1]),  .D(data_in), .Q(d1_out)),
            d2 (.clk(clk), .reset(reset), .e(dec_out[2]),  .D(data_in), .Q(d2_out)),
            d3 (.clk(clk), .reset(reset), .e(dec_out[3]),  .D(data_in), .Q(d3_out)),
            d4 (.clk(clk), .reset(reset), .e(dec_out[4]),  .D(data_in), .Q(d4_out)),
            d5 (.clk(clk), .reset(reset), .e(dec_out[5]),  .D(data_in), .Q(d5_out)),
            d6 (.clk(clk), .reset(reset), .e(dec_out[6]),  .D(data_in), .Q(d6_out)),
            d7 (.clk(clk), .reset(reset), .e(dec_out[7]),  .D(data_in), .Q(d7_out)),
            d8 (.clk(clk), .reset(reset), .e(dec_out[8]),  .D(data_in), .Q(d8_out)),
            d9 (.clk(clk), .reset(reset), .e(dec_out[9]),  .D(data_in), .Q(d9_out)),
            d10 (.clk(clk), .reset(reset), .e(dec_out[10]),  .D(data_in), .Q(d10_out)),
            d11 (.clk(clk), .reset(reset), .e(dec_out[11]),  .D(data_in), .Q(d11_out)),
            d12 (.clk(clk), .reset(reset), .e(dec_out[12]),  .D(data_in), .Q(d12_out)),
            d13 (.clk(clk), .reset(reset), .e(dec_out[13]),  .D(data_in), .Q(d13_out)),
            d14 (.clk(clk), .reset(reset), .e(dec_out[14]),  .D(data_in), .Q(d14_out)),
            d15 (.clk(clk), .reset(reset), .e(dec_out[15]),  .D(data_in), .Q(d15_out)),
            d16 (.clk(clk), .reset(reset), .e(dec_out[16]),  .D(data_in), .Q(d16_out)),
            d17 (.clk(clk), .reset(reset), .e(dec_out[17]),  .D(data_in), .Q(d17_out)),
            d18 (.clk(clk), .reset(reset), .e(dec_out[18]),  .D(data_in), .Q(d18_out)),
            d19 (.clk(clk), .reset(reset), .e(dec_out[19]),  .D(data_in), .Q(d19_out)),
            d20 (.clk(clk), .reset(reset), .e(dec_out[20]),  .D(data_in), .Q(d20_out)),
            d21 (.clk(clk), .reset(reset), .e(dec_out[21]),  .D(data_in), .Q(d21_out)),
            d22 (.clk(clk), .reset(reset), .e(dec_out[22]),  .D(data_in), .Q(d22_out)),
            d23 (.clk(clk), .reset(reset), .e(dec_out[23]),  .D(data_in), .Q(d23_out)),
            d24 (.clk(clk), .reset(reset), .e(dec_out[24]),  .D(data_in), .Q(d24_out)),
            d25 (.clk(clk), .reset(reset), .e(dec_out[25]),  .D(data_in), .Q(d25_out)),
            d26 (.clk(clk), .reset(reset), .e(dec_out[26]),  .D(data_in), .Q(d26_out)),
            d27 (.clk(clk), .reset(reset), .e(dec_out[27]),  .D(data_in), .Q(d27_out)),
            d28 (.clk(clk), .reset(reset), .e(dec_out[28]),  .D(data_in), .Q(d28_out)),
            d29 (.clk(clk), .reset(reset), .e(dec_out[29]),  .D(data_in), .Q(d29_out)),
            d30 (.clk(clk), .reset(reset), .e(dec_out[30]),  .D(data_in), .Q(d30_out)),
            d31 (.clk(clk), .reset(reset), .e(dec_out[31]),  .D(data_in), .Q(d31_out));
endmodule
