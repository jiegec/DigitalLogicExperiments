module DigitalLife (
	input wire clk,
	input wire rst,
	output reg [3:0] count
);

	always_ff @ (posedge clk) begin
		if (rst == 1'b1) begin
			count <= 4'b0000;
		end else begin
		   if (count <= 4'b1000) begin
				count <= count + 4'b1;
			end else begin
				count <= 0;
			end
		end
	end

endmodule // DigitalLife
