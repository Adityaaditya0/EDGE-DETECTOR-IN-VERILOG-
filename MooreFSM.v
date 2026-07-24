module edge_detector_moore(
    input clk,
    input rst,
    input x,
    output reg out
);

parameter S0 = 2'b00;
parameter SR = 2'b01;
parameter S1 = 2'b10;
parameter SF = 2'b11;

reg [1:0] state, nextstate;

//
// State Register
//
always @(posedge clk) begin
    if (rst)
        state <= S0;
    else
        state <= nextstate;
end

//
// Next-State Logic
always @(*) begin
    case(state)

        S0:
            if(x)
                nextstate = SR;
            else
                nextstate = S0;

        SR:
            nextstate = S1;

        S1:
            if(!x)
                nextstate = SF;
            else
                nextstate = S1;

        SF:
            nextstate = S0;

        default:
            nextstate = S0;

    endcase
end

//
// Output Logic (Moore)
//
always @(*) begin
    case(state)

        S0 : out = 1'b0;
        SR : out = 1'b1;
        S1 : out = 1'b0;
        SF : out = 1'b1;

        default : out = 1'b0;

    endcase
end

endmodule