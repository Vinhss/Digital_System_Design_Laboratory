module lab1_extra_1_a(SW,LEDR,LEDG);
	input [17:0] SW;
	output [17:0] LEDR;
	output [7:0]LEDG;
	assign LEDR=SW;
	mux81str DUT(.i(SW[10:3]),.s(SW[2:0]),.y(LEDG[0]));
endmodule

module mux81str(i,s,y);
input [7:0] i;
input [2:0] s;
output y;
wire [7:0] out_and;
wire [2:0] n_s;

not  N0(n_s[0],s[0]);
not  N1(n_s[1],s[1]);
not  N2(n_s[2],s[2]);

and G0(out_and[0],i[0], n_s[2], n_s[1], n_s[0]);
and G1(out_and[1],i[1], n_s[2], n_s[1], s[0]);
and G2(out_and[2],i[2], n_s[2], s[1], n_s[0]);
and G3(out_and[3],i[3], n_s[2], s[1], s[0]);
and G4(out_and[4],i[4], s[2], n_s[1], n_s[0]);
and G5(out_and[5],i[5], s[2], n_s[1], s[0]);
and G6(out_and[6],i[6], s[2], s[1], n_s[0]);
and G7(out_and[7],i[7], s[2], s[1], s[0]);
or  G8(y,out_and[7:0]);
endmodule