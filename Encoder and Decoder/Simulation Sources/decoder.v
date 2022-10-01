module decoder_tb();
reg[2:0] In_tb;
reg enable_tb;
wire [7:0] Out_tb;
integer i;

decoder uut(.In(In_tb), .enable(enable_tb), .Out(Out_tb));

initial begin
    In_tb = 0;
    enable_tb = 1;
    for (i=1;i<8;i=i+1)
        #100 In_tb = i[2:0];
        
    #100
    In_tb = 0;
    enable_tb = 0;
    for (i=1;i<8;i=i+1)
        #100 In_tb = i[2:0];
        
        end

endmodule
