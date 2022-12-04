`timescale 1ns / 1ps

 module FSM(
    input clk,
    input reset,
    input [3:0] switches,
    output reg [11:0] out = 12'b000_000_000_000
);

reg [3:0] state;
reg [3:0] nstate;

    // GNS YNS RNS GEW YEW REW GLNS YLNS RLNS GLEW YLEW RLEW

localparam AllRED       =  4'b0000, // 12'b001_001_001_001, // When all lights are red
           GreenNS      =  4'b0001, // 12'b100_001_001_001, // Wen NS is green
           YellowNS     =  4'b0010, // 12'b010_001_001_001, // When NS is yellow
           GreenEW      =  4'b0011, // 12'b001_100_001_001, // When EW is green
           YellowEW     =  4'b0100, // 12'b001_010_001_001, // When EW is yellow
           GreenLeftNS  =  4'b0101, // 12'b001_001_100_001, // When Left NS is green
           YellowLeftNS =  4'b0110, // 12'b001_001_010_001, // When Left NS is yellow
           GreenLeftEW  =  4'b0111, // 12'b001_001_001_100, // When left EW is green
           YellowLeftEW =  4'b1000; // 12'b001_001_001_010; // When left EW is yellow
           
           
 always @ (*)
               begin
                 case(state)
                   AllRED:       out = 12'b001_001_001_001; // When all lights are red
                   GreenNS:      out = 12'b100_001_001_001; // When NS is green
                   YellowNS:     out = 12'b010_001_001_001; // When NS is yellow
                   GreenEW:      out = 12'b001_100_001_001; // When EW is green
                   YellowEW:     out = 12'b001_010_001_001; // When EW is yellow
                   GreenLeftNS:  out = 12'b001_001_100_001; // When Left NS is green
                   YellowLeftNS: out = 12'b001_001_010_001; // When Left NS is yellow
                   GreenLeftEW:  out = 12'b001_001_001_100; // When left EW is green
                   YellowLeftEW: out = 12'b001_001_001_010; // When left EW is yellow
                   default out = 12'b000_000_000_000;
                   endcase
               end        
always @ (posedge clk, posedge reset)
    begin
        if(reset)
           begin
               state <= AllRED;
               out <= 12'b001_001_001_001;
           end
        else
            state <= nstate;
            end
            
        always@(*)begin
        case(state)
            // AllRED case Done
            AllRED: 
                case(switches)
                // All 16 switch input possibilities
                    0000: nstate <= AllRED;
                    0001: nstate <= GreenNS;
                    0010: nstate <= GreenLeftNS;
                    0011: nstate <= GreenNS;
                    
                    0100: nstate <= GreenEW;
                    0101: nstate <= GreenNS;
                    0110: nstate <= GreenEW;
                    0111: nstate <= GreenNS;
                    
                    1000: nstate <= GreenLeftEW;
                    1001: nstate <= GreenNS;
                    1010: nstate <= GreenLeftEW;
                    1011: nstate <= GreenNS;
                    
                    1100: nstate <= GreenEW;
                    1101: nstate <= GreenNS;
                    1110: nstate <= GreenEW;
                    1111: nstate <= GreenNS;
                endcase
            // Green NS case Done
            GreenNS:
                case(switches)
                    // All 16 switch input possibilities
                    0000: nstate <= GreenNS;
                    0001: nstate <= GreenNS;
                    0010: nstate <= GreenLeftNS;
                    0011: nstate <= GreenNS;
                    
                    0100: nstate <= GreenEW;
                    0101: nstate <= YellowNS;
                    0110: nstate <= YellowNS;
                    0111: nstate <= YellowNS;
                    
                    1000: nstate <= YellowNS;
                    1001: nstate <= YellowNS;
                    1010: nstate <= YellowNS;
                    1011: nstate <= YellowNS;
                    
                    1100: nstate <= YellowNS;
                    1101: nstate <= YellowNS;
                    1110: nstate <= YellowNS;
                    1111: nstate <= YellowNS;
                endcase
            // Yellow NS case Done
            YellowNS:
                case(switches)
                // All 16 switch input possibilities
                0000: nstate <= AllRED;
                0001: nstate <= AllRED;
                0010: nstate <= AllRED;
                0011: nstate <= AllRED;
                
                0100: nstate <= AllRED;
                0101: nstate <= AllRED;
                0110: nstate <= AllRED;
                0111: nstate <= AllRED;
                
                1000: nstate <= AllRED;
                1001: nstate <= AllRED;
                1010: nstate <= AllRED;
                1011: nstate <= AllRED;
                
                1100: nstate <= AllRED;
                1101: nstate <= AllRED;
                1110: nstate <= AllRED;
                1111: nstate <= AllRED;
            endcase
            // Green EW case Done
            GreenEW:
                case(switches)
                // All 16 switch input possibilities
                0000: nstate <= GreenEW;
                0001: nstate <= YellowEW;
                0010: nstate <= YellowEW;
                0011: nstate <= YellowEW;
                
                0100: nstate <= GreenEW;
                0101: nstate <= YellowEW;
                0110: nstate <= YellowEW;
                0111: nstate <= YellowEW;
                
                1000: nstate <= YellowEW;
                1001: nstate <= YellowEW;
                1010: nstate <= YellowEW;
                1011: nstate <= YellowEW;
                
                1100: nstate <= YellowEW;
                1101: nstate <= YellowEW;
                1110: nstate <= YellowEW;
                1111: nstate <= YellowEW;
            endcase
            // Yellow EW case Done
            YellowEW:
                case(switches)
                // All 16 switch input possibilities
                0000: nstate <= AllRED;
                0001: nstate <= AllRED;
                0010: nstate <= AllRED;
                0011: nstate <= AllRED;
                
                0100: nstate <= AllRED;
                0101: nstate <= AllRED;
                0110: nstate <= AllRED;
                0111: nstate <= AllRED;
                
                1000: nstate <= AllRED;
                1001: nstate <= AllRED;
                1010: nstate <= AllRED;
                1011: nstate <= AllRED;
                
                1100: nstate <= AllRED;
                1101: nstate <= AllRED;
                1110: nstate <= AllRED;
                1111: nstate <= AllRED;
            endcase
            // Green Left NS case Done
            GreenLeftNS:
                case(switches)
                // All 16 switch input possibilities
                0000: nstate <= YellowLeftNS;
                0001: nstate <= YellowLeftNS;
                0010: nstate <= GreenLeftNS;
                0011: nstate <= YellowLeftNS;
                
                0100: nstate <= YellowLeftNS;
                0101: nstate <= YellowLeftNS;
                0110: nstate <= YellowLeftNS;
                0111: nstate <= YellowLeftNS;
                
                1000: nstate <= YellowLeftNS;
                1001: nstate <= YellowLeftNS;
                1010: nstate <= YellowLeftNS;
                1011: nstate <= YellowLeftNS;
                
                1100: nstate <= YellowLeftNS;
                1101: nstate <= YellowLeftNS;
                1110: nstate <= YellowLeftNS;
                1111: nstate <= YellowLeftNS;
            endcase
            // Yellow Left NS case Done
            YellowLeftNS:
                case(switches)
                // All 16 switch input possibilities
                0000: nstate <= AllRED;
                0001: nstate <= AllRED;
                0010: nstate <= AllRED;
                0011: nstate <= AllRED;
                
                0100: nstate <= AllRED;
                0101: nstate <= AllRED;
                0110: nstate <= AllRED;
                0111: nstate <= AllRED;
                
                1000: nstate <= AllRED;
                1001: nstate <= AllRED;
                1010: nstate <= AllRED;
                1011: nstate <= AllRED;
                
                1100: nstate <= AllRED;
                1101: nstate <= AllRED;
                1110: nstate <= AllRED;
                1111: nstate <= AllRED;
            endcase
            // Green Left EW case Done
            GreenLeftEW:
                case(switches)
                // All 16 switch input possibilities
                0000: nstate <= YellowLeftEW;
                0001: nstate <= YellowLeftEW;
                0010: nstate <= YellowLeftEW;
                0011: nstate <= YellowLeftEW;
                
                0100: nstate <= YellowLeftEW;
                0101: nstate <= YellowLeftEW;
                0110: nstate <= YellowLeftEW;
                0111: nstate <= YellowLeftEW;
                
                1000: nstate <= GreenLeftEW;
                1001: nstate <= YellowLeftEW;
                1010: nstate <= YellowLeftEW;
                1011: nstate <= YellowLeftEW;
                
                1100: nstate <= YellowLeftEW;
                1101: nstate <= YellowLeftEW;
                1110: nstate <= YellowLeftEW;
                1111: nstate <= YellowLeftEW;
            endcase
            // Yellow Left EW case Done
            YellowLeftEW:
                case(switches)
                // All 16 switch input possibilities
                0000: nstate <= AllRED;
                0001: nstate <= AllRED;
                0010: nstate <= AllRED;
                0011: nstate <= AllRED;
                
                0100: nstate <= AllRED;
                0101: nstate <= AllRED;
                0110: nstate <= AllRED;
                0111: nstate <= AllRED;
                
                1000: nstate <= AllRED;
                1001: nstate <= AllRED;
                1010: nstate <= AllRED;
                1011: nstate <= AllRED;
                
                1100: nstate <= AllRED;
                1101: nstate <= AllRED;
                1110: nstate <= AllRED;
                1111: nstate <= AllRED;
            endcase
        endcase
    end
    
   
endmodule
