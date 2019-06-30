module HalfAdder (
	input a,
	input b,
	output s,
	output c_out
);
	assign s = a ^ b;
	assign c_out = a & b;
endmodule // HalfAdder
