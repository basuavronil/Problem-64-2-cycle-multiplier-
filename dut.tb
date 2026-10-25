module mult_2cycle (
    input  wire         clk,
    input  wire         rst,       // synchronous, active high
    input  wire         valid_in,
    input  wire [7:0]   a,
    input  wire [7:0]   b,
    output reg          valid_out,
    output reg  [15:0]  p
);

    // Stage 1: register the inputs
    reg [7:0] a_r, b_r;
    reg       v_r;

    always @(posedge clk) begin
        if (rst) begin
            a_r <= 8'd0;
            b_r <= 8'd0;
            v_r <= 1'b0;
        end else begin
            a_r <= a;
            b_r <= b;
            v_r <= valid_in;
        end
    end

    // Stage 2: multiply and register the product
    always @(posedge clk) begin
        if (rst) begin
            p         <= 16'd0;
            valid_out <= 1'b0;
        end else begin
            p         <= a_r * b_r;
            valid_out <= v_r;
        end
    end

endmodule
