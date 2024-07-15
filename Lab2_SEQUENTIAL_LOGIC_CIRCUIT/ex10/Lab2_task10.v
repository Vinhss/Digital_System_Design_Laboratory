//module Lab2_task10(SW,LEDR,LEDG,KEY);
//	input [17:0] SW;
//	input [3:0] KEY;
//	output [17:0] LEDR;
//	output [7:0] LEDG;
//	assign LEDR=SW;
//	synchronous_counter DUT(.clk(KEY[0]),.rst_n(SW[1]),.up_down(SW[0]),.cnt(LEDG[3:0]));
//endmodule
//
//
//module synchronous_counter(clk,rst_n,up_down,cnt);
//  input clk, rst_n;
//  input up_down;
//  output reg [3:0] cnt;
//  always@(negedge clk) begin
//    if(!rst_n) begin
//      cnt <= 4'h0;
//    end
//    else begin
//      if(up_down) cnt <= cnt + 1'b1;
//      else cnt <= cnt - 1'b1;
//    end
//  end
//endmodule



// Asynchonous 8-bit
module Lab2_task10(SW,LEDR,LEDG,KEY);
	input [17:0] SW;
	input [3:0] KEY;
	output [17:0] LEDR;
	output [7:0] LEDG;
	assign LEDR=SW;
	synchronous_counter DUT (.clk(KEY[0]),.rst_n(SW[1]),.up_down(SW[0]),.cnt(LEDG[7:0]));
	defparam DUT.N=8;
endmodule


module synchronous_counter (clk,rst_n,up_down,cnt);
	parameter N=4;
	input clk, rst_n;
	input up_down;
	output reg [N-1:0] cnt;
  always@(negedge clk or negedge rst_n) begin
    if(!rst_n) begin
      cnt <={N[0]};
    end
    else begin
      if(up_down) cnt <= cnt + 1'b1;
      else cnt <= cnt - 1'b1;
    end
  end
endmodule