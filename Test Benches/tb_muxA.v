module tb_muxA();

  // Define testbench clock
  reg clk = 0;
  always begin
    #5 clk = ~clk; // Create a 10ns clock cycle
  end

  // Define signals for the muxA module
  reg [31:0] in1;
  reg [15:0] in2;
  reg sel;
  wire [31:0] outA;

  // Instantiate the muxA module
  muxA muxA_inst (
    .clk(clk),
    .in1(in1),
    .in2(in2),
    .sel(sel),
    .outA(outA)
  );

  // Initial values
  initial begin

   // Test Case 1: sel = 1
    sel = 1;
    in1 = 32'hA5A5A5A5;
    in2 = 16'h1234;
    #10; // Wait for a few clock cycles

    // Test Case 2: sel = 0
    sel = 0;
    in1 = 32'hB6B6B6B6;
    in2 = 16'h5678;
    #10; // Wait for a few clock cycles

    // Test Case 3: sel = 1
    sel = 1;
    in1 = 32'hC7C7C7C7;
    in2 = 16'hABCD;
    #10; // Wait for a few clock cycles

    $finish;
  end

  // Monitor and display output results
  always @(posedge clk) begin
    $display("Time %0t: sel = %b, in1 = %h, in2 = %h, outA = %h", $time, sel, in1, in2, outA);
  end

endmodule

