module BinaryCounter4BitWithColors (
  input wire clk,          // Clock input
  input wire reset,        // Reset input
  input wire inc_enable,   // Increment enable input
  input wire dec_enable,   // Decrement enable input
  input wire [3:0] max_value, // Maximum value for the counter
  output reg [3:0] count,  // 4-bit binary counter output
  output reg [1:0] bulbs,  // 2-bit output for bulbs indication (00: green, 01: blue, 10: yellow, 11: red)
  output reg [4:0] temperature,  // 5-bit output for controlling temperature
  output reg [6:0] elec // electricity bill
);

  reg [7:0] percentage;  // 8-bit register to hold the percentage of the count

  always @* begin
    // Calculate the percentage of the count based on the current count value
    percentage = (count * 100) / max_value;
  end

  always @(posedge clk or posedge reset) begin
    elec = elec + bulbs;

    if (reset) begin
      count <= 4'b0000;  // Reset the counter to 0 when the reset signal is asserted
      elec = 6'b000000;
    end else begin
      if (inc_enable && (count < max_value)) begin
        count <= count + 4'b0001; // Increment the counter if enabled and below the maximum value
      end
      if (dec_enable && (count > 4'b0000)) begin
        count <= count - 4'b0001; // Decrement the counter if enabled and above 0
      end
    end
  end

  always @* begin
    if (percentage <= 25) begin
      bulbs = 2'b00;  // Green (0-25%)
      temperature = 5'b11100;  // Set the temperature to 28 degrees
    end else if (percentage <= 50) begin
      bulbs = 2'b01;  // Blue (26-50%)
      temperature = 5'b11000;  // Set the temperature to 24 degrees
    end else if (percentage <= 75) begin
      bulbs = 2'b10;  // Yellow (51-75%)
      temperature = 5'b10100;  // Set the temperature to 20 degrees
    end else if (percentage >= 76 && percentage < 100) begin
      bulbs = 2'b10;  // Yellow (76-99%)
      temperature = 5'b10000; 
    end else if(percentage == 100) begin
      bulbs = 2'b11;  // Red (100%)
      temperature = 5'b10000;  // Set the temperature to 16 degrees
    end
  end

endmodule
