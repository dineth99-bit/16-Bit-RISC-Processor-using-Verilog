`timescale 1ns / 1ps

module tb_datamem();
reg clk;
reg we_DM;
reg [31:0] dataDM;
reg [11:0] addDM;
wire [31:0] outDM;

// Instantiation of the design
datamem d1 (.clk(clk), .we_DM(we_DM), .dataDM(dataDM), .addDM(addDM), .outDM(outDM));

// Initialization of signals
initial
begin
 clk <= 0;
 we_DM <= 0;
 dataDM <= 32'h00000000;
 addDM <= 12'h000;
end

// Clock setup
always #5 clk = ~clk;

// Address setup 
//always #60 addDM = addDM + 12'h001;

// Stimulus
initial 
begin
 #5 we_DM <= 1;
 dataDM <= 32'h1dfe;
 addDM=12'h001;
    #30 we_DM <= 0;

    #5 we_DM <= 1;
 #5 dataDM <= 32'h1efe;
 
 addDM=12'h002;
 #30 we_DM <= 0;
 #5 addDM=12'h001;
 #30 we_DM <= 1;
 #5 dataDM <= 32'h1001;
 #30 we_DM <= 0;
end
endmodule