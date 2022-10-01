  module four_bit_add_sub(
    input [3:0] A,
    input [3:0] B,
    input M,
    output [3:0] Result,
    output Cout,
    output V
    );
    
    wire [3:0] B_notB;
    assign B_notB = (M == 1) ? ~B : B;
    four_bit_adder adder_module(.A(A), .B(B_notB), .Cin(M), .Sum(Result), .Co(Cout), .V(V));
endmodule
