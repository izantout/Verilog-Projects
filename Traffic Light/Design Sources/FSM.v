`timescale 1ns / 1ps
module FSM(
    output reg [2:0] north_lights     , // North Lights 
    output reg [2:0] north_left_lights, // South Lights
    output reg [2:0] east_lights      , // East Lights
    output reg [2:0] east_left_lights , // West Lights
    output reg [2:0] walk_north       , // walk signal north
    output reg [2:0] walk_east        , // walk signal east
    input clk                         , // Clock
    input reset                       , // Reset
    input btnu,
    input btnl,
    output [7:0] cathode              , // cathode for 7 segment
    output [7:0] anode                  // anode for 7 segment

);
   reg [2:0] state;                     // FSM State
   reg [27:0] delay;                    // Delay variable for time tracking
   reg [2:0] Q;                         // Q for output
   assign anode = 8'b1111_1110;         // assigning anode to show furthest right
   
   BCD_To_7seg BCD(.Q(Q), .cathode(cathode));
   
   localparam [2:0] north           = 3'b000, // State for Green North 
                    northYellow     = 3'b001, // State for Yellow North
                    northLeft       = 3'b010, // State for Green South
                    northLeftYellow = 3'b011, // State for Yellow South
                    east            = 3'b100, // State for Green East
                    eastYellow      = 3'b101, // State for Yellow East
                    eastLeft        = 3'b110, // State for Green West
                    eastLeftYellow  = 3'b111; // State for Yellow West

   
 

   always @(posedge clk, posedge reset)
     begin
        if (reset) // If reset is 1
            begin
                state = north; // Go to reset state which is go north
                delay = 28'b0; // Delay is 0
            end
        else
            begin
                if(btnu == 0 && btnl == 0) begin
                    case (state)
                    north :
                        begin
                            if (delay == 28'b1111_1111_1111_1111_1111_1111_1111) // If the delay is done
                                begin
                                    delay = 28'b0; // reset the delay
                                    state = northYellow; // go to next state 
                                end // if
                            else // else
                                begin
                                    delay = delay + 28'b1; // Increase the delay by one
                                    state = north; // keep state to be north
                                end // else
                        end // north begin
    
                    northYellow :
                        begin
                            if (delay == 28'b0111_1111_1111_1111_1111_1111_1111)
                                begin
                                    delay = 28'b0;
                                    state = northLeft;
                                end // if
                            else
                                begin
                                    delay = delay + 28'b1;
                                    state = northYellow;
                                end // else
                        end // northYellow begin
    
                   northLeft :
                        begin
                            if (delay == 28'b1111_1111_1111_1111_1111_1111_1111)
                                begin
                                    delay = 28'b0;
                                    state = northLeftYellow;
                                end
                            else
                                begin
                                    delay = delay + 28'b1;
                                    state = northLeft;
                                end
                        end // south begin
    
                northLeftYellow :
                    begin
                        if (delay == 28'b0111_1111_1111_1111_1111_1111_1111)
                            begin
                                delay = 28'b0;
                                state = east;
                            end // if begin
                        else
                            begin
                                delay = delay + 28'b1;
                                state = northLeftYellow;
                            end // else begin
                        end // south yellow begin
    
                east :
                    begin
                        if (delay == 28'b1111_1111_1111_1111_1111_1111_1111)
                            begin
                                delay = 28'b0;
                                state = eastYellow;
                            end // if 
                        else
                            begin
                                delay = delay + 28'b1;
                                state = east;
                            end // else
                    end // east begin
    
                eastYellow :
                    begin
                        if (delay == 28'b0111_1111_1111_1111_1111_1111_1111)
                            begin
                                delay = 28'b0;
                                state = eastLeft;
                            end // if
                        else
                            begin
                                delay = delay + 28'b1;
                                state = eastYellow;
                            end // else
                    end // east yellow begin
    
                eastLeft :
                    begin
                        if (delay == 28'b1111_1111_1111_1111_1111_1111_1111)
                            begin
                                state = eastLeftYellow;
                                delay = 28'b0;
                            end // if
                        else
                            begin
                                delay = delay + 28'b1;
                                state = eastLeft;
                            end // else
                    end // west begin
    
                eastLeftYellow :
                    begin
                        if (delay == 28'b0111_1111_1111_1111_1111_1111_1111)
                            begin
                                state = north;
                                delay = 28'b0;
                            end // if
                        else
                            begin
                                delay = delay + 28'b1;
                                state = eastLeftYellow;
                            end // else
                    end // west yellow begin
                endcase // case state
                end // if
                else if (btnu == 0 && btnl == 1) begin
                    case(state)
                        north: 
                        begin
                            state = east;
                        end
                        northYellow:
                        begin
                            state = east;
                        end
                        northLeft:
                        begin
                            state = east;
                        end
                        northLeftYellow:
                        begin
                            state = east;
                        end
                        east:
                        begin
                            state = east;
                        end
                        eastYellow:
                        begin
                            state = east;
                        end
                        eastLeft:
                        begin
                            state = east;
                        end
                        eastLeftYellow:
                        begin
                            state = east;
                        end
                    endcase
                end // else if
                else if(btnu == 1 && btnl == 0)
                begin
                    case(state)
                        north: 
                        begin
                            state = north;
                        end
                        northYellow:
                        begin
                            state = north;
                        end
                        northLeft:
                        begin
                            state = north;
                        end
                        northLeftYellow:
                        begin
                            state = north;
                        end
                        east:
                        begin
                            state = north;
                        end
                        eastYellow:
                        begin
                            state = north;
                        end
                        eastLeft:
                        begin
                            state = north;
                        end
                        eastLeftYellow:
                        begin
                            state = north;
                        end
                    endcase
                end // else if
                else 
                begin
                    case(state)
                        north: 
                        begin
                            state = east;
                        end
                        northYellow:
                        begin
                            state = east;
                        end
                        northLeft:
                        begin
                            state = east;
                        end
                        northLeftYellow:
                        begin
                            state = east;
                        end
                        east:
                        begin
                            state = north;
                        end
                        eastYellow:
                        begin
                            state = north;
                        end
                        eastLeft:
                        begin
                            state = north;
                        end
                        eastLeftYellow:
                        begin
                            state = north;
                        end
                    endcase
                end // else
            end // big else
     end // always @ state


    always @(state)
         begin
             case (state)
                north :
                    begin
                        north_lights = 3'b001;
                        north_left_lights = 3'b001;
                        east_lights  = 3'b100;
                        east_left_lights  = 3'b100;
                        walk_north = (btnu==1) ? 3'b100 : 3'b010;
                        walk_east = 3'b100;
                        Q = 3'b000;
                    end // north
    
                northYellow :
                    begin
                        north_lights = 3'b010;
                        north_left_lights = 3'b010;
                        east_lights  = 3'b100;
                        east_left_lights  = 3'b100;
                        walk_north = (btnu==1) ? 3'b100 : 3'b110;
                        walk_east = 3'b100;
                        Q = 3'b001;
                    end // north yellow
    
                northLeft :
                    begin
                        north_lights = 3'b001;
                        north_left_lights = 3'b001;
                        east_lights  = 3'b100;
                        east_left_lights  = 3'b100;
                        walk_north = 3'b100;
                        walk_east = 3'b100;
                        Q = 3'b010;
                    end // south
    
                northLeftYellow :
                    begin
                        north_lights = 3'b010;
                        north_left_lights = 3'b010;
                        east_lights  = 3'b100;
                        east_left_lights  = 3'b100;
                        walk_north = 3'b100;
                        walk_east = 3'b100;
                        Q = 3'b011;
                    end // south yellow
                east :
                    begin
                        north_lights = 3'b100;
                        north_left_lights = 3'b100;
                        east_lights  = 3'b001;
                        east_left_lights  = 3'b001;
                        walk_north = 3'b100;
                        walk_east = (btnl==1) ? 3'b100 : 3'b010;
                        Q = 3'b100;
                    end // east
                eastYellow :
                    begin
                        north_lights = 3'b100;
                        north_left_lights = 3'b100;
                        east_lights  = 3'b010;
                        east_left_lights  = 3'b010;
                        walk_north = 3'b100;
                        walk_east = (btnl==1) ? 3'b100 : 3'b110;
                        Q = 3'b101;
                    end // east yellow
                eastLeft :
                    begin
                        north_lights = 3'b100;
                        north_left_lights = 3'b100;
                        east_lights  = 3'b001;
                        east_left_lights  = 3'b100;
                        walk_north = 3'b100;
                        walk_east = 3'b100;      
                        Q = 3'b110;              
                    end // west
    
                eastLeftYellow :
                    begin
                        north_lights = 3'b100;
                        north_left_lights = 3'b100;
                        east_lights  = 3'b010;
                        east_left_lights  = 3'b010;
                        walk_north = 3'b100;
                        walk_east = 3'b100; 
                        Q = 3'b111;                   
                    end // west yellow
    
                
    
                
            endcase // case (state)
            
     end //     always @ (state)
endmodule
