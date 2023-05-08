module mux_2to1 (
  input [3:0] x,sub_val,
	input sel,
  output [3:0] out
);
  assign out = (sel==1) ? sub_val:x;
endmodule
