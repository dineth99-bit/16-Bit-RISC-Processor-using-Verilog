module instmem(clk, we_IM, dataIM, addIM, outIM);
input clk;
input we_IM;
input [15:0] dataIM; //CODE INPUT
input [11:0] addIM;
output [15:0] outIM;

reg [15:0] outIM;

// Memory is an array stored at particular address

reg [15:0] mem [0 : 15];

always@(posedge clk)
begin
	if (we_IM == 1) begin
	mem[addIM] = dataIM;
	end
	
	else if (we_IM == 0) begin
	outIM = mem[addIM];
	end
end
endmodule
