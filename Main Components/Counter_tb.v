module tb_counter4b();
reg clk,rst,en;
wire [3:0] outtb;

// Initialise the input signals
initial
begin
	clk<=1'b0;
	rst<=1'b0;
	en<=1'b0;
end

// Instantiation of the Counter4b module

counter4b c1(.clk(clk), .rst(rst), .en(en), .out(outtb));

// Clock signal every 10ns

always #10 clk = ~clk;

// Stimulus for checking the working of counter

initial
begin
	#5 rst <= 1;
	#10 en <= 1;
	
	#10 rst <= 0;
	#10 en <= 1;

	#100 en <= 0;

	#10 rst <= 1;
end
endmodule