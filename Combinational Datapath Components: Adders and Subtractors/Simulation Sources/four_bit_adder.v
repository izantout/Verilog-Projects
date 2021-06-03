module four_bit_adder(
    input [3:0] A,
    input [3:0] B,
    input Cin,
    output [3:0] Sum,
    output Co,
    output V
    );
    
    wire Co1 , Co2 , Co3 , Co4;
    
    assign V = Co4 ^ Co3 ;
    assign Co = Co4 ;
    
    Full_adder FA3 (.a(A[3]), .b(B[3]), .ci(Co3), .co(Co4), .s(Sum[3]));
    Full_adder FA2 (.a(A[2]), .b(B[2]), .ci(Co2), .co(Co3), .s(Sum[2]));
    Full_adder FA1 (.a(A[1]), .b(B[1]), .ci(Co1), .co(Co2), .s(Sum[1]));
    Full_adder FA0 (.a(A[0]), .b(B[0]), .ci(Cin), .co(Co1), .s(Sum[0]));
endmodule
