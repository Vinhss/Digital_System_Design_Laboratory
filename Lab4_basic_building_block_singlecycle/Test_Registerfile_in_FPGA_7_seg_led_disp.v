module lab4_task5(SW,LEDR,LEDG,KEY,HEX7, HEX6, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0);
	input [17:0] SW;
    input [3:0] KEY;
    output [0:6] HEX7, HEX6, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0;
	output [17:0] LEDR;
	output [7:0] LEDG;
	wire  [7:0] W_read_data1,W_read_data2;
	
	assign LEDR = SW;
	assign LEDG[3:0] = KEY[3:0];
	
	hex_ssd C1(W_read_data1[3:0], HEX0);
	hex_ssd C2(W_read_data1[7:4], HEX1);
	
	hex_ssd C3(W_read_data2[3:0], HEX2);
	hex_ssd C4(W_read_data2[7:4], HEX3);
	
	Register_File DUT(.reset(KEY[2]),.RegWrite(KEY[1]), .clk(KEY[0]), .read_addr_1(SW[17:15]), .read_addr_2(SW[14:12]), .write_addr(SW[11:9]),.write_data(SW[7:0]), .read_data_1(W_read_data1), .read_data_2(W_read_data2));
	
endmodule


module hex_ssd (BIN, SSD);
  input [3:0] BIN;
  output reg [0:6] SSD;

  always begin
    case(BIN)
      0:SSD=7'b0000001;
      1:SSD=7'b1001111;
      2:SSD=7'b0010010;
      3:SSD=7'b0000110;
      4:SSD=7'b1001100;
      5:SSD=7'b0100100;
      6:SSD=7'b0100000;
      7:SSD=7'b0001111;
      8:SSD=7'b0000000;
      9:SSD=7'b0001100;
      10:SSD=7'b0001000;
      11:SSD=7'b1100000;
      12:SSD=7'b0110001;
      13:SSD=7'b1000010;
      14:SSD=7'b0110000;
      15:SSD=7'b0111000;
    endcase
  end
endmodule


module Register_File (read_addr_1, read_addr_2, write_addr, read_data_1, read_data_2, write_data, RegWrite, clk, reset);
	input [2:0] read_addr_1, read_addr_2, write_addr;
	input [7:0] write_data;
	input clk, reset, RegWrite;
	output [7:0] read_data_1, read_data_2;

	reg [7:0] Regfile [31:0];
	integer k;
	
	assign read_data_1 = Regfile[read_addr_1];

	assign read_data_2 = Regfile[read_addr_2];

	always @(posedge clk or negedge reset) // Ou combines the block of reset into the block of posedge clk
	begin
		if (reset==1'b0)
		begin
			for (k=0; k<8; k=k+1) 
			begin
				Regfile[k] = 8'b0;
			end
		end 
		
		else if (RegWrite == 1'b0) Regfile[write_addr] = write_data; 
	end
	
endmodule