//////////////////////////////////////////////////////////////////////////////////
// Company: PONTIFICIA UNIVERSIDAD JAVERIANA
// Engineer: JUAN DIEGO SANCHEZ ROJAS
// 
// Create Date:    22:52:12 02/28/2023 
// Design Name: 
// Module Name:    D_FF 
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
module d_ff
	(
		input wire clk, reset,
		input wire en,
		input wire d,
		output reg q
	);

	always@(posedge clk, posedge reset) // always se ejecuta con un cambio positovo de clk o reset
		if (reset) // reset tiene prioridad por lo que se pregunta primero
			q<=1'b0; // reset
		else if (en) // si en está activo
			q<=d; // funcionamiento normal ffd

endmodule