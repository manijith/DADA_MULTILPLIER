`timescale 1ns / 1ps
module dadda_test;

	// Inputs
	reg [15:0] multiplier;
	reg [15:0] multiplicand;

	// Outputs
	wire [31:0] product;

	// Unit Under Test (UUT)
	dadda_multiplier uut (
		.multpr(multiplier), 
		.multpcd(multiplicand), 
		.product(product)
	);
integer i,j;
	initial begin
		// Initialize Inputs
		multiplier = 0;
		multiplicand = 0;
		
for(i=0;i<65535;i=i+1)
for(j=0;j<65535;j=j+1)
begin
 multiplier=i+1;
 multiplicand=j;
 #5;

end
		// Wait 100 ns 
		#100 $stop;
        
	end
      
endmodule
