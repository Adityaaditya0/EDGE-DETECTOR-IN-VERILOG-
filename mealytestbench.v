`timescale 1ns/1ps

module tb_edge_detector_moore;

reg clk;
reg rst;
reg x;
wire out;

edge_detector_moore dut(
    .clk(clk),
    .rst(rst),
    .x(x),
    .out(out)
);

always #5 clk = ~clk;

initial begin

    clk = 0;
    rst = 1;
    x = 0;

    #12 rst = 0;

    #10 x = 0;
    #10 x = 1;
    #10 x = 1;
    #10 x = 0;
    #10 x = 0;
    #10 x = 1;
    #10 x = 0;

    #20;
    $finish;
end

initial begin
    $monitor("Time=%0t x=%b state=%b out=%b",
              $time, x, dut.state, out);
end

endmodule