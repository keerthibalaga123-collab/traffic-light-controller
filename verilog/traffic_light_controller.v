module traffic_light_controller(
    input clk,
    input reset,
    output reg [2:0] highway,
    output reg [2:0] side
);

parameter HG_SR = 2'b00,
          HY_SR = 2'b01,
          HR_SG = 2'b10,
          HR_SY = 2'b11;

reg [1:0] state;

always @(posedge clk or posedge reset)
begin
    if(reset)
        state <= HG_SR;
    else
        state <= state + 1;
end

always @(*)
begin
    case(state)

    HG_SR:
    begin
        highway = 3'b100;
        side = 3'b001;
    end

    HY_SR:
    begin
        highway = 3'b010;
        side = 3'b001;
    end

    HR_SG:
    begin
        highway = 3'b001;
        side = 3'b100;
    end

    HR_SY:
    begin
        highway = 3'b001;
        side = 3'b010;
    end

    endcase
end

endmodule
