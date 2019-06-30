module ClockDivicer (
	input wire clk_1M,
	output reg clk_1
);
	logic [31:0] counter;

	always_ff @ (posedge clk_1M) begin
		if (counter == 32'd500000) begin
			counter <= 0;
			clk_1 <= ~clk_1;
		end else begin
			counter <= counter + 1;
		end
	end

endmodule
