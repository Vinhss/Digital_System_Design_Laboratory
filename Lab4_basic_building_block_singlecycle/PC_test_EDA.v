module test_Program_Counter;
	reg t_clk, t_reset;
	reg [7:0] t_PC_in;
	wire [7:0] t_PC_out;
	Program_Counter DUT(.clk(t_clk), .reset(t_reset), .PC_in(t_PC_in), .PC_out(t_PC_out));
    initial begin
    $dumpfile("test_Program_Counter.vcd");
	$dumpvars(0,test_Program_Counter);
    $monitor($time,,"reset=%b |clk=%b | PC_in=%b | PC_out=%b |", t_reset,t_clk,, t_PC_in, t_PC_out);
        t_reset=1; t_clk=0; t_PC_in=8'b00000000;
      repeat(10) begin
              #5  t_clk=0;
              #5  t_PC_in = $random;
              #5  t_clk=1;
        end
    #5 $finish;
    end
endmodule

module Program_Counter (clk, reset, PC_in, PC_out);
	input clk, reset;
	input [7:0] PC_in;
	output [7:0] PC_out;
	reg [7:0] PC_out;
	always @ (posedge clk or posedge reset)
	begin
		if(reset==1'b1)
			PC_out<=8'b0;
		else
			PC_out<=PC_in;
	end
endmodule