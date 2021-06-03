module fsm_top(clk,reset, out, in);

    output [15:0] out;
    input in;
    input clk,reset;

    wire pulseConnect;
    
    pulse_generator p0(.clk(clk), .reset(reset), .pulse(pulseConnect));
    fsm_w_pulse fsm0(.clk(clk), .reset(reset), .cnt_up(in), .out(out), .pulse(pulseConnect));
    
    // Draw this
endmodule
