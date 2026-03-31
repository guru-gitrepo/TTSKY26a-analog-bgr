/* Copyright (c) 2024 Guruprasad
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_bgr (
    input  wire       VGND,
    input  wire       VDPWR,    // 1.8V power supply
//  input  wire       VAPWR,    // 3.3V (unused)
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: input path
    output wire [7:0] uio_out,  // IOs: output path
    output wire [7:0] uio_oe,   // IOs: output enable (1=output)
    inout  wire [7:0] ua,       // Analog pins (ua[5:0] usable)
    input  wire       ena,      // Enable (usually high)
    input  wire       clk,      // Clock (unused)
    input  wire       rst_n     // Reset (unused)
);

    // Digital status output
    assign uo_out[0] = ena;
    assign uo_out[7:1] = 7'b0;

    // Unused bidirectional IOs
    assign uio_out = 8'b0;
    assign uio_oe  = 8'b0;

    // IMPORTANT:
    // ua[0] carries analog VREF from layout
    // Do NOT drive it here

endmodule
