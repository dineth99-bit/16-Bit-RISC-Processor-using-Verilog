module tb_CPU();
reg clk;
reg en;
reg we_IM;
reg [15:0] codein;
reg [11:0] immd;
wire Za;
wire Zb;
wire Eq;
wire Gt;
wire Lt;

// Instantiation of Module
//clk, en, we_IM, codein, immd, za, zb, eq, gt, lt
CPU C1 (.clk(clk), .en(en), .we_IM(we_IM), .codein(codein), .immd(immd), .za(Za), .zb(Zb), .eq(Eq), .gt(Gt), .lt(Lt));

// Initialization of signals
initial
begin
	clk = 0;
	en = 0;
	we_IM = 0;
	codein = 16'h0000;
	immd = 16'h0000;
end

// Clock set up
always #10 clk = ~clk;

// Stimulus
initial
begin
	// Idle state to Load state transistion
	#10 en = 1;
	
	#5 we_IM = 1;
	codein = 16'h6001;

	#10 we_IM = 0;

	// Provide first instruction set to start the loadA
	#20 we_IM = 1;
	codein = 16'h4000;

	#10 we_IM = 0;
	
	// Provide enough Delay to ensure the data has been update
	// Wait for some time before doing Load B
	#20 we_IM = 1;
	codein = 16'h5001;

	// Provide enough Delay to ensure the data has been updated
	#10 we_IM = 0;

	// Instruction set for ALU operations
	#20 we_IM = 1;
	codein = 16'h0010;

	#10 we_IM = 0;

	// Instruction set for ALU operations
	#20 we_IM = 1;
	codein = 16'h9020;

	#10 we_IM = 0;

	// Instruction set for ALU operations
	#20 we_IM = 1;
	codein = 16'hE022;

	#10 we_IM = 0;

	// Instruction set for ALU operations
	#20 we_IM = 1;
	codein = 16'hF0780;

	#10 we_IM = 0;

	// Instruction set for ALU operations
	#20 we_IM = 1;
	codein = 16'hD067;

	#10 we_IM = 0;

	// Instruction set for ALU operations
	#20 we_IM = 1;
	codein = 16'h6027;

	#10 we_IM = 0;

	// Instruction set for ALU operations
	#20 we_IM = 1;
	codein = 16'h7021;

	#10 we_IM = 0;

	// Instruction set for ALU operations
	#20 we_IM = 1;
	codein = 16'h8022;

	#10 we_IM = 0;


	// Wait for some time before doing Load C
	

	// For JUMP, we need code input followed by a immedeate address
	#10 we_IM = 1;
	codein = 16'h7111;
	#7 we_IM = 0;
	immd = 12'hFEB;
	
	
end
endmodule 
