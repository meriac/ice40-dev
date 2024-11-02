module top(  input CLK,
                output LED,
                output [7:0] LED_BAR
                );
      
   reg [25:0] counter;
   wire [7:0] db_entry;

   assign LED = counter[25] & counter[21];
   assign LED_BAR = ~db_entry;

   initial begin
      counter = 0;
   end

   always @(posedge CLK)
   begin
      counter <= counter + 1;
   end

   led_animation led_animation(.address(counter[16:14]), .db_entry(db_entry));
endmodule
