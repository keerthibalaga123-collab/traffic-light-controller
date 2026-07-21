`timescale 1ns/1ps

module traffic_light_controller_tb;

reg clk;
reg reset;

wire [2:0] highway;
wire [2:0] side;

traffic_light_controller uut(
    .clk(clk),
    .reset(reset),
    .highway(highway),
    .side(side)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;

    #10 reset = 0;

    #100;

    $finish;
end

endmodule
