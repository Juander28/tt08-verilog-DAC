`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: PONTIFICIA UNIVERSIDAD JAVERIANA
// Engineer: JUAN DIEGO SANCHEZ ROJAS
// 
// Create Date:    22:52:12 02/28/2023 
// Design Name: 
// Module Name:    FSM_LAT
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////


module tt_um_CONTROL(
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);







					 wire in_vref, in_data, in_conver, in_comp, clock,  rst, stop, temp;
					 wire [2:0] VR, VM, VRC;
					 
			 wire stp_vref, stp_data, stp_conver, stp_comp;
			 wire [3:0]vref;
			 wire [7:0]data;
			 wire [7:0]conver;
			 wire [5:0]comp;
			 
			 assign {in_vref, in_data, in_conver, in_comp, clock,  rst, stop, temp}=ui_in;
			 
			 assign uo_out={VR[1:0], VM, VRC};
			 assign uio_oe=8'hff;
			 assign uio_out={VR[2],7'h00};
			 
			 shiftRegP #(.N(5)) VREF(
						 .clk(clock),
						 .rst(rst),
						 .en(!stp_vref),
						 .d(in_vref),
						 .buffer_s({vref,stp_vref}));
						 
			 shiftRegP #(.N(9)) DATA(
						 .clk(clock),
						 .rst(rst),
						 .en(!stp_data),
						 .d(in_data),
						 .buffer_s({data,stp_data}));
						 
			 shiftRegP #(.N(9)) CONVER(
						 .clk(clock),
						 .rst(rst),
						 .en(!stp_conver),
						 .d(in_conver),
						 .buffer_s({conver,stp_conver}));
						 
			 shiftRegP #(.N(7)) COMP(
						 .clk(clock),
						 .rst(rst),
						 .en(!stp_comp),
						 .d(in_comp),
						 .buffer_s({comp,stp_comp}));	 
						 
			d_ff low [2:0](
								.clk(clock),
								.reset(rst),
								.en(stop),
								.d({temp,temp, temp}),
								.q(VR));
			d_ff med [2:0](
								.clk(clock),
								.reset(rst),
								.en(stop),
								.d({temp,temp, temp}),
								.q(VM));
			d_ff high [2:0](
								.clk(clock),
								.reset(rst),
								.en(stop),
								.d({temp,temp, temp}),
								.q(VRC));

endmodule


