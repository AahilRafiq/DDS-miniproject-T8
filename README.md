# DDS-miniproject-T8 - Automatic Visitor Counter and Power control

## Team Members 
<details>
  
  * 221CS101, Aahil Rafiq, <aahilrafiq.221cs101@nitk.edu.in>, 79756 57621
  * 221CS119, Ch Muni Kiran, <munikiranch.221cs119@nitk.edu.in>, 9121716854
  * 221CS121, Shainu Suhas, <suhas.221cs121@nitk.edu.in>, 79897 75284
</details>

## Abstract :

<details>

  **Automated Visitor Counting:** Utilizes sensors to automatically count incoming visitors and display the count using **7 segment displays**

  **Bi-Directional Tracking:** Accurately records both entries and exits, adjusting the count accordingly.

  **Laser-Based Detection:** Utilizes laser technology to precisely detect incoming and outgoing visitors.

  **Customizable Limits:** Allows users to set maximum occupancy limits for safety and compliance.

  **Automatic Restrict System:** Features an automatic Restriction system that stops entry when the room reaches its defined occupancy limit, enhancing security and efficiency.

  **Energy Efficiency and Control:** Incorporates power management by turning off lights in unoccupied areas and generates a live Electricity Bill
</details>


## Working
<details>
  
  ### FLowchart :
  ![image](https://github.com/AahilRafiq/DDS-miniproject-T8/assets/128609469/30cff0ae-33ea-42be-ba07-bf27485155bf)

  ### Functional Table
  
  * here people try to enter from time 0 to 210
  * then exit from 210 to 420
  
  | Time | Count | Color | Temperature | elec bill |
  |------|-------|-------|-------------|-----------|
  | 20   | 0001  | 00    | 11100       | 0000000   |
  | 30   | 0010  | 00    | 11100       | 0000000   |
  | 40   | 0011  | 01    | 11000       | 0000000   |
  | 50   | 0100  | 01    | 11000       | 0000001   |
  | 60   | 0101  | 10    | 10100       | 0000010   |
  | 70   | 0110  | 10    | 10100       | 0000100   |
  | 80   | 0111  | 10    | 10000       | 0000110   |
  | 90   | 1000  | 11    | 10000       | 0001000   |
  | 100  | 1000  | 11    | 10000       | 0001011   |
  | 110  | 1000  | 11    | 10000       | 0001110   |
  | 120  | 1000  | 11    | 10000       | 0010001   |
  | 130  | 1000  | 11    | 10000       | 0010100   |
  | 140  | 1000  | 11    | 10000       | 0010111   |
  | 150  | 1000  | 11    | 10000       | 0011010   |
  | 160  | 1000  | 11    | 10000       | 0011101   |
  | 170  | 1000  | 11    | 10000       | 0100000   |
  | 180  | 1000  | 11    | 10000       | 0100011   |
  | 190  | 1000  | 11    | 10000       | 0100110   |
  | 200  | 1000  | 11    | 10000       | 0101001   |
  | 210  | 1000  | 11    | 10000       | 0101100   |
  | 220  | 0111  | 10    | 10000       | 0101111   |
  | 230  | 0110  | 10    | 10100       | 0110001   |
  | 240  | 0101  | 10    | 10100       | 0110011   |
  | 250  | 0100  | 01    | 11000       | 0110101   |
  | 260  | 0011  | 01    | 11000       | 0110110   |
  | 270  | 0010  | 00    | 11100       | 0110111   |
  | 280  | 0001  | 00    | 11100       | 0110111   |
  | 290  | 0000  | 00    | 11100       | 0110111   |
  | 300  | 0000  | 00    | 11100       | 0110111   |
  | 310  | 0000  | 00    | 11100       | 0110111   |
  | 320  | 0000  | 00    | 11100       | 0110111   |
  | 330  | 0000  | 00    | 11100       | 0110111   |
  | 340  | 0000  | 00    | 11100       | 0110111   |
  | 350  | 0000  | 00    | 11100       | 0110111   |
  | 360  | 0000  | 00    | 11100       | 0110111   |
  | 370  | 0000  | 00    | 11100       | 0110111   |
  | 380  | 0000  | 00    | 11100       | 0110111   |
  | 390  | 0000  | 00    | 11100       | 0110111   |
  | 400  | 0000  | 00    | 11100       | 0110111   |
  | 410  | 0000  | 00    | 11100       | 0110111   |
  | 420  | 0001  | 00    | 11100       | 0110111   |
  | 430  | 0010  | 00    | 11100       | 0110111   |
  | 440  | 0011  | 01    | 11000       | 0110111   |
  | 450  | 0100  | 01    | 11000       | 0111000   |
  | 460  | 0101  | 10    | 10100       | 0111001   |
</details>

## Logisim Circuit Diagram :

<details>

  ![image](https://github.com/AahilRafiq/DDS-miniproject-T8/assets/128609469/e9c70417-18e0-4774-b6be-291f509159cc)
  ![image](https://github.com/AahilRafiq/DDS-miniproject-T8/assets/128609469/c96b9849-3519-4428-8f2e-044cedaa7810)

</details>


##  Verilog :
<details>
  
  ### Module :

```verilog
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
```

### TestBenche :
```verilog
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
```

### Output : 
  
  ![image](https://github.com/AahilRafiq/DDS-miniproject-T8/assets/128609469/45a53663-65d2-4c12-ad7a-3ea4e81f3aa4)
</details>


