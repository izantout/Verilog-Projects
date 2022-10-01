module mux_2to1_case(
    input in0,
    input in1,
    input se1,
    output reg mux_2to1_case_out
    );
    
always@(in0,in1,se1)
 case(se1)
    0: mux_2to1_case_out = in0;
    1: mux_2to1_case_out = in1;
    default: mux_2to1_case_out = 1'bZ;
endcase
           
endmodule
