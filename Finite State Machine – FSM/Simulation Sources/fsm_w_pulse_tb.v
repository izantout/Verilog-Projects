module fsm_w_pulse_tb();

reg clk;
reg reset;
reg up;
reg pulse;

wire [15:0] out;

fsm_w_pulse uut (.clk(clk), .reset(reset), .cnt_up(up), .pulse(pulse), .out(out));

always
#10 clk = ~clk;

initial begin
clk = 0;
pulse = 1;
reset = 1;
up = 0;

#100;
reset = 0;

#380;
up = 1;

#100;
reset = 1;

#20;
reset = 0;
pulse = 1;
up = 1;
clk = 1;
end
endmodule
