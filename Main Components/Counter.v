module counter4b( clk,rst,en,out);
input clk,rst,en;
output [3:0] out;
wire clk, rst,en;
reg [3:0] out;

always@(posedge clk)
begin
	if(rst == 1'b1)
	begin
		out <= 4'b0000;
	end
	else if (en == 1'b1)
	begin
		out <= out + 4'b0001;
	end
end
endmodule