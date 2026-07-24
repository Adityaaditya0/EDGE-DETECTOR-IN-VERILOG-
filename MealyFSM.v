// Code your design here
module egde_detector(clk,rst,x,out);
input clk;
input rst;
input x;  
output out;
  parameter s0=1'b0;
  parameter s1=1'b1;
  reg state ,nextstate;
  always @ (posedge clk) begin
    if(rst)
      state<=s0;
    else
      state<=nextstate;
  end
  always @(*)begin
    case(state)
      s0:begin
        if(x==0)
        nextstate=s0;
      else
        nextstate=s1;
      end
      s1:begin if(x==0)
        nextstate=s0;
      else
        nextstate=s1;
      end
    endcase
  end
  assign out=state^x;
endmodule
