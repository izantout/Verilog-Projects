`timescale 1ns/1ps
module FSM_tb();

    wire [2:0] north_lights_tb, north_left_lights_tb, east_lights_tb, east_left_lights_tb, walk_north_tb, walk_east_tb;
    reg clk_tb, reset_tb;
    wire [7:0] cathode_tb;
    wire [7:0] anode_tb;
    
    FSM uut (.north_lights(north_lights_tb), 
             .north_left_lights(north_left_lights_tb), 
             .east_lights(east_lights_tb)  , 
             .east_left_lights(east_left_lights_tb)  , 
             .walk_north(walk_north_tb),
             .walk_east(walk_east_tb),
             .clk(clk_tb)                     , 
             .reset(reset_tb),
             .cathode(cathode_tb), 
             .anode(anode_tb)   ,         
            );
    
    initial
     begin
      clk_tb = 1;
      forever #10 clk_tb = ~clk_tb;
     end
     
    initial
         begin
            reset_tb = 1;
            #15;
            reset_tb = 0;
            #1000;
            $stop;
         end
endmodule
