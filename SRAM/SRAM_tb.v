`timescale 1ns / 1ps

module SRAM_tb();

    reg clk;
    reg reset;
    reg [4:0] address;
    reg wr_rd;
    reg [7:0] data_in;
    
    
    wire [7:0] data_out;
    
    integer i;
    
    SRAM uut(.clk(clk), 
             .reset(reset), 
             .address(address),
             .wr_rd(wr_rd),
             .data_in(data_in),
             .data_out(data_out)
            );
            
    always
        #5 clk = ~clk;
        
        
    initial begin 

        clk = 0; reset = 1; address =0; wr_rd=0; data_in=0; #50; 
        
        reset = 0; wr_rd = 1;
        
        // write contents
        for(i=0;i<32;i=i+1) begin
            @(negedge clk)
                address = i;
                data_in = i;
        end
        #20;

        // read contents
        wr_rd = 0;
        data_in = 0;
        for(i=0;i<32;i=i+1) begin
            @(negedge clk)
                address = i;
        end
        #20;
        $finish;
    end                  
endmodule
