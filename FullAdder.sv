module FullAdder (
	input a,
	input b,
	input c_in,
	output s,
	output c_out
);
	assign s = a ^ b ^ c_in;
	assign c_out = (a & b) | (b & c_in) | (a & c_in);
endmodule // FullAdder
