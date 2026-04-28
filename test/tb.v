
`timescale 1ns/1ps

module tb;

    reg  [7:0] ui_in;
    wire [7:0] uo_out;
    wire [7:0] uio;
    reg        clk;
    reg        rst_n;
    reg	       ena;
    wire [7:0] ua;

    // DUT
    tt_um_bgr dut (
        .ui_in(ui_in),
        .uo_out(uo_out),
        .uio(uio),
        .clk(clk),
        .rst_n(rst_n),
	.ena(ena),
        .ua(ua)
    );

    initial begin
        // Init
        ui_in = 8'b0;
        clk = 0;
        rst_n = 0;
        ena=1;
        #10 rst_n = 1;

        $display("ua[0] = %b", ua[0]);

        #50;
        $finish;
    end

    always #5 clk = ~clk;

endmodule
