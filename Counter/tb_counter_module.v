`timescale 1ns/1ps

module counter_tb;
    reg clk;
    reg enable;
    reg reset;
    wire [3:0] out;

    Counter uut
    (
        .clk(clk),
        .enable(enable),
        .reset(reset),
        .out(out)
    );

    initial
    begin
        $dumpfile ("mux_out.vcd"); 
	    $dumpvars(0, counter_tb);

        clk = 0;
        enable = 0;
        reset = 1;

        #30
        reset = 0;
        enable = 1;
        
    end
    always
    begin
        #3 clk = ~clk;
    end
endmodule