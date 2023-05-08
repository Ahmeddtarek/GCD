module gcd_dp (
  input clk,
  input rst_dp,
  input A_sel,
  input B_sel,
  input AL,
  input BL,
  input wire [3:0] A,
  input wire [3:0] B,
  input res_L,
  wire equal_val,
  wire less_val,
  output reg [3:0] res
);
  wire [3:0] amb;
  wire [3:0] bma;
  wire [3:0] A1,B1,a1,b1;
  
 	mux_2to1 mux_a ( .x(A),
					 .sub_val(amb),
					 .sel(A_sel),
					 .out(a1)
	);
	mux_2to1 mux_b ( .x(B),
					 .sub_val(bma),
					 .sel(B_sel),
					 .out(b1)
	);
	register reg_A ( .clk(clk),
					 .rst(rst_dp),
					 .x(a1),
                    .out(A1),
                    .load(AL)
	);
	register reg_B ( .clk(clk),
					 .rst(rst_dp),
					 .x(b1),
                    .out(B1),
                    .load(BL)
	);
	register reg_out ( .clk(clk),
					   .rst(rst_dp),
                       .x(A1),
					   .out(res),
                       .load(res_L)
	);

  assign amb = A1 - B1;
  assign bma = B1 - A1;
  assign equal_val = (A1==B1)?1:0;
  assign less_val = (A1<B1)?1:0;

endmodule