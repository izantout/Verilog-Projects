module mux_2to1_case_tb();

reg in0_tb;
reg in1_tb;
reg se1_tb;

wire mux_2to1_case_out_tb;

mux_2to1_case uut(.in0(in0_tb), .in1(in1_tb), .se1(se1_tb), .mux_2to1_case_out(mux_2to1_case_out_tb));

initial begin
in0_tb = 0;
in1_tb = 0;
se1_tb = 0;
#100;

in0_tb = 1;
in1_tb = 0;
se1_tb = 0;
#100;

in0_tb = 0;
in1_tb = 1;
se1_tb = 1;
#100;

in0_tb = 1;
in1_tb = 1;
se1_tb = 1;
#100;

end
endmodule
