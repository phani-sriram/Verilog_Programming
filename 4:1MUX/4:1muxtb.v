`timescale 1ns/1ps

module tb_mux4;
    reg data0;
    reg data1;
    reg data2;
    reg data3;
    reg sel0;
    reg sel1;
    wire out;

    mux4 uut(
        
        .data0(data0),
        .data1(data1),
        .data2(data2),
        .data3(data3),
        .sel0(sel0),
        .sel1(sel1),
        .out(out)
    );

    initial
    begin
        $dumpfile ("mux_out.vcd"); 
	    $dumpvars(0, tb_mux4);

        data0 = 0;
        data1 = 1;
        data2 = 0;
        data3 = 1;
        sel0 = 0;
        sel1 = 1;

        #100


        data0 = 0; data1 = 0; data2 = 1; data3 = 0; sel0 = 1; sel1 = 0; #10;
        data0 = 1; data1 = 0; data2 = 0; data3 = 1; sel0 = 1; sel1 = 0;; #10;
    end
endmodule
