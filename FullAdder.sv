module FullAdder (
	input a,
	input b,
	input c_in,
	output s,
	output c_out
);
	logic s_1;
	logic c_1;
	logic c_2;
	HalfAdder half_adder_inst_1(
		.a(a),
		.b(b),
		.s(s_1),
		.c_out(c_1)
	);
	HalfAdder half_adder_inst_2(
		.a(c_in),
		.b(s_1),
		.s(s),
		.c_out(c_2)
	);
	assign c_out = c_1 | c_2;

	//assign s = a ^ b ^ c_in;
	//assign c_out = (a & b) | (b & c_in) | (a & c_in);
endmodule // FullAdder
