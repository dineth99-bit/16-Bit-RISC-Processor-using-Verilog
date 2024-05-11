module tb_controller ();
reg clk;
reg en;
reg [3:0] opcode;
wire loadA;
wire loadB;
wire loadC;
wire loadIR;
wire loadPC;
wire incPC;
wire mode;
wire we_DM;
wire selA;
wire selB;

// Design instantiation
controller c1 (.clk(clk), .en(en), .opcode(opcode), .loadA(loadA), .loadB(loadB), .loadC(loadC), .loadIR(loadIR), .loadPC(loadPC), .incPC(incPC), .mode(mode), .we_DM(we_DM), .selA(selA), .selB(selB));

// initialization
initial
begin
	clk = 0;
	en = 0;
	//opcode = 4'b0000;
end
// Clock setup
always #5 clk = ~clk;

// Stimulus
initial
begin
	#10 en = 1;
	opcode = 4'b1001;
	
	#20 opcode = 4'b0001;

	#20 opcode = 4'b0010;
end
endmodule 

//module tb_controller;

//  // Inputs
//  reg clk;
//  reg en;
//  reg [3:0] opcode;

//  // Outputs
//  wire loadA;
//  wire loadB;
//  wire loadC;
//  wire loadIR;
//  wire loadPC;
//  wire incPC;
//  wire mode;
//  wire we_DM;
//  wire selA;
//  wire selB;

//  // Instantiate the controller module
//  controller uut (
//    .clk(clk),
//    .en(en),
//    .opcode(opcode),
//    .loadA(loadA),
//    .loadB(loadB),
//    .loadC(loadC),
//    .loadIR(loadIR),
//    .loadPC(loadPC),
//    .incPC(incPC),
//    .mode(mode),
//    .we_DM(we_DM),
//    .selA(selA),
//    .selB(selB)
//  );

//  // Clock generation
//  always begin
//    clk = ~clk;
//    #5; // Adjust delay as needed
//  end

//  // Testbench stimulus
//  initial begin
//    clk = 0;
//    en = 0;
//    opcode = 4'b0000; // Default opcode

//    // Test Case 1: Reset State
//    en = 0;
//    opcode = 4'b0000;
//    #10;
//    en = 1;
//    #10;
//    en = 0;
//    #10;

//    // Test Case 2: Load IR and PC
//    opcode = 4'b0100; // Load IR and PC
//    en = 1;
//    #10;
//    en = 0;
//    #10;

//    // Test Case 3: ALU Operation in Mode 0
//    opcode = 4'b0000; // ALU Operation in Mode 0
//    en = 1;
//    #10;
//    en = 0;
//    #10;

//    // Test Case 4: Load A Operation
//    opcode = 4'b0101; // Load A
//    en = 1;
//    #10;
//    en = 0;
//    #10;

//    // Test Case 5: Load B Operation
//    opcode = 4'b0110; // Load B
//    en = 1;
//    #10;
//    en = 0;
//    #10;

//    // Test Case 6: Load C Operation
//    opcode = 4'b0111; // Load C
//    en = 1;
//    #10;
//    en = 0;
//    #10;

//    // Test Case 7: JMP Translation
//    opcode = 4'b1000; // JMP Translation
//    en = 1;
//    #10;
//    en = 0;
//    #10;

//    // Test Case 8: ALU Operation in Mode 1
//    opcode = 4'b1001; // ALU Operation in Mode 1
//    en = 1;
//    #10;
//    en = 0;
//    #10;

//    // Add more test cases as needed

//    $finish;
//  end

//endmodule


//module tb_controller();

//  // Inputs
//  reg clk;
//  reg en;
//  reg [3:0] opcode;

//  // Outputs
//  wire loadA;
//  wire loadB;
//  wire loadC;
//  wire loadIR;
//  wire loadPC;
//  wire incPC;
//  wire mode;
//  wire we_DM;
//  wire selA;
//  wire selB;

//  // Instantiate the controller module
//  controller dut (
//    .clk(clk),
//    .en(en),
//    .opcode(opcode),
//    .loadA(loadA),
//    .loadB(loadB),
//    .loadC(loadC),
//    .loadIR(loadIR),
//    .loadPC(loadPC),
//    .incPC(incPC),
//    .mode(mode),
//    .we_DM(we_DM),
//    .selA(selA),
//    .selB(selB)
//  );

//  // Clock generation
//  always begin
//    #5 clk = ~clk;
//  end

//  // Stimulus
//  initial begin
//    // Initialize inputs
//    clk = 0;
//    en = 0;
//    opcode = 4'b0000;

//    // Apply reset
//    en = 0; // Ensure en is low during reset
//    #10 en = 1; // Release from reset

//    // Test case 1: Load instruction
//    opcode = 4'b0100;
//    #10; // Observe the output signals

//    // Test case 2: Execute instruction with a specific opcode
//    opcode = 4'b1000;
//    #10; // Observe the output signals

//    // You can continue adding more test cases here

//    // Finish simulation
//    $finish;
//  end

//endmodule


































