module add_beh_tb(

    );
    
    //add reg to register inputes
   reg [2:0] in0_tb;
   reg [2:0] in1_tb;
   
   
   //add wire infront of output
   wire [2:0] out_tb;
   wire carry_tb;
    
    //instatiate the module
    add_beh  uut(.in0(in0_tb), .in1(in1_tb), .out(out_tb), .carry(carry_tb));
    
    initial begin
    in0_tb = 3'b000;
    in1_tb = 3'b001;
    #100;
    
    in0_tb = 3'b111;
    in1_tb = 3'b001;
    #100;
    
    end
    
endmodule
