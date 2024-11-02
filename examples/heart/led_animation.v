module led_animation (
    input wire [2:0] address,
    output reg [7:0] db_entry
);
    always @(*) begin
        case(address)
            0: db_entry = 8'b00000000;
            1: db_entry = 8'b00011110;
            2: db_entry = 8'b00111111;
            3: db_entry = 8'b01111110;
            4: db_entry = 8'b11111100;
            5: db_entry = 8'b01111110;
            6: db_entry = 8'b00111111;
            7: db_entry = 8'b00011110;
            default:
               db_entry = 8'b00000000;
        endcase
    end

endmodule
