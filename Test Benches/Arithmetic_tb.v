module tb_arith();
reg [15:0] a;
reg [15:0] b;
reg [2:0] opcode;
wire [31:0] outau;

// Instantiation of the design

arith a1 (.a(a), .b(b), .opcode(opcode), .outau(outau));

// Initialization
initial
begin
	a = 16'h0000;
	b = 16'h0000;
	opcode = 3'b000;
end

// Stimulus
initial
begin
	#5 a = 16'h0001;
	#5 b = 16'h0010;

	# 5 opcode = 3'b001;
	# 5 opcode = 3'b010;
	# 5 opcode = 3'b011;
	# 5 opcode = 3'b100;
	# 5 opcode = 3'b101;
	# 5 opcode = 3'b110;
	# 5 opcode = 3'b111;

	#5 a = 16'h0100;
	#5 b = 16'h0110;
	# 5 opcode = 3'b001;
	# 5 opcode = 3'b010;
	# 5 opcode = 3'b011;
	# 5 opcode = 3'b100;
	# 5 opcode = 3'b101;
	# 5 opcode = 3'b110;
	# 5 opcode = 3'b111;
end
endmodule
