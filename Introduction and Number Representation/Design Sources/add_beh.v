 module add_beh(
    input [2:0] in0,
    input [2:0] in1,
    output [2:0] out,
    output carry
    );
   
wire [5:0] temp_out;
   
assign temp_out = in0 + in1;
assign out = temp_out[2:0];
assign carry = temp_out[3];

   
endmodule
