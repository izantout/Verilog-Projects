`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CSULB
// Engineer: Issam Zantout
// Create Date: 08/20/2020 01:44:22 PM
// Design Name: 301_Lab1
// Module Name: AddSubCLA_4bit_tb
// Revision 0.01 - File Created
//////////////////////////////////////////////////////////////////////////////////

module AddSubCLA_4bit_tb( );
    
    reg [3:0] a_tb, b_tb;
    reg  sel_tb;    
    wire c_out_tb, of_tb;
    wire [3:0] sum_tb;
    
    localparam period = 100;
    
    AddSubCLA_4bit uut (.a(a_tb), .b(b_tb), .sel(sel_tb), .sum(sum_tb), .carry(c_out_tb), .overflow(of_tb));
    
    initial begin
	// Case 1 Adding
	
	    a_tb = 4'b0101;
        b_tb = 4'b1001;
        sel_tb = 0;      // 5 + 9 = 14. Sum = 14, Overflow = 0
        #period;
        
        a_tb = 4'b0110;
        b_tb = 4'b1010;
        sel_tb = 0;      // 6 + 10 = 16. Sum = 16 Overflow = 1
        #period;
        
        a_tb = 4'b0100;
        b_tb = 4'b0101;
        sel_tb = 0;      // 4 + 5 = 9. Sum = 9 Overflow = 0
        #period;
        
        a_tb = 4'b1010;
        b_tb = 4'b0111;
        sel_tb = 0;      // 10 + 7 = 17. Sum = 17 Overflow = 1
        #period;
        
        a_tb = 4'b0100;
        b_tb = 4'b0111;
        sel_tb = 0;      // 4 + 7 = 11. Sum = 11 Overflow = 0
        #period;	
    
    	// Case 2 Subtracting

    	a_tb = 4'b0101;
        b_tb = 4'b1001;
        sel_tb = 1;      // 5 - 9 = -4. Sum = -4 Overflow = 0
        #period;
        
        a_tb = 4'b1010;
        b_tb = 4'b0110;
        sel_tb = 1;      // 10 - 6 = 4. Sum = 0 Overflow = 0
        #period;
        
        a_tb = 4'b0100;
        b_tb = 4'b0101;
        sel_tb = 1;      // 4 - 5 = -1. Sum = -1 Overflow = 0
        #period;
        
        a_tb = 4'b1010;
        b_tb = 4'b0111;
        sel_tb = 1;      // 10 - 7 = 3. Sum = 3 Overflow = 0
        #period;
        
        a_tb = 4'b0100;
        b_tb = 4'b0111;
        sel_tb = 1;      // 4 - 7 -3. Sum = -3 Overflow = 0
        #period;
    	
	$finish;
    end  
endmodule
