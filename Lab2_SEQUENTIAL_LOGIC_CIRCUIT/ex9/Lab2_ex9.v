module Lab2_ex9(SW,LEDR,LEDG,KEY);
	input [17:0] SW;
	output [17:0] LEDR;
	output [7:0] LEDG;
	input [3:0] KEY;
	assign LEDR=SW;
	Universal_shift_register DUT(.shift_control(SW[1]),.clk(KEY[0]), .rst(SW[2]),.d_in(SW[0]),.d_out(LEDG[7:0]));
	defparam DUT.N=8;
endmodule

module Universal_shift_register(clk,rst,shift_control,d_in,d_out);
        parameter N=7;
        input clk; // clock input
        input rst; // reset input
		input shift_control;
        input d_in; // data input
        output reg [N-1:0] d_out; // data output

        always @(posedge clk or posedge rst) begin
        if (rst) begin
                 d_out <= {N['b0]};
            end
        else
		    begin
			 if(shift_control) begin
                     d_out<={d_out[N-1:0],d_in};  // shift left 
			 end
			 else   begin
			        d_out<={d_in,d_out[N-1:1]};  // shift right
			 end
			end
end
//this is a right shift condition , it is showing that in d_out the user given d_in will be msb and rest 3 bit of existing d_out will be at end means it is shifting right side 
//For left shift condition we can use as: d_out<={d_out[3:1], din};
endmodule