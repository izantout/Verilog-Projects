module encoder(
    input [7:0] In,
    output reg [2:0] Out,
    output Valid
    );
assign Valid = In[0] | In[1] | In[2] | In[3] | In[4] | In[5] | In[6] | In[7] ;
    always @(In)
        begin
        Out=3'b000;
            case(In)
                8'b0000_0001: Out = 3'b000;
                8'b0000_0010: Out = 3'b001;
                8'b0000_0100: Out = 3'b010;
                8'b0000_1000: Out = 3'b011;
                8'b0001_0000: Out = 3'b100;
                8'b0010_0000: Out = 3'b101;
                8'b0100_0000: Out = 3'b110;
                8'b1000_0000: Out = 3'b111;
                default: Out = 3'b000;
               endcase
            end
endmodule
