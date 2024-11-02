
module top(  input CLK,
             output LED,
             output [7:0] LED_BAR
          );
      
   reg [25:0] counter;

   assign LED = counter[25] & counter[21];
   assign LED_BAR = ~counter[25:18];

   initial begin
      counter = 0;
   end

   always @(posedge CLK)
   begin
      counter <= counter + 1;
   end


endmodule
