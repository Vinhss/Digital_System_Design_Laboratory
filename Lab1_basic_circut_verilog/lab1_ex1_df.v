// Data flow
//module lab1_ex1(SW,LEDG,LEDR);
//	input[17:0] SW;
//	output[7:0] LEDG;
//	output[17:0] LEDR;
//	assign LEDR=SW;
//	allgate_DF DUT(.a(SW[1]),.b(SW[0]),.yand(LEDG[6]),.yor(LEDG[5]),.ynot(LEDG[4]),.ynand(LEDG[3]),.ynor(LEDG[2]),.yxor(LEDG[1]),.yxnor(LEDG[0]));
//endmodule
//
//module allgate_DF ( a, b, yand,yor,ynot,ynand,ynor,yxor,yxnor );
//input a,b;
//	output yand, yor, ynot, ynand, ynor, yxor, yxnor;
//	assign yand = a & b;		// AND Operation
//	assign yor = a | b;		// OR Operation
//	assign ynot = ~a ;		// NOT Operation
//	assign ynand = ~(a & b);	// NAND Operation
//	assign ynor = ~(a | b);		//NOR Operation
//	assign yxor = a ^ b;		//XOR Operation
//	assign yxnor =~(a^b);		//XNOR Operation
//endmodule    

// Structural
module lab1_ex1(SW,LEDG,LEDR);
	input[17:0] SW;
	output[7:0] LEDG;
	output[17:0] LEDR;
	assign LEDR=SW;
	allgate DUT(SW[1],SW[2],LEDG[5],LEDG[4],LEDG[3],LEDG[2],LEDG[1],LEDG[0]);
endmodule

module allgate ( a, b, yand,yor,ynot,ynand,ynor,yxor,yxnor );
	input a,b;
	output yand, yor, ynot, ynand, ynor, yxor, yxnor;
	assign yand = a & b;		// AND Operation
	assign yor = a | b;		// OR Operation
	assign ynot = ~a ;		// NOT Operation
	assign ynand = ~(a & b);	// NAND Operation
	assign ynor = ~(a | b);		//NOR Operation
	assign yxor = a ^ b;		//XOR Operation
	assign yxnor =~(a^b);		//XNOR Operation
endmodule


// behavior
//module lab1_ex1(SW,LEDG,LEDR);
//	input[17:0] SW;
//	output[7:0] LEDG;
//	output[17:0] LEDR;
//	assign LEDR=SW;
//	allgate_BH DUT(SW[1],SW[2],LEDG[5],LEDG[4],LEDG[3],LEDG[2],LEDG[1],LEDG[0]);
//endmodule
//
//module allgate_BH ( a, b, yand,yor,ynot,ynand,ynor,yxor,yxnor );
//	input a,b;
//	output  yand, yor, ynot, ynand, ynor, yxor, yxnor;
//	reg  yand, yor, ynot, ynand, ynor, yxor, yxnor;
//	always @(*)
//	begin
//		 yand = a & b;		// AND Operation
//		 yor = a | b;		// OR Operation
//		 ynot = ~a ;		// NOT Operation
//		 ynand = ~(a & b);	// NAND Operation
//		 ynor = ~(a | b);		//NOR Operation
//		 yxor = a ^ b;		//XOR Operation
//		 yxnor =~(a^b);		//XNOR Operation
//	end
//endmodule



