module ArrMult_4bit(
    input [3:0] a, b,
    output [7:0] prod
    );

    wire [10:0] carry;
    wire [5:0] partialSum;

    //Partial Products
    wire [3:0] pp [0:3];
    
    //Asign Patrial Products
    
        //row 0
        mux2to1 m00(.a(a[0]), .b(1'b0), .sel(b[0]), .out(pp[0][0]));
        mux2to1 m01(.a(a[1]), .b(1'b0), .sel(b[0]), .out(pp[0][1]));
        mux2to1 m02(.a(a[2]), .b(1'b0), .sel(b[0]), .out(pp[0][2]));
        mux2to1 m03(.a(a[3]), .b(1'b0), .sel(b[0]), .out(pp[0][3]));
    
        //row 1
        mux2to1 m04(.a(a[0]), .b(1'b0), .sel(b[1]), .out(pp[1][0]));
        mux2to1 m05(.a(a[1]), .b(1'b0), .sel(b[1]), .out(pp[1][1]));
        mux2to1 m06(.a(a[2]), .b(1'b0), .sel(b[1]), .out(pp[1][2]));
        mux2to1 m07(.a(a[3]), .b(1'b0), .sel(b[1]), .out(pp[1][3]));
        
        //row 2
        mux2to1 m08(.a(a[0]), .b(1'b0), .sel(b[2]), .out(pp[2][0]));
        mux2to1 m09(.a(a[1]), .b(1'b0), .sel(b[2]), .out(pp[2][1]));
        mux2to1 m10(.a(a[2]), .b(1'b0), .sel(b[2]), .out(pp[2][2]));
        mux2to1 m11(.a(a[3]), .b(1'b0), .sel(b[2]), .out(pp[2][3]));
        
        //row 3
        mux2to1 m12(.a(a[0]), .b(1'b0), .sel(b[3]), .out(pp[3][0]));
        mux2to1 m13(.a(a[1]), .b(1'b0), .sel(b[3]), .out(pp[3][1]));
        mux2to1 m14(.a(a[2]), .b(1'b0), .sel(b[3]), .out(pp[3][2]));
        mux2to1 m15(.a(a[3]), .b(1'b0), .sel(b[3]), .out(pp[3][3]));
        
    //Assign Adding Circuit
    
        //sum 0
        assign prod[0] = pp[0][0];
        
        //sum 1
        HA h0(.a(pp[1][0]), .b(pp[0][1]), .c_out(carry[0]), .sum(prod[1]));
    
        //sum 2
        FA f0(.a(pp[1][1]), .b(pp[0][2]), .c_in(carry[0]), .c_out(carry[1]), .sum(partialSum[0]));
        HA h1(.a(pp[2][0]), .b(partialSum[0]), .c_out(carry[2]), .sum(prod[2]));
    
        //sum 3
        HA h2(.a(carry[1]), .b(carry[2]), .c_out(carry[3]), .sum(partialSum[1]));
        FA f1(.a(pp[1][2]), .b(pp[0][3]), .c_in(partialSum[1]), .c_out(carry[4]), .sum(partialSum[2]));
        FA f2(.a(pp[3][0]), .b(pp[2][1]), .c_in(partialSum[2]), .c_out(carry[5]), .sum(prod[3]));
        
        //sum 4
        FA f3(.a(carry[3]), .b(carry[4]), .c_in(carry[5]), .c_out(carry[6]), .sum(partialSum[3]));
        FA f4(.a(pp[2][2]), .b(pp[1][3]), .c_in(partialSum[3]), .c_out(carry[7]), .sum(partialSum[4]));
        HA h3(.a(pp[3][1]), .b(partialSum[4]), .c_out(carry[8]), .sum(prod[4]));
        
        //sum 5
        FA f5(.a(carry[6]), .b(carry[7]), .c_in(carry[8]), .c_out(carry[9]), .sum(partialSum[5]));
        FA f6(.a(pp[3][2]), .b(pp[2][3]), .c_in(partialSum[5]), .c_out(carry[10]), .sum(prod[5]));
        
        //sum 6 & sum 7
        FA f7(.a(pp[3][3]), .b(carry[9]), .c_in(carry[10]), .c_out(prod[7]), .sum(prod[6]));

endmodule
