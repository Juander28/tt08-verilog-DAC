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
					 input wire in_vref, in_data, in_conver, in_comp, clk,  rst, stop, temp,
					 output [2:0] VR, VM, VRC);
					 
			 wire stp_vref, stp_data, stp_conver, stp_comp;
			 wire [3:0]vref;
			 wire [7:0]data;
			 wire [7:0]conver;
			 wire [5:0]comp;
			 shiftRegP #(.N(5)) VREF(
						 .clk(clk),
						 .rst(rst),
						 .en(!stp_vref),
						 .d(in_vref),
						 .buffer_s({vref,stp_vref}));
						 
			 shiftRegP #(.N(9)) DATA(
						 .clk(clk),
						 .rst(rst),
						 .en(!stp_data),
						 .d(in_data),
						 .buffer_s({data,stp_data}));
						 
			 shiftRegP #(.N(9)) CONVER(
						 .clk(clk),
						 .rst(rst),
						 .en(!stp_conver),
						 .d(in_conver),
						 .buffer_s({conver,stp_conver}));
						 
			 shiftRegP #(.N(7)) COMP(
						 .clk(clk),
						 .rst(rst),
						 .en(!stp_comp),
						 .d(in_comp),
						 .buffer_s({comp,stp_comp}));	 
						 
			d_ff low [2:0](
								.clk(clk),
								.reset(rst),
								.en(stop),
								.d({temp,temp, temp}),
								.q(VR));
			d_ff med [2:0](
								.clk(clk),
								.reset(rst),
								.en(stop),
								.d({temp,temp, temp}),
								.q(VM));
			d_ff high [2:0](
								.clk(clk),
								.reset(rst),
								.en(stop),
								.d({temp,temp, temp}),
								.q(VRC));

endmodule


