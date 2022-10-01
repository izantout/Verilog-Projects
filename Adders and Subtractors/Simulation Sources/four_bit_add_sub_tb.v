module four_bit_add_sub_tb;

reg [3:0] A;
reg [3:0] B;
reg M;

wire [3:0] Result;
wire Cout;
wire V;

integer i;
    four_bit_add_sub uut(.A(A), .B(B), .M(M), .Result(Result), .Cout(Cout), .V(V));
initial begin

for(i = 0; i < 16; i = i +1)
    begin
      M = 0;
      A = i;
      B = i + 3;;
      if (i == 15) begin A = 1; B = 16'hFFFF; end
      #100;
      if (Result !== A + B)
      begin
        $display("Error Result = %d for A = %d B = %d M = 5",Result, A, B, M);
      end
   end
   
   //subtraction
   
   for (i = -7; i < 7; i = i + 1)
    begin
      M = 1;
      A = i;
      B = i + 3;
      #100;
      if ((16-Result) !== A-B)
       begin
          $display("Error Result = %d for A = %d B = %d m = %", Result, A, B, M);
       end
      end
  end  
  //Add table
endmodule
