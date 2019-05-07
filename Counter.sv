module Counter (
	input wire clk,
	input wire rst,

	output reg[6:0] digital_10,
	output reg[6:0] digital_1
);

	logic clk_1;

	logic [3:0] number_10;
	logic [3:0] number_1;

	ClockDivicer clock_divicer_inst (
		.clk_1M(clk),
		.clk_1(clk_1),
	);

	always_ff @ (posedge clk_1) begin
		if (rst) begin
			number_1 <= 0;
			number_10 <= 0;
		end else begin
			if (number_1 == 9 && number_10 == 5) begin
				number_1 <= 0;
				number_10 <= 0;
			end else if (number_1 == 9) begin
				number_1 <= 0;
				number_10 <= number_10 + 1;
			end else begin
				number_1 <= number_1 + 1;
			end
		end 
	end

	Decoder decoder_inst_1(
		.number(number_1),
		.digital(digital_1)
	);

	Decoder decoder_inst_10(
		.number(number_10),
		.digital(digital_10)
	);


endmodule
