`timescale 1ns / 1ps

module delay(
    input [2:0] duration
);
    reg [2:0] i;
    always @ (*) begin
        for (i=0; i<duration+1; i=i+1)
            begin
            end
    end
endmodule
