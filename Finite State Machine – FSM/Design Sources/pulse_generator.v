module pulse_generator(clk, reset, pulse);
    input clk, reset;
    output pulse;
    reg [25:0] count;
    
    assign pulse = (count == 58_300_000);
    
    always @ (posedge clk, posedge reset)
        if (reset)
            count <= 26'b0;
        else if (pulse)
            count <= 26'b0;
        else
            count <= count + 26'b1;

endmodule
