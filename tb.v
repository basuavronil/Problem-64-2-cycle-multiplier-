`timescale 1ns/1ps
module tb;
    reg         clk = 0, rst = 1, valid_in = 0;
    reg  [7:0]  a, b;
    wire        valid_out;
    wire [15:0] p;

    mult_2cycle dut (clk, rst, valid_in, a, b, valid_out, p);

    always #5 clk = ~clk;

    initial begin
        $monitor("t=%0t a=%0d b=%0d | valid_out=%b p=%0d", $time, a, b, valid_out, p);
        #12 rst = 0;
        @(posedge clk); valid_in <= 1; a <= 3;  b <= 4;
        @(posedge clk); a <= 10; b <= 12;
        @(posedge clk); a <= 255; b <= 255;
        @(posedge clk); valid_in <= 0;
        #50 $finish;
    end
endmodule
