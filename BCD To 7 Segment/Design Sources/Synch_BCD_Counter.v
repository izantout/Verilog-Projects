module Sync_BCD_Counter (
    input clk, 
    input reset, 
    output reg [3:0] Q
);

reg [26:0] tick; //What size?

    always@(posedge clk, posedge reset) begin
        if(reset) begin
            tick <= 27'b0; //What size?
            Q <= 4'b0;
        end
        else if(tick == 100000000) begin //How much should we wait?  Imporant note: For simulation purpose, choose a very small tick value. After you verify the functionality of the module via simulation, change the tick to the value that is required to be run on the board with 100Mhz clock.
            tick <= 27'b0; //Reset the tick
            if(Q < 9) //What is the max decimal number in BCD counter?
                Q <= Q + 1'b1;
            else 
                Q <= 4'b0;
        end
        else
            tick <= tick + 1'b1;
       end
endmodule
