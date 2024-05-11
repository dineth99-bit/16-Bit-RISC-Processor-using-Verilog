module tb_ALU();
reg [15:0] a;
reg [15:0] b;
reg [2:0] opcode;
reg mode;
wire [31:0] outALU;
wire za, zb, eq, gt, lt;


// Instantiation of ALU

ALU d1 (.a(a), .b(b), .opcode(opcode), .mode(mode), .outALU(outALU), .za(za), .zb(zb), .eq(eq), .gt(gt), .lt(lt));

// Initialization
initial
begin
	a <= 16'h0000;
	b <= 16'h0000;
	mode <= 0;
	opcode <= 000;
	
end

initial
begin

	#10 mode = 0;	//	Mode 0 test the Arithmetic Unit
	#5 a = 16'h0001;
	#5 b = 16'h0010;

    # 5 opcode = 3'b000;
	# 5 opcode = 3'b001;
	# 5 opcode = 3'b010;
	# 5 opcode = 3'b011;
	# 5 opcode = 3'b100;
	# 5 opcode = 3'b101;
	# 5 opcode = 3'b110;
	# 5 opcode = 3'b111;
	

	#5 a = 16'h0100;
	#5 b = 16'h0110;
	# 5 opcode = 3'b000;
	# 5 opcode = 3'b001;
	# 5 opcode = 3'b010;
	# 5 opcode = 3'b011;
	# 5 opcode = 3'b100;
	# 5 opcode = 3'b101;
	# 5 opcode = 3'b110;
	# 5 opcode = 3'b111;

	#10 mode = 1;	// Mode 1 test for logic unit
	a = 16'h0003;
	b = 16'h000F;

	// Various opcodes to see the output
	# 5 opcode = 3'b001;
	# 5 opcode = 3'b010;
	# 5 opcode = 3'b011;
	# 5 opcode = 3'b100;
	# 5 opcode = 3'b101;
	# 5 opcode = 3'b110;
	# 5 opcode = 3'b111;
	
	// When A=B test all the conditions
	#10 a = 16'h00E9;
	b = 16'h00E9;
	# 5 opcode = 3'b001;
	# 5 opcode = 3'b010;
	# 5 opcode = 3'b011;
	# 5 opcode = 3'b100;
	# 5 opcode = 3'b101;
	# 5 opcode = 3'b110;
	# 5 opcode = 3'b111;

	// Test ZA
	#10 a <= 16'h0000;

	// Test ZB
	#10 b <= 16'h0000;
end
endmodule
