module SerialLock(
	input rst,
	input clk,
	input [3:0] code,
	input [1:0] mode, // 00: set, 01: verify, 10: admin
	output logic unlock,
	output logic err
);

	logic [15:0] passcode = 0;
	logic [15:0] admin = 16'b0011_0011_0011_0010;

	logic [15:0] input_code = 0;
	logic [1:0] input_count = 0;
	logic [4:0] fail_count = 0;

	always @ (posedge clk or posedge rst) begin
		if (rst) begin
			input_count <= 0;
			input_code <= 0;
			err <= (mode == 2'b10 || fail_count < 3) ? 0 : 1;
			unlock <= 0;
		end else if (clk && mode == 2'b01 && err == 0 && unlock == 0) begin
			case (input_count)
				2'b00: begin
					if (passcode[3:0] == code) begin
						input_count <= input_count + 1;
					end else begin
						err <= 1;
						fail_count <= fail_count + 1;
					end
				end
				2'b01: begin
					if (passcode[7:4] == code) begin
						input_count <= input_count + 1;
					end else begin
						err <= 1;
						fail_count <= fail_count + 1;
					end
				end
				2'b10: begin
					if (passcode[11:8] == code) begin
						input_count <= input_count + 1;
					end else begin
						err <= 1;
						fail_count <= fail_count + 1;
					end
				end
				2'b11: begin
					if (passcode[15:12] == code) begin
						unlock <= 1;
						fail_count <= 0;
					end else begin
						err <= 1;
						fail_count <= fail_count + 1;
					end
				end
			endcase
		end else if (clk && mode == 2'b00 && unlock == 0) begin
			case (input_count)
				2'b00: begin
					passcode[3:0] <= code;
					input_count <= input_count + 1;
					unlock <= 0;
				end
				2'b01: begin
					passcode[7:4] <= code;
					input_count <= input_count + 1;
					unlock <= 0;
				end
				2'b10: begin
					passcode[11:8] <= code;
					input_count <= input_count + 1;
					unlock <= 0;
				end
				2'b11: begin
					passcode[15:12] <= code;
					input_count <= input_count + 1;
					unlock <= 1;
					fail_count <= 0;
				end
			endcase
		end else if (clk && mode == 2'b10 && err == 0 && unlock == 0) begin
			case (input_count)
				2'b00: begin
					if (admin[3:0] == code) begin
						input_count <= input_count + 1;
					end else begin
						err <= 1;
					end
				end
				2'b01: begin
					if (admin[7:4] == code) begin
						input_count <= input_count + 1;
					end else begin
						err <= 1;
					end
				end
				2'b10: begin
					if (admin[11:8] == code) begin
						input_count <= input_count + 1;
					end else begin
						err <= 1;
					end
				end
				2'b11: begin
					if (admin[15:12] == code) begin
						unlock <= 1;
						fail_count <= 0;
					end else begin
						err <= 1;
					end
				end
			endcase
		end
	end

endmodule
