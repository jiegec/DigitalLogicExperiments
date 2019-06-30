module DigitalLife (
	input wire clk,
	input wire rst,
	output reg[6:0] digital,
	output reg[3:0] odd,
	output reg[3:0] even
);

	reg[31:0] counter;
	reg[3:0] count;

	Encoder encoder(.number(count), .digital(digital));

	always_ff @ (posedge clk) begin
		if (rst == 1'b1) begin
			count <= 1'b0;
			odd <= 1'b1;
			even <= 1'b0;
			counter <= 31'b0;
		end else begin
		  if (counter <= 31'd1048576) begin
				counter <= counter + 31'b1;
			end else begin
				counter <= 31'd0;
				if (count <= 4'd8) begin
					count <= count + 4'd1;
				end else begin
					count <= 4'd0;
				end
				if (odd <= 4'd7) begin
					odd <= odd + 4'd2;
				end else begin
					odd <= 4'd1;
				end
				if (even <= 4'd6) begin
					even <= even + 4'd2;
				end else begin
					even <= 4'd0;
				end
			end
		end
	end

endmodule // DigitalLife
