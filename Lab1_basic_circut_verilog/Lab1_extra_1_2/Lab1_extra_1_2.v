
//module Lab1_extra_1_2(SW,LEDR,LEDG);
//	input [17:0] SW;
//	output [17:0] LEDR;
//	output [0:7] LEDG;
//	assign LEDR=SW;
//	mux81str DUT(.i0(SW[0]),.i1(SW[1]),.i2(SW[2]),.i3(SW[3]),.i4(SW[4]),.i5(SW[5]),.i6(SW[6]),.i7(SW[7]),.s0(SW[8]),.s1(SW[9]),.s2(SW[10]),.y(LEDG[0]));
//endmodule

//module mux81str(i0,i1,i2,i3,i4,i5,i6,i7,s0,s1,s2,y);
//	input i0,i1,i2,i3,i4,i5,i6,i7,s0,s1,s2;
//	output y;
//	wire a,b,c,d,e,f,g,h,n_s0,n_s1,n_s2;
//	not  N0(n_s0,s0);
//	not  N1(n_s1,s1);
//	not  N2(n_s2,s2);
//	and G0(a,i0, n_s2, n_s1, n_s0);
//	and G1(b,i1, n_s2, n_s1, s0);
//	and G2(c,i2, n_s2, s1, n_s0);
//	and G3(d,i3, n_s2, s1, s0);
//	and G4(e,i4, s2, n_s1, n_s0);
//	and G5(f,i5, s2, n_s1, s0);
//	and G6(g,i6, s2, s1, n_s0);
//	and G7(h,i7, s2, s1, s0);
//	or  G8(y,a,b,c,d,e,f,g,h);
//endmodule


// 1:8 demulti
module demulti(d, s0, s1, s2,y0,y1,y2,y3,y4,y5,y6,y7);
	input d, s0, s1, s2;
	output y0,y1,y2,y3,y4,y5,y6,y7;
	wire n_s0,n_s1,n_s2;