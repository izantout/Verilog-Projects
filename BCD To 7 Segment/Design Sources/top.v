module top(
    input clk,
    input reset,
    output [7:0] cathode,
    output [7:0] anode
    );
    
    assign anode = 8'b1111_1110; //We just want to active the right most 7-segment display on the board.
    wire [3:0] Q; 
    
    BCD_To_7seg BCD(.Q(Q), .cathode(cathode));
        
    Sync_BCD_Counter counter(.clk(clk), .reset(reset), .Q(Q));
                
endmodule
