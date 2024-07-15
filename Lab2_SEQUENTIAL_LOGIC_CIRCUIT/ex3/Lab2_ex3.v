module Lab2_ex3(SW,LEDG,LEDR);
	input[17:0] SW;
	output[7:0] LEDG;
	output[17:0] LEDR;
	assign LEDR=SW;
	SR_flipflop DUT(.clk(SW[2]),.s(SW[1]),.r(SW[0]),.q(LEDG[0]),.q_bar(LEDG[1]));
endmodule

module SR_flipflop (
  input clk, rst_n,
  input s,r,
  output reg q,
  output q_bar
  );

  always@(posedge clk) begin // for synchronous reset
    if(rst_n) q <= 0;
    else begin
      case({s,r})
        2'b00: q <= q;   
        2'b01: q <= 1'b0; 
        2'b10: q <= 1'b1; 
        2'b11: q <= 1'bx; 
      endcase
    end
  end
  assign q_bar = ~q;
endmodule