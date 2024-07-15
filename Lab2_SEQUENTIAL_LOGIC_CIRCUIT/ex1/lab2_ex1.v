module lab2_ex1(SW,LEDR,LEDG);
	input [17:0] SW;
	output [7:0] LEDR;
	output [17:0] LEDG;
	assign LEDR=SW;
	D_flipflop DUT(.clk(SW[0]), .rst_n(SW[2]),.d(SW[1]),.q(LEDG[0]));
endmodule

module D_flipflop (
  input clk, rst_n,
  input d,
  output reg q
  );
  always@(posedge clk or posedge rst_n) begin
    if(rst_n) q <= 0;
    else       q <= d;
  end
endmodule