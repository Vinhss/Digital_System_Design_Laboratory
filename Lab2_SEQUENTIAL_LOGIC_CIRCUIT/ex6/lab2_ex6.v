module lab2_ex6(
    input [17:0] SW,
    output [17:0] LEDR,
    output LEDG,
    input KEY
);

    assign LEDR = SW;
    shift_right_register DUT(
        .clk(KEY),
        .rst(SW[1]),
        .d_in(SW[0]),
        .d_out(LEDG[3:0])
    );

endmodule

module shift_right_register(
    input clk, // clock input
    input rst, // reset input
    input d_in, // data input
    output reg [3:0] d_out // data output
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            d_out <= 4'b0000;
        end
        else begin
            if (shift_control) begin
					d_out <= {d_out[2:0], d_in};
				end
            else begin
                d_out <= {d_in, d_out[3:0]};
            end
        end
    end

endmodule


