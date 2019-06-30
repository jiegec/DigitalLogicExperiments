`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/17/2019 07:49:55 PM
// Design Name: 
// Module Name: TestCounter
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


module TestCounter(

    );

    logic clk;
    logic rst;
    logic sel;

    initial begin
	    clk = 0;
	    rst = 0;
	    sel = 0;
    end

    always begin
	    #1 clk = ~clk;
    end
    always begin
	    #600 rst = ~rst;
    end
    always begin
	    #300 sel = ~sel;
    end

    Counter counter_inst(
        .clk(clk),
	.rst(rst),
	.sel(sel)
    );
endmodule
