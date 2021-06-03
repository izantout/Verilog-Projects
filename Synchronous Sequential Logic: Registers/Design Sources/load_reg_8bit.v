module load_reg_8bit(
    input clk,
    input reset,
    input ld,
    input [7:0] Din,
    output reg [7:0] Q
    );
    
    always @ ( posedge clk, posedge reset)
        if (reset)
            Q <= 8'h00;
        else
            if (ld)
                Q <= Din;
    
endmodule
