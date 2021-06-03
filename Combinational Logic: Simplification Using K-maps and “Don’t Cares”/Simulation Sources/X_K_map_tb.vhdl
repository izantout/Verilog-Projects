module X_K_map_tb();
reg a_tb;
reg b_tb;
reg c_tb;
reg d_tb;
wire XK_out_tb;

X_K_map uut(.a(a_tb), .b(b_tb), .c(c_tb), .d(d_tb), .XK_out(XK_out_tb));

initial begin
a_tb = 0;
b_tb = 0;
c_tb = 0;
d_tb = 0;
#100;

a_tb = 0;
b_tb = 0;
c_tb = 0;
d_tb = 1;
#100;

a_tb = 0;
b_tb = 0;
c_tb = 1;
d_tb = 0;
#100;

a_tb = 0;
b_tb = 0;
c_tb = 1;
d_tb = 1;
#100;

a_tb = 0;
b_tb = 1;
c_tb = 0;
d_tb = 0;
#100;

a_tb = 0;
b_tb = 1;
c_tb = 0;
d_tb = 1;
#100;

a_tb = 0;
b_tb = 1;
c_tb = 1;
d_tb = 0;
#100;

a_tb = 0;
b_tb = 1;
c_tb = 1;
d_tb = 1;
#100;

a_tb = 1;
b_tb = 0;
c_tb = 0;
d_tb = 0;
#100;

a_tb = 1;
b_tb = 0;
c_tb = 0;
d_tb = 1;
#100;

a_tb = 1;
b_tb = 0;
c_tb = 1;
d_tb = 0;
#100;

a_tb = 1;
b_tb = 0;
c_tb = 1;
d_tb = 1;
#100;

a_tb = 1;
b_tb = 1;
c_tb = 0;
d_tb = 0;
#100;

a_tb = 1;
b_tb = 1;
c_tb = 0;
d_tb = 1;
#100;

a_tb = 1;
b_tb = 1;
c_tb = 1;
d_tb = 0;
#100;

a_tb = 1;
b_tb = 1;
c_tb = 1;
d_tb = 1;
#100;
end
endmodule
