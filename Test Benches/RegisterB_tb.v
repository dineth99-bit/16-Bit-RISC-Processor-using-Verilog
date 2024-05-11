module tb_regB ();
reg clk;
reg loadB;
reg [15:0] dataBin;
wire [15:0] dataBout;

// Instantiation of the Register B

regB r1 (.clk(clk), .loadB(loadB), .dataBin(dataBin), .dataBout(dataBout));

// Initialization
initial
begin
	clk <= 1'b0;
	loadB <= 0;
	dataBin <= 16'h0000;
end

// Clock signal setup

always #5 clk = ~clk;

// Stimilus
initial
begin
	#20 loadB = 1;
	dataBin = 16'h00fe;
	
	#20 loadB = 0;
	dataBin = 16'h0fe6;

	#20 loadB = 1;
end
endmodule