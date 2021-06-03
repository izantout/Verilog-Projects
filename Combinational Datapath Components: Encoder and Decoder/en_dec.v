module enc_dec(
    input [7:0] In,
    output [7:0] Out
    );
wire [2:0] code;
wire v;
//input [7:0] In,
//output reg [2:0] Out,
//output Valid
encoder enc(.In(In),.Valid(v),.Out(code));
//input [2:0] In,
//input enable,
//output reg [7:0] Out
decoder dec(.enable(v),.In(code),.Out(Out));
endmodule
