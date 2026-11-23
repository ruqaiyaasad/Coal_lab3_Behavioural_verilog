module mux_2x1 (
    input  A,
    input  B,
    input  Select,
    output reg Y
);

    always @(*) begin
        case (Select)
            1'b0: Y = A & B;
            1'b1: Y = A | B;
            default: Y = 1'b0;
        endcase
    end

endmodule


module tb_mux_2x1;

    reg  A, B, Select;
    wire Y;

    mux_2x1 uut (
        .A(A),
        .B(B),
        .Select(Select),
        .Y(Y)
    );

    initial begin
        A = 0; B = 0; Select = 0;

        #50 A = 0; B = 0; Select = 0;   // 0 & 0
        #50 A = 0; B = 1; Select = 0;   // 0 & 1
        #50 A = 1; B = 0; Select = 0;   // 1 & 0
        #50 A = 1; B = 1; Select = 0;   // 1 & 1
        #50 A = 0; B = 0; Select = 1;   // 0 | 0
        #50 A = 0; B = 1; Select = 1;   // 0 | 1
        #50 A = 1; B = 0; Select = 1;   // 1 | 0
        #50 A = 1; B = 1; Select = 1;   // 1 | 1
    end

endmodule
