module enc_dec_tb();

reg [7:0] TopIn_tb;
wire [7:0] TopOut_tb;
integer i;

enc_dec uut(.In(TopIn_tb), .Out(TopOut_tb));

initial begin
    i=0;
    TopIn_tb = 0;
    #100;
    
    TopIn_tb = 1;
    #100;
    for(i=0;i<7;i=i+1)
        #100 TopIn_tb = TopIn_tb <<1;
end
endmodule
