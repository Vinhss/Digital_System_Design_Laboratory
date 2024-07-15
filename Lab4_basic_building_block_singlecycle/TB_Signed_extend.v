module TB_Signed_extend;
reg [15:0] sign_in;
wire [31:0] sign_out;

Sign_Extension DUT(.sign_in(sign_in), .sign_out(sign_out));
   initial  begin
   $monitor($time,"sign_in=%b, sign_out=%b",sign_in, sign_out); 
        sign_in=16'b0110000110000000; // sign_out=32'h00007d01
   #5   sign_in=16'b1110000110000000; // sign_out=32'hffff8d01
   #5 $finish;	
	end
endmodule

module Sign_Extension (sign_in, sign_out);
	input [15:0] sign_in;
	output [31:0] sign_out;
	assign sign_out[15:0]=sign_in[15:0];
	assign sign_out[31:16]=sign_in[15]?16'b1111111111111111:16'b0;
endmodule