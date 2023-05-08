module register (
	input clk,
	input rst,
	input load,
  input [3:0] x,
  output reg [3:0] out
);
	always @(posedge clk) begin
		if (rst)
		begin
			out <= 0;
		end
		else 
		begin
			if(load) out <= x;
			else out <= out ;
		end
	end
endmodule
