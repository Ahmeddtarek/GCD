module gcd_controller (
  input clk,
  input rst,
  input start,
  input equal_val,
  input less_val,
  output reg A_sel,
  output reg B_sel,
  output reg AL,
  output reg BL,
  output reg res_L
);
parameter state_reg_width = 3;
  parameter [state_reg_width - 1 : 0]  start_state = 3'd0,
                                       inputs = 3'd1,
									   equal = 3'd2,
									   compare =3'd3,
									   subA=3'd4,
									   subB =3'd5,
									   done=3'd6;
   reg [state_reg_width -1 : 0] curr_state , next_state ;
  
	always @(posedge clk)begin
		if(rst)
			begin
			curr_state <= start_state;
			end
		else 
			begin
			curr_state <= next_state;
			end
	end
  
  always @(*) begin
    AL = 0;
    BL = 0;
    A_sel = 0;
    B_sel = 0;
    res_L = 0;
    case (curr_state)
      start_state: begin
        if (start) next_state = inputs;
	    else next_state = start_state;
      end
      inputs: begin
        A_sel=0;
		B_sel=0;
		AL=1;
		BL=1;
		next_state = equal;
      end
      equal: begin
        if(equal_val) next_state = done;
        else next_state = compare;
      end
      compare: begin
        if(less_val) next_state = subB;
        else next_state = subA;
      end
      subA: begin
        A_sel = 1;
        AL = 1;
        BL = 0;
        B_sel = 0;
        res_L = 0;
        next_state = equal;
      end
      subB: begin
        B_sel = 1;
        BL = 1;
        AL = 0;
        AL = 0;
        res_L = 0;
        next_state = equal;
      end
      done: begin
        res_L = 1;
        if (rst) next_state = start_state;
		else next_state = done;
      end
    endcase
  end 
  
endmodule