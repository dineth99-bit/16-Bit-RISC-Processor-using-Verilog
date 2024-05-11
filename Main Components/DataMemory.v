module datamem(clk, we_DM, dataDM, addDM, outDM);
input clk;
input we_DM; // read or write operation
input [31:0] dataDM; // data to be written
input [11:0] addDM; // daata adrees to be read or written
output [31:0] outDM; // output

reg [31:0] outDM;

// Memory is an array stored at particular address

reg [31:0] mem [0 : 31];

always@(posedge clk)
begin
	if (we_DM == 1) begin
	mem[addDM] = dataDM;
	end
	
	else if (we_DM == 0) begin
	outDM = mem[addDM];
	end
end
endmodule
