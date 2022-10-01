module decoder(
    input [2:0] In,
    input enable,
    output reg [7:0] Out
    );
    
    always @(In,enable)
    begin
    Out = 8'b0000_0000;
    if (enable)
        case(In)
            3'b000: Out = 8'b0000_0001;
            3'b001: Out = 8'b0000_0010;
            3'b010: Out = 8'b0000_0100;
            3'b011: Out = 8'b0000_1000;
            3'b100: Out = 8'b0001_0000;
            3'b101: Out = 8'b0010_0000;
            3'b110: Out = 8'b0100_0000;
            3'b111: Out = 8'b1000_0000;
            default: Out = 8'b0000_0000;
            endcase
    end
endmodule
