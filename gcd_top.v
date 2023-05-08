module gcd_top (
  input [3:0] A,
  input [3:0] B,
  input start,
  input clk,
  input rst,
  output reg [3:0] res
);
  wire equal_val, less_val;
  wire A_sel, B_sel, res_L, AL, BL;
  
    gcd_dp datapath(
    .clk(clk),
    .rst_dp(rst),
    .AL(AL),
    .BL(BL),
    .res_L(res_L),
    .equal_val(equal_val),
    .less_val(less_val),
    .A_sel(A_sel),
    .B_sel(B_sel),
    .A(A),
     .B(B),
     .res(res)
  );
  
  gcd_controller fsm (
    .clk(clk),
    .rst(rst),
    .AL(AL),
    .BL(BL),
    .res_L(res_L),
    .start(start),
    .equal_val(equal_val),
    .less_val(less_val),
    .A_sel(A_sel),
    .B_sel(B_sel)
  );
  

  
endmodule
