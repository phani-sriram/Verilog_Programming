module d_flip_flop(d, clk, out);
    input d;
    input clk;
    output out;
    reg out;

always @(posedge clk)
begin
    out <= d;
end
endmodule
