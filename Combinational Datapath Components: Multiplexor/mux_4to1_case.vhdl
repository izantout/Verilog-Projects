module mux_4to1_case(
    input in0,
    input in1,
    input in2,
    input in3,
    input [1:0] sel,
    output reg mux_4to1_case_out
    );
    
always@(in0, in1, in2, in3, sel)
case(sel)

0:mux_4to1_case_out = in0;
1:mux_4to1_case_out = in1;
2:mux_4to1_case_out = in2;
3:mux_4to1_case_out = in3;
default: mux_4to1_case_out = 1'bZ;
 endcase
 
endmodule
