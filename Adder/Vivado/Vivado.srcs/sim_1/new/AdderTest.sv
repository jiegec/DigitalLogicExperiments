`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/03/2019 04:27:27 PM
// Design Name: 
// Module Name: AdderTest
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module AdderTest(

    );

    logic [3:0] a;
    logic [3:0] b;
    logic c_in;
    logic sel;

    logic [3:0] s;
    logic c_out;

    initial begin
	    a = 0;
	    b = 0;
	    c_in = 0;
	    sel = 0;
    end

    always begin
	    #1 b = b + 1;
	    #1 a = a + 1;
    end
    always begin
	    #32 c_in = ~c_in;
    end
    always begin
	    #48 sel = ~sel;
    end

    Adder adder_inst(
	    .a(a),
	    .b(b),
	    .c_in(c_in),
	    .sel(sel),
	    .s(s),
	    .c_out(c_out)
    );
endmodule
