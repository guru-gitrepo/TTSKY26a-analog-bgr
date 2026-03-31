module tb;

    reg ena;
    wire [7:0] uo_out;

    tt_um_bgr dut (
        .ui_in(8'b0),
        .uo_out(uo_out),
        .uio(),
        .ena(ena),
        .clk(0),
        .rst_n(1)
    );

    initial begin
        ena = 0;
        #50;
        ena = 1;
        #50;
        $display("uo_out = %b", uo_out);
        $finish;
    end

endmodule
