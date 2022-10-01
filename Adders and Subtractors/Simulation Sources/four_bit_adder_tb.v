module four_bit_adder_tb;

reg [3:0] A;
reg [3:0] B;
reg Cin;

wire [3:0] Sum;
wire Co;
wire V;

integer i;

four_bit_adder uut(.A(A), .B(B), .Cin(Cin), .Sum(Sum), .Co(Co), .V(V));

 initial begin
 for (i = 0; i < 16; i = i + 1)
 begin
     if (i%4) Cin = 1; else Cin = 0;
         A = i;
         B = i + 10;
    
         if (1 == 15) begin A = 1; B = 16'hFFFF; end
    
         #100;
    
         if (Sum !== A+B+Cin)
             begin
                 $display("Error Sum = %d Co = %d V = % d for A = %d B = %d Cin = %d",Sum , Co, V ,A ,B ,Cin);
             end
      end
 end 

//add table for expected outputs and screenshots
endmodule
