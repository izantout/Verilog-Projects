module mux_4to1_4b_case(
    input [3:0] in0,
    input [3:0] in1,
    input [3:0] in2,
    input [3:0] in3,
    input [1:0] se1,
    output reg [3:0] mux_4to1_4b_case_out
    );
always@ (in0,in1,in2,in3,se1)
case(se1) 
 0: mux_4to1_4b_case_out = in0;   
 1: mux_4to1_4b_case_out = in1;
 2: mux_4to1_4b_case_out = in2;
 3: mux_4to1_4b_case_out = in3;
    default: mux_4to1_4b_case_out = 4'bZZZZ;
    endcase
    
endmodule
