module Boolean_function_tb();

//inputs
    reg a_tb;
    reg b_tb;
    reg c_tb;
        
//outputs

    wire z_tb;

//instatiate the function

Boolean_function uut(.a(a_tb), .b(b_tb), .c(c_tb), .z(z_tb));

initial begin

// inputs

a_tb = 0;
b_tb = 0;       
c_tb = 0;
#100;

a_tb = 0;
b_tb = 0;
c_tb = 1;
#100;

a_tb = 0;
b_tb = 1;
c_tb = 0;
#100;

a_tb = 0;
b_tb = 1;
c_tb = 1;
#100;

a_tb = 1;
b_tb = 0;
c_tb = 0;
#100;

a_tb = 1;
b_tb = 0;
c_tb = 1;
#100;

a_tb = 1;
b_tb = 1;
c_tb = 0;
#100;

a_tb = 1;
b_tb = 1;
c_tb = 1;
#100;

end

endmodule 
