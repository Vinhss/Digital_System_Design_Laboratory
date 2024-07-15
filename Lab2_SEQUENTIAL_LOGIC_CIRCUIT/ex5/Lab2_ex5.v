module Lab2_ex5(SW,LEDR,LEDG);
	input [17:0] SW;
	output [7:0] LEDR;
	output [17:0] LEDG;
	assign LEDR=SW;
	T_flipflop DUT(.clk(SW[2]), .t(SW[0]),.q(LEDG[0]),.q_bar(LEDG[1]));
endmodule

module T_flipflop (
  input clk, rst_n,
  input t,
  output reg q,
  output q_bar
  );
  
  // always@(posedge clk or negedge rst_n) // for asynchronous reset
  always@(posedge clk) begin // for synchronous reset
    if(rst_n) q <= 0;
    else begin
      q <= (t?~q:q);
    end
  end
  assign q_bar = ~q;
endmodule