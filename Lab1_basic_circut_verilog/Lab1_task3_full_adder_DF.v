

//module full_adder_DTFL(input a, b, c, output Sum, Cout);
//	assign Sum= a ^ b ^ c;
//	assign Cout= (a&b)|(b&c)|(a&c);
//endmodule

//module full_adder_STRU(A,B,Cin,Sum,Carry);
//	output Sum,Carry;
//	input A,B,Cin;
//	wire x,y,z;
//	xor g1(x,A,B);
//            xor g2(Sum,x,Cin);
//	and g3(y,x,Cin);
//	and g4(z,A,B);
//	or  g5(Carry,x,y);
//endmodule


//module full_adder_BH(a,b,c,sum,carry);
//	output sum,carry;
//	input  a,b,c;
//    reg    sum,carry;
//	always @ (a,b,c) 
//	  begin
//		sum   <= a^ b^c;
//		carry <=(a&b) | (b&c) | (c&a);
//	  end
//endmodule
module Lab1_task3(SW,LEDG,LEDR);	
	input[17:0] SW;
	output[7:0] LEDG;
	output[17:0] LEDR;
	assign LEDR= SW;
	full_adder DUT(SW[2],SW[1],SW[0],LEDG[1],LEDG[0]);
endmodule

module full_adder( A, B, Cin, S, Cout);
	input wire A, B, Cin;
	output reg S, Cout;

	always @(A or B or Cin)
	begin
	 if(A==0 && B==0 && Cin==0)
	  begin
		S=0;
		Cout=0;
	  end

	 else if(A==0 && B==0 && Cin==1)
	  begin
		S=1;
		Cout=0;
	  end

	 else if(A==0 && B==1 && Cin==0)
	  begin
		S=1;
		Cout=0;
	  end

	 else if(A==0 && B==1 && Cin==1)
	  begin
		S=0;
		Cout=1;
	  end

	 else if(A==1 && B==0 && Cin==0)
	  begin
		S=1;
		Cout=0;
	  end

	 else if(A==1 && B==0 && Cin==1)
	  begin
		S=0;
		Cout=1;
	  end

	 else if(A==1 && B==1 && Cin==0)
	  begin
		S=0;
		Cout=1;
	  end

	 else if(A==1 && B==1 && Cin==1)
	  begin
		S=1;
		Cout=1;
	  end

	end

endmodule
