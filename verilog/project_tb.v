`include "project.v"

module BinaryCounter4BitWithColors_TB;
  reg clk;
  reg reset;
  reg inc_enable;
  reg dec_enable;
  wire [3:0] count;
  wire [1:0] bulbs; // Color indication output
  wire [4:0] temperature;  // Temperature control
  wire [6:0] elec;
  reg [3:0] max_value;

  // Clock generation
  always begin
    #5 clk = ~clk;
  end

  initial begin
    clk = 0;
    reset = 0;
    inc_enable = 0;
    dec_enable = 0;
    max_value = 4'b1000; // Set your desired max value here (9 in binary)

    
    $display("---------------------------------------------------------------------");
    $display("                           Team - 8");
    $display("---------------------------------------------------------------------");
    $display("Number of bulbs");
    $display("---------------------------------------------------------------------");
    $display("one (0-25)  ----->  00 ");
    $display("two (26-50)  ----->  01 ");
    $display("three (51-99)  ----->  10 ");
    $display("four (100)  ----->  11 ");
    $display("---------------------------------------------------------------------");
    $display("Temperature according to Occupancy of auditorium");
    $display("---------------------------------------------------------------------");
    $display("(0-25)  ----->  11100(28 degrees)");
    $display("(26-50)  -----> 11000(24 degrees)");
    $display("(51-75)  -----> 10100(20 degrees)");
    $display("(76-100) -----> 10000(16 degrees)");
    $display("---------------------------------------------------------------------");

    // Test sequence
    $display("Time  |  Count   |  Color   |  Temperature |   elec bill  |");
    $display("---------------------------------------------------------------------");

    // Increase count to max_value
    reset = 1;
    #10 reset = 0;
    inc_enable = 1;
    repeat (20) begin
      #10;
      $display("%3t   |   %b   |   %b     |      %b       |  %b   |", $time, count, bulbs, temperature , elec);
    end

    inc_enable = 0;

    // Decrease count, but it should not go below 0
    dec_enable = 1;
    repeat (20) begin
      #10;
      $display("%3t   |   %b   |   %b     |      %b       |  %b   ", $time, count, bulbs, temperature, elec);
    end

    dec_enable = 0;

    // Increase count, but it should not go above max_value
    inc_enable = 1;
    repeat (5) begin
      #10;
      $display("%3t   |   %b   |   %b     |      %b       |  %b   ", $time, count, bulbs, temperature, elec);
    end

    inc_enable = 0;

    // Finish simulation
    $finish;
  end

  BinaryCounter4BitWithColors uut (
    .clk(clk),
    .reset(reset),
    .inc_enable(inc_enable),
    .dec_enable(dec_enable),
    .max_value(max_value),
    .count(count),
    .bulbs(bulbs),
    .temperature(temperature),
    .elec(elec)
  );

endmodule
