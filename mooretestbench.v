`timescale 1ns/1ps

module tb_edge_detector_moore;

reg clk;
reg rst;
reg x;
wire out;

// DUT
edge_detector_moore dut (
    .clk(clk),
    .rst(rst),
    .x(x),
    .out(out)
);

// Clock generation (10 ns period)
always #5 clk = ~clk;

initial begin
    clk = 0;
    rst = 1;
    x   = 0;

    // Apply reset
    repeat(2) @(posedge clk);
    rst = 0;

    // Input sequence
    @(negedge clk) x = 0;   // Stay Low
    @(negedge clk) x = 1;   // Rising Edge
    @(negedge clk) x = 1;   // Stay High
    @(negedge clk) x = 0;   // Falling Edge
    @(negedge clk) x = 0;   // Stay Low
    @(negedge clk) x = 1;   // Rising Edge
    @(negedge clk) x = 0;   // Falling Edge
    @(negedge clk) x = 1;   // Rising Edge
    @(negedge clk) x = 1;   // Stay High
    @(negedge clk) x = 0;   // Falling Edge

    repeat(2) @(posedge clk);
    $finish;
end

initial begin
    $display("---------------------------------------------");
    $display("Time\tclk\trst\tx\tstate\tout");
    $display("---------------------------------------------");

    $monitor("%0t\t%b\t%b\t%b\t%02b\t%b",
              $time, clk, rst, x, dut.state, out);
end

endmodule