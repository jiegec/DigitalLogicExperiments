module DigitalLife (
	input wire clk,
	input wire rst_n,
	output reg count[4:0]
);

	always_ff @ (posedge clk) begin
		if (rst_n == '0') begin
			count = 4b'0000;
		else
			count = count + 1;
		end
	end

end module // DigitalLife
