module barrel_shifter_4bit (input [3:0] A, input [1:0] sel, input dir, output [3:0] out);
    wire [3:0] left1, left2;
    wire [3:0] right1, right2;
    wire [3:0] sel_left, sel_right;

    assign left1 = {A[2:0], 1'b0};
    assign left2 = {A[1:0], 2'b00};

    assign sel_left = (sel == 2'b00) ? A :(sel == 2'b01) ? left1 : left2;

    assign right1 = {1'b0, A[3:1]};
    assign right2 = {2'b00, A[3:2]};

    assign sel_right = (sel == 2'b00) ? A :(sel == 2'b01) ? right1 : right2;

    assign out = (dir == 0) ? sel_left : sel_right;
endmodule