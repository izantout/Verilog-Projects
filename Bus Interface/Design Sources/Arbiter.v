`timescale 1ns / 1ps

module Arbiter(
    input clk, 
    input reset, 
    input Req1, 
    input Req2,
    input Req3,
    output reg Ack1,
    output reg Ack2, 
    output reg Ack3
    );
    
    localparam
        IDLE  = 0, 
        MASTER1  = 1, 
        MASTER2  = 2,
        MASTER3  = 3;
    
    //********************************
    // state register and
    // next_state variables
    //********************************
   
    reg [1:0] present_state;
    reg [1:0] next_state;
   
    //***************************************************************************
    // Nest State Combinational Logic
    // (next state values can change anytime but will be only "clocked" below)
    //***************************************************************************
    always@(*)
        case({present_state})
            IDLE: begin 
                    casez({Req1,Req2,Req3})
                        // Write the code for IDLE State
                        3'b000: next_state  = IDLE;
                        3'b1??: next_state  = MASTER1; // Question mark means don't care. Keep it as is.
                        3'b01?: next_state  = MASTER2;
                        3'b001: next_state  = MASTER3;
                        default: next_state = IDLE;
                    endcase
                  end        
            MASTER1: begin 
                    casez({Req1,Req2,Req3})
                        // Write the code for MASTER1 State.
                        3'b000: next_state  = IDLE;
                        3'b1??: next_state  = MASTER1; // Question mark means don't care. Keep it as is.
                        3'b01?: next_state  = MASTER2;
                        3'b001: next_state  = MASTER3;
                        default: next_state = MASTER1;
                    endcase
                  end                                    
            MASTER2: begin 
                    casez({Req1,Req2,Req3})
                        // Write the code for MASTER2 State.
                        3'b000: next_state  = IDLE;
                        3'b10?: next_state  = MASTER1; // Question mark means don't care. Keep it as is.
                        3'b?1?: next_state  = MASTER2;
                        3'b001: next_state  = MASTER3;
                        default: next_state = MASTER2;
                    endcase    
                  end 
            MASTER3: begin
                    casez({Req1,Req2,Req3})
                        // Write the code for MASTER3 State.
                        3'b000: next_state  = IDLE;
                        3'b1?0: next_state  = MASTER1; // Question mark means don't care. Keep it as is.
                        3'b010: next_state  = MASTER2;
                        3'b??1: next_state  = MASTER3;
                        default: next_state = MASTER3;
                    endcase             
                  end          
            default: next_state = IDLE;           
        endcase
       
       
        //*******************************************
        // State Register Logic (Sequential Logic)
        //*******************************************
        always@(posedge clk, posedge reset)
            if(reset)
                present_state <= IDLE; // Got a reset so set state register to initial state
            else
                present_state <= next_state; // Got a posedge of clk so update state register with the next state
   
   
        //***********************************************************
        // Output Combinational Logic
        // (outputs will only change when present state changes)
        //***********************************************************
        always@(present_state)
            case(present_state)
                IDLE: begin 
                         {Ack1, Ack2, Ack3} = 3'b000;         
                       end     
                MASTER1: begin 
                         //Write the code for MASTER1 State output 
                         {Ack1, Ack2, Ack3} = 3'b1??;          
                       end     
               	MASTER2: begin 
                         //Write the code for MASTER2 State output
                         {Ack1, Ack2, Ack3} = 3'b01?;         
                       end    
                MASTER3: begin 
                         //Write the code for MASTER3 State output   
                         {Ack1, Ack2, Ack3} = 3'b001;       
                       end              
                default: {Ack1, Ack2, Ack3} = 3'b000;                
            endcase
endmodule
