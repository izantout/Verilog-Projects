module mux_4to1_case_tb();

reg in0_tb;
reg in1_tb;
reg in2_tb;
reg in3_tb;
reg [1:0] sel_tb;
wire mux_4to1_case_out_tb;

mux_4to1_case uut(.in0(in0_tb), .in1(in1_tb), .sel(sel_tb), .mux_4to1_case_out(mux_4to1_case_out_tb));

initial begin
in0_tb = 0;
in1_tb = 0;
in2_tb = 0;
in3_tb = 0;
sel_tb = 2'b00 ;
#100;

in0_tb = 1;
in1_tb = 0;
in2_tb = 0;
in3_tb = 0;
sel_tb = 2'b00 ;
#100;

in0_tb = 0;
in1_tb = 0;
in2_tb = 0;
in3_tb = 0;
sel_tb = 2'b01 ;
#100;

in0_tb = 0;
in1_tb = 1;
in2_tb = 0;
in3_tb = 0;
sel_tb = 2'b01 ;
#100;

in0_tb = 0;
in1_tb = 0;
in2_tb = 0;
in3_tb = 0;
sel_tb = 2'b10 ;
#100;

in0_tb = 0;
in1_tb = 0;
in2_tb = 1;
in3_tb = 0;
sel_tb = 2'b10 ;
#100;

in0_tb = 0;
in1_tb = 0;
in2_tb = 0;
in3_tb = 0;
sel_tb = 2'b11 ;
#100;

in0_tb =0 ;
in1_tb =0 ;
in2_tb =0 ;
in3_tb =1 ;
sel_tb = 2'b11 ;
#100;

end
endmodule
