module counter_32bits(
    input clk,
    input reset,
    input count_en,
    output reg [31:0] Q
    );
    
    always @ (posedge clk, posedge reset)
        if(reset)
            Q <= 32'h0000_0000;
        else
            if(count_en)
            Q <= Q+1;
endmodule
