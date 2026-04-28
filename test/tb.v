
`timescale 1ns/1ps

module tb;

    // Standard User IO
    reg  [7:0] ui_in;
    wire [7:0] uo_out;
    
    // Bidirectional User IO split ports 
    reg  [7:0] uio_in;
    wire [7:0] uio_out;
    wire [7:0] uio_oe;

    // Control and Power signals [cite: 2]
    reg        clk;
    reg        rst_n;
    reg        ena;

    // Analog Bus 
    wire [7:0] ua;

    // DUT Instantiation
    tt_um_bgr dut (
        .ui_in   (ui_in),
        .uo_out  (uo_out),
        .uio_in  (uio_in),
        .uio_out (uio_out),
        .uio_oe  (uio_oe),
        .clk     (clk),
        .rst_n   (rst_n),
        .ena     (ena),
        .ua      (ua)
    );

    initial begin
        // Initialize Inputs 
        ui_in  = 8'b0;
        uio_in = 8'b0;
        clk    = 0;
        rst_n  = 0;
        ena    = 1;     // Enable the design

       #10 rst_n = 1;

        $display("ua[0] = %b", ua[0]);

        #50;
        $finish;
    end

    always #5 clk = ~clk;

endmodule
