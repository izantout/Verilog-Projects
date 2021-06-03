module fsm_w_pulse(
    input clk,
    input reset,
    input cnt_up,
    input pulse,
    output reg [15:0] out);
    
  reg [3:0] state;
  reg [3:0] nstate;
  
  //Gray encoding
  localparam S0 = 4'b0000,
             S1 = 4'b0001,
             S2 = 4'b0011,
             S3 = 4'b0010,
             S4 = 4'b0110,
             S5 = 4'b0111,
             S6 = 4'b0101,
             S7 = 4'b0100,
             S8 = 4'b1100;
 
 // Basic register
 always @ (posedge clk, posedge reset)
 if (reset)
    state <= 4'b0;
 else
    state <= nstate;
 
//state transition
always @ (*)
    begin
        nstate = state;
        if(pulse)
         case(state)
          S0: nstate = (cnt_up) ? S1:S8;
          S1: nstate = (cnt_up) ? S2:S0;
          S2: nstate = (cnt_up) ? S3:S1;
          S3: nstate = (cnt_up) ? S4:S2;
          S4: nstate = (cnt_up) ? S5:S3;
          S5: nstate = (cnt_up) ? S6:S4;
          S6: nstate = (cnt_up) ? S7:S5;
          S7: nstate = (cnt_up) ? S8:S6;
          S8: nstate = (cnt_up) ? S0:S7;
          
          default: nstate = 4'b0000;
          endcase
         end
always @ (*)
 begin
   out = 16'b0101_0101+0101+0101;
   case(state)
     S0: out = 16'b0000_0000_0000_0000; 
     S1: out = 16'b0000_0000_0000_0011;
     S2: out = 16'b0000_0000_0000_1111;
     S3: out = 16'b0000_0000_0011_1111;
     S4: out = 16'b0000_0000_1111_1111;
     S5: out = 16'b0000_0011_1111_1111;
     S6: out = 16'b0000_1111_1111_1111;                                 
     S7: out = 16'b0011_1111_1111_1111;
     S8: out = 16'b1111_1111_1111_1111;
     
     default out = 16'b1000_0000_0000_0000;
     endcase
     end
             
endmodule
