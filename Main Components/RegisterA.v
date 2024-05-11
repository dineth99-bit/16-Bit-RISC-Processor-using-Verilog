module regA (clk, loadA, dataAin, dataAout);
  input clk;
  input loadA;
  input [15:0] dataAin;
  output [15:0] dataAout;

  reg [15:0] dataAout;
  reg [15:0] tempA;

  always @(posedge clk)
  begin
    if (loadA == 1)
    begin
      dataAout <= dataAin;
      tempA <= dataAin;
    end
    else if (loadA == 0)
    begin
      dataAout <= tempA;
    end
  end
endmodule


