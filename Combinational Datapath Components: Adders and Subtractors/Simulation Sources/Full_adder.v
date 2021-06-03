module Full_adder(
    input a,
    input b,
    input ci,
    output s,
    output co
    );
    
    assign s = a ^ b ^ ci;
    assign co = (a & b) | (a & ci) | (b & ci);
    
    //delay 
    //assign #10 s = a + b + ci;
    //assign #10 co = a&b + a&ci + b&ci;
endmodule
