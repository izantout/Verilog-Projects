module mux_4to1_4b_case_tb();

    reg [3:0] in0_tb;
    reg [3:0] in1_tb;
    reg [3:0] in2_tb;
    reg [3:0] in3_tb;
    reg [2:0] se1_tb;
    
    wire [3:0] mux_4to1_4b_case_out_tb;

mux_4to1_4b_case uut(
    .in0(in0_tb),
    .in1(in1_tb),
    .in2(in2_tb),
    .in3(in3_tb),
    .se1(se1_tb),
    .mux_4to1_4b_case_out(mux_4to1_4b_case_out_tb)
    );
    
 initial begin
       
       in0_tb = 4'b0000;
       in1_tb = 4'b0000;
       in2_tb = 4'b0000;
       in3_tb = 4'b0000;
       se1_tb = 2'b00;
       #100;
       
       in0_tb = 4'b0001;
       in1_tb = 4'b0000;
       in2_tb = 4'b0000;
       in3_tb = 4'b0000;
       se1_tb = 2'b00;
       #100;
       
       in0_tb = 4'b0000;
       in1_tb = 4'b0010;
       in2_tb = 4'b0000;
       in3_tb = 4'b0000;
       se1_tb = 2'b01;
       #100;
           
       in0_tb = 4'b0000;
       in1_tb = 4'b0011;
       in2_tb = 4'b0000;
       in3_tb = 4'b0000;
       se1_tb = 2'b01;
       #100;
       
       in0_tb = 4'b0000;
       in1_tb = 4'b0000;
       in2_tb = 4'b0100;
       in3_tb = 4'b0000;
       se1_tb = 2'b10;
       #100;
               
       in0_tb = 4'b0000;
       in1_tb = 4'b0000;
       in2_tb = 4'b0101;
       in3_tb = 4'b0000;
       se1_tb = 2'b10;
       #100;
           
       in0_tb = 4'b0000;
       in1_tb = 4'b0000;
       in2_tb = 4'b000;
       in3_tb = 04'b0110;
       se1_tb = 2'b11;
       #100;
        
        in0_tb = 4'b0000;
        in1_tb = 4'b0000;
        in2_tb = 4'b0000;
        in3_tb = 4'b0111;
        se1_tb = 2'b11;
        #100;                                  
       end
       
endmodule
