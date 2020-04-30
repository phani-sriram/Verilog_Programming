`timescale 1ns/1ps

module dfftb;
    reg d;
    reg clk;
    wire out;

    d_flip_flop uut
    (
        .d(d),
        .clk(clk),
        .out(out)
    );

    initial 
    begin
        $dumpfile ("mux_out.vcd"); 
	    $dumpvars(0, dfftb);

        d = 0;
        clk = 0;

    end
    always
    begin
        #3 clk = ~clk;
    end
    always
    begin
        #5 d=~d;
    end
endmodule
