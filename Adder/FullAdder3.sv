module FullAdder3 (
	input [3:0]a,
	input [3:0]b,
	input c_in,
	output [3:0]s,
	output c_out
);
	assign {c_out, s} = a + b + c_in;
endmodule // FullAdder3
