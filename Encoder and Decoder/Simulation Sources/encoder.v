module encoder_tb();
reg [7:0] enc_in_tb;
wire [2:0] enc_out_tb;
wire Valid_tb;
integer i;

encoder uut (.In(enc_in_tb), .Out(enc_out_tb), . Valid(Valid_tb));
initial begin
    enc_in_tb = 8'b0000_0001;
    for (i=0;i<9;i=i+1)
        #100 enc_in_tb = enc_in_tb << 1;
end
endmodule
