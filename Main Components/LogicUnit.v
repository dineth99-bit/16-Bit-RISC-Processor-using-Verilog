module logic(a,b,opcode,outlu,za,zb,eq,gt,lt);
input [15:0] a;
input [15:0] b;
input [2:0] opcode;
output [31:0] outlu;
output za,zb,eq,gt,lt;

reg [31:0] outlu;
reg za,zb,eq,gt,lt;

always@(a,b,opcode)
begin
	case(opcode)
	3'b000: outlu = {16'h0000, (a & b)};
	3'b001: outlu = {16'h0000, (a | b)};
	3'b010: outlu = {16'h0000, (~(a & b))};
	3'b011: outlu = {16'h0000, (~(a | b))};
	3'b100: outlu = {16'h0000, (~ a)};
	3'b101: outlu = {16'h0000, (~ b)};
	3'b110: outlu = {16'h0000, (a ^ b)};
	3'b111: outlu = {16'h0000, (~(a ^ b))};
	default outlu = 32'h00000000;
	endcase
end

always@(a,b)
begin
	if( a == b) begin
	eq = 1;
	end
	else begin
	eq = 0;
	end

	if ( a > b) begin
	gt = 1;
	end
	else begin
	gt = 0;
	end

	if ( a < b) begin
	lt = 1;
	end
	else begin
	lt = 0;
	end
	
	if( a == 16'h0000) begin
	za = 1;
	end
	else begin
	za = 0;
	end
	
	if (b == 16'h0000) begin
	zb = 1;
	end
	else begin
	zb = 0;
	end
end
endmodule