module comparator_2bit (
    input  [1:0] A,
    input  [1:0] B,
    output reg   A_eq_B,
    output reg   A_gt_B,
    output reg   A_lt_B
);

    always @(*) begin
        A_eq_B = 1'b0;
        A_gt_B = 1'b0;
        A_lt_B = 1'b0;

        if (A == B)
            A_eq_B = 1'b1;
        else if (A > B)
            A_gt_B = 1'b1;
        else
            A_lt_B = 1'b1;
    end

endmodule


module tb_comparator_2bit;

    reg  [1:0] A, B;
    wire       A_eq_B, A_gt_B, A_lt_B;

    comparator_2bit uut (
        .A(A),
        .B(B),
        .A_eq_B(A_eq_B),
        .A_gt_B(A_gt_B),
        .A_lt_B(A_lt_B)
    );

    initial begin
        A = 0; B = 0;

        #50 A = 2'b00; B = 2'b00;   // equal
        #50 A = 2'b01; B = 2'b01;   // equal
        #50 A = 2'b10; B = 2'b10;   // equal
        #50 A = 2'b11; B = 2'b11;   // equal
        #50 A = 2'b01; B = 2'b00;   // A > B
        #50 A = 2'b10; B = 2'b01;   // A > B
        #50 A = 2'b11; B = 2'b10;   // A > B
        #50 A = 2'b00; B = 2'b01;   // A < B
        #50 A = 2'b01; B = 2'b10;   // A < B
        #50 A = 2'b10; B = 2'b11;   // A < B
    end

endmodule
