module testbench_PC_add_1;
		reg clk, reset;
		wire [7:0] instruction_address;
    PC_ADD_1  DUT(.clk(clk), .reset(reset), .instruction_address(instruction_address)); 
  
    always #5 clk = ~clk;
  
    initial begin
        $dumpfile("testbench_PC_add_1.vcd");
	    $dumpvars(0,testbench_PC_add_1);
      $monitor($time,,"reset=%b,clk=%b,instruction_address=%b", reset,clk,instruction_address);
        reset=1; clk=0;
      #5 reset=0;
      #100 $finish;
    end
endmodule

module PC_ADD_1(clk, reset, instruction_address);
input clk, reset;
output [7:0] instruction_address;
wire [7:0] W_PC_add_1;
Program_Counter C1(.clk(clk), .reset(reset), .PC_in(W_PC_add_1), .PC_out(instruction_address));
  Adder32Bit     C2(.input1(8'b1), .input2(instruction_address), .out(W_PC_add_1));

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

module Adder32Bit(input1, input2, out);

 input [7:0] input1, input2;
 output [7:0] out;
 reg [7:0]out;
 always@( input1 or input2)
 begin
 	out  <= input1 + input2;
 end
endmodule

