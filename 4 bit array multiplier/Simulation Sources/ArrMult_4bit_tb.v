module ArrMult_4bit_tb();
reg [3:0] a_tb, b_tb;
wire [7:0] prod_tb;

ArrMult_4bit uut(.a(a_tb), .b(b_tb), .prod(prod_tb));

initial begin
    // Test case 1
    a_tb = 4'b1101;
    b_tb = 4'b1001;
    #10
    
    // Test case 2
    a_tb = 4'b0000;
    b_tb = 4'b1111;
    #10
    
    // Test case 3
    a_tb = 4'b1010;
    b_tb = 4'b0101;
    #10
    
    // Test case 4
    a_tb = 4'b1100;
    b_tb = 4'b0011;
    #10
    
    // Test case 5
    a_tb = 4'b1010;
    b_tb = 4'b1101;
    #10
    
    // Test case 6
    a_tb = 4'b1000;
    b_tb = 4'b0000;
    #10
    
    $finish;
end
endmodule
