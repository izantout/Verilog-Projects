module BCD_To_7seg(
    input [2:0] Q,
    output reg [7:0] cathode
    );

    always@(*) begin
        case(Q)
            3'b000 : cathode = 8'b0001_0011;  // UP    ARROW
            3'b001 : cathode = 8'b1000_1001;  // Y
            3'b010 : cathode = 8'b1111_0001;  // LEFT  ARROW
            3'b011 : cathode = 8'b1000_1001;  // Y
            3'b100 : cathode = 8'B1001_1101;  // RIGHT ARROW
            3'b101 : cathode = 8'b1000_1001;  // Y
            3'b110 : cathode = 8'b1000_0011;  // DOWN  ARROW
            3'b111 : cathode = 8'b1000_1001;  // Y
            default: cathode = 8'b1111_1110;  // .
        endcase
    end
endmodule
