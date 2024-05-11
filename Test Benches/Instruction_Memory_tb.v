module tb_instmem();
reg clk;
reg we_IM;
reg [15:0] dataIM;
reg [11:0] addIM;
wire [15:0] outIM;

// Instantiation of the design
instmem d1 (.clk(clk), .we_IM(we_IM), .dataIM(dataIM), .addIM(addIM), .outIM(outIM));


// Initialization of signals
initial
begin
	clk <= 0;
	we_IM <= 0;
	dataIM <= 16'h0000;
	addIM <= 12'h000;
end

// Clock setup
always #5 clk = ~clk;

// Address setup 
always #60 addIM = addIM + 12'h001;

// Stimulus
initial 
begin
	#5 we_IM <= 1;
	#5 dataIM <= 16'h0234;
	#30 we_IM <= 0;

	#60 we_IM <= 1;
	#60 dataIM <= 16'h0381;
	#90 we_IM <= 0;
end
endmodule
