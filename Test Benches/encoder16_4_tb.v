module tb_encode();
wire [3:0] out;
reg [15:0] in;
reg en;

// Instantiation of the design

encode164 e1(.out(out),.in(in),.en(en));

// Initialise the signals
initial
begin
	in = 16'b0000000000000000;
	en = 0;
end

initial
begin
	#10 en = 1;
	#10 in = 16'b0000000000000010;
	repeat (14)
	begin
		#10 in = in << 1;
	end
end
endmodule
		
