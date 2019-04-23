module Adder (
	input [3:0] a,
	input [3:0] b,
	input c_in,
	input sel,
	output [3:0]s,
	output c_out
);

	logic [2:0] c_temp_1;
	logic c_out_1;
	logic [3:0] s_1;

	FullAdder fulladder_inst(
		.a(a[0]),
		.b(b[0]),
		.c_in(c_in),
		.c_out(c_temp_1[0]),
		.s(s_1[0])
	);
	FullAdder fulladder_inst_1(
		.a(a[1]),
		.b(b[1]),
		.c_in(c_temp_1[0]),
		.c_out(c_temp_1[1]),
		.s(s_1[1])
	);
	FullAdder fulladder_inst_2(
		.a(a[2]),
		.b(b[2]),
		.c_in(c_temp_1[1]),
		.c_out(c_temp_1[2]),
		.s(s_1[2])
	);
	FullAdder fulladder_inst_3(
		.a(a[3]),
		.b(b[3]),
		.c_in(c_temp_1[2]),
		.c_out(c_out_1),
		.s(s_1[3])
	);

	logic c_out_2;
	logic [3:0] s_2;
	logic [3:0] c_temp_2;
	logic [3:0] g;
	logic [3:0] p;

	FullAdder2 fulladder2_inst(
		.a(a[0]),
		.b(b[0]),
		.p(p[0]),
		.g(g[0])
	);
	FullAdder2 fulladder2_inst_1(
		.a(a[1]),
		.b(b[1]),
		.p(p[1]),
		.g(g[1])
	);
	FullAdder2 fulladder2_inst_2(
		.a(a[2]),
		.b(b[2]),
		.p(p[2]),
		.g(g[2])
	);
	FullAdder2 fulladder2_inst_3(
		.a(a[3]),
		.b(b[3]),
		.p(p[3]),
		.g(g[3])
	);

	assign c_temp_2[0] = g[0] | (p[0] & c_in);
	assign c_temp_2[1] = g[1] | (p[1] & c_temp_2[0]);
	assign c_temp_2[2] = g[2] | (p[2] & c_temp_2[1]);
	assign c_temp_2[3] = g[3] | (p[3] & c_temp_2[2]);
	assign c_out_2 = c_temp_2[3];

	assign s_2[0] = p[0] ^ c_in;
	assign s_2[1] = p[1] ^ c_temp_2[0];
	assign s_2[2] = p[2] ^ c_temp_2[1];
	assign s_2[3] = p[3] ^ c_temp_2[2];

	logic [3:0] s_3;
	logic c_out_3;

	FullAdder3 fulladder3_inst(
		.a(a),
		.b(b),
		.c_in(c_in),
		.s(s_3),
		.c_out(c_out_3)
	);

	always_comb begin
		// no way to use all three full adders
		if (sel) begin
			c_out = c_out_1;
			s = s_1;
		end else begin
			c_out = c_out_2;
			s = s_2;
		end
	end
endmodule // Adder
