//======= shiftRegP.v ===============
module shiftRegP #(parameter N = 4) // # of stages
    (input wire clk,
     input wire rst,
     input wire en,
     input wire d,
     output reg [N-1:0] buffer_s);



    always @(posedge clk, posedge rst) begin
        if (rst) begin
            //buffer_s <= {N{1'b0}};
            buffer_s <= 0;
        end else if (en) begin
            buffer_s <= {d, buffer_s[N-1:1]};
        end
    end

    //assign q = buffer_s[0];

endmodule
