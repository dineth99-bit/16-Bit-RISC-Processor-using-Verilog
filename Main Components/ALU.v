module ALU( a, b, opcode, mode, outALU, za, zb, eq, gt, lt);
input [15:0] a;
input [15:0] b;
input [2:0] opcode;
input mode;
output [31:0] outALU;
output za, zb, eq, gt, lt;

reg [31:0] outALU;
reg za, zb, eq, gt, lt;

wire [31:0] outau; //output of arihmetic
wire [31:0] outlu;  //output of logic unit
wire tza, tzb, teq, tgt, tlt;

// Instantiation of the modules

arith a1 (.a(a), .b(b), .opcode(opcode), .outau(outau));
logic l1 (.a(a), .b(b), .opcode(opcode), .outlu(outlu), .za(tza), .zb(tzb), .eq(teq), .gt(tgt), .lt(tlt));

// At every change of a, b, mode and opcode, we need to select the output.

always@(a,b,mode,opcode)
begin
	if(mode == 0) begin
	outALU = outau;
	end
	else if (mode == 1) begin
	outALU = outlu;
	end
	else begin
	outALU = 32'h00000000;
	end

	za = tza;
	zb = tzb;
	eq = teq;
	gt = tgt;
	lt = tlt;
end

endmodule
