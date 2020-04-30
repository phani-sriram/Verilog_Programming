`timescale 1ns/1ps

module tb_mux;
    reg data0;
    reg data1;
    reg sel;
    wire out;

    mux2to1 uut
    (
        .data0(data0),
        .data1(data1),
        .sel(sel),
        .out(out)
    );

    initial
    begin
        $dumpfile ("mux_out.vcd"); 
	    $dumpvars(0, tb_mux);

        data0 = 0;
        data1 = 1;
        sel = 1;

        #100

        data0 = 0; data1 = 0; sel = 1; #10;
        data0 = 0; data1 = 1; sel = 0; #10;
        data0 = 0; data1 = 1; sel = 1; #10;
        data0 = 1; data1 = 0; sel = 0; #10;
        data0 = 1; data1 = 0; sel = 1; #10;
        data0 = 1; data1 = 1; sel = 0; #10;
        data0 = 1; data1 = 1; sel = 1; #10;

    end
endmodule