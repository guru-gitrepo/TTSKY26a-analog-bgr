# Sky130 Bandgap Reference (Tiny Tapeout Compatible)

## Overview

This project implements a **bandgap reference (BGR)** in the Sky130 process, designed to generate a stable voltage of approximately **0.9V** across process, voltage, and temperature variations.

The design has been fully verified through:

* Pre-layout simulation
* Post-layout (RCX) simulation
* LVS and DRC checks

## Key Specifications

* Technology: Sky130 (1.8V)
* Output Voltage: ~0.9V
* Area: 63.7 µm × 47.6 µm
* Architecture: PMOS-based LDO-compatible BGR core
* Layout: Fully custom, matched devices

## Interface (Tiny Tapeout)

| Pin     | Type           | Description         |
| ------- | -------------- | ------------------- |
| `ua[0]` | Analog Output  | VREF (~0.9V)        |
| `ui[0]` | Digital Input  | Enable (EN)         |
| `uo[0]` | Digital Output | Status (BGR active) |
| `vccd1` | Power          | 1.8V supply         |
| `vssd1` | Ground         | Ground              |

## Notes on Analog Output

* VREF is exposed as an **analog output**
* The output is **not buffered**
* External loading may affect voltage accuracy
* Measurement should be done using **high-impedance instrumentation**
* Tiny Tapeout IO pads are digital-oriented; analog performance is not guaranteed

## Design Flow

1. Schematic design (xschem)
2. Layout implementation (magic)
3. LVS verification (netgen)
4. Parasitic extraction (RCX)
5. Post-layout simulation (ngspice)
6. GDS export for fabrication

## Repository Structure

* `gds/` → Final layout (GDS)
* `mag/` → Magic layout files
* `spice/` → Post-layout extracted netlist
* `src/` → Tiny Tapeout wrapper (Verilog)
* `docs/` → Design documentation

## Status

* Layout complete
* Post-layout verified
* Tiny Tapeout integration ready

## Author

Guruprasad

