//module Program_Counter (clk, reset, PC_in, PC_out);
//	input clk, reset;
//	input [7:0] PC_in;
//	output [7:0] PC_out;
//	reg [7:0] PC_out;
//	always @ (posedge clk or posedge reset)
//	begin
//		if(reset==1'b1)
//			PC_out<=8'b0;
//		else
//			PC_out<=PC_in;
//	end
//endmodule
//
//module lab4_task1(SW,LEDR,LEDG,KEY);
//	input [17:0] SW;
//   input [3:0] KEY;
//	output [17:0] LEDG;
//	output LEDR;
//	assign LEDR=SW;
//	Program_Counter (.clk(KEY[0]), .reset(SW[17]), .PC_in(SW[7:0]), .PC_out(LEDG[7:0]));
//endmodule



// -----------------------------------------------------------------------------------------
module PC_ADD_1(clk, reset, instruction_address);
input clk, reset;
output [7:0] instruction_address;
wire  W_PC_add_1;
Program_Counter C1(.clk(clk), .reset(reset), .PC_in(W_PC_add_1), .PC_out(instruction_address));
Adder32Bit      C2(.input1(8'b1), .input2(instruction_address), .out(instruction_address));

endmodule

module Program_Counter (clk, reset, PC_in, PC_out);
	input clk, reset;
	input [7:0] PC_in;
	output [7:0] PC_out;
	reg [7:0] PC_out;
	always @ (posedge clk or posedge reset)
	begin
		if(reset==1'b1)
			PC_out<=8’b0;
		else
			PC_out<=PC_in;
	end
endmodule

module Adder32Bit(input1, input2, out);

 input [7:0] input1, input2;
 output [7:0] out;
 reg [7:0]out;
 always@( input1 or input2)
 begin
 	out  <= input1 + input2;
 end
endmodule
