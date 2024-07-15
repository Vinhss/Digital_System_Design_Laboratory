//module Lab1_task2(SW,LEDR,LEDG);
//	input[0:17] SW;
//	output[0:7] LEDR;
//	output[0:17] LEDG;
//	assign LEDG=SW;
//	half_adder_behavior DUT(.a(SW[0]),.b(SW[1]),.s(LEDR[0]),.Cout(LEDR[1]));
//endmodule
	
//module half_adder_structeral(input a, b, output s, Cout);
//		xor G1(s,a,b);
//		and G2(Cout,a,b);
//	endmodule

//module half_adder_dataflow(input a, b, output s, Cout);
//  assign s = a ^ b;
//  assign Cout = a & b;
//endmodule


module Lab1_task2(SW,LEDR,LEDG);
	input[0:17] SW;
	output[0:7] LEDR;
	output[0:17] LEDG;
	assign LEDG=SW;
	half_adder_behavior DUT(.a(SW[0]),.b(SW[1]),.sum(LEDR[0]),.carry(LEDR[1]));
endmodule

module half_adder_behavior(sum,carry,a,b );
	output sum,carry;
	input a,b;
	reg sum,carry;
	always @(a,b) 
	begin
		sum   <= a ^ b;
		carry <= a&b  ;
	end
endmodule
