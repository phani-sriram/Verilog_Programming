//State encoding A --> 00, B-->01, C-->10 

module fsm(reset, clk, inp, out);
    input reset;
    reg [1:0] sin;
    input inp;
    output out;
    reg out;
    input clk;

    always @(posedge clk, reset)
    begin 
        if(reset)
            sin = 2'b0;
        else
        begin
            if(sin[0] == 0 && sin[1] == 0 )
            begin
                if(inp == 0)
                begin
                    sin[0] = 1;
                    sin[1] = 0;
                    out = 0;
                end
                else
                begin
                    sin[0] = 0;
                    sin[1] = 1;
                    out = 0;
                end
            end
            else if(sin[0] == 1 && sin[1] == 0)
            begin
                if(inp == 0)
                begin
                    
                    out = 0;
                end
                    
                else
                begin
                    sin[0] = 0;
                    sin[1] = 1;
                    out = 1;
                end
            end
            else
            begin
                if(sin[0] == 0 && sin[1] == 1)
                begin
                    if(inp == 1)
                    begin
                        
                        out = 0;
                    end
                    else
                    begin
                        sin[0] = 1;
                        sin[1] = 0;
                        out = 0;
                    end
                end
            end
        end
    end
endmodule







//TESTBENCH BEGINS
//I have hard coded the test cases in this test bench.
/* Input(At posedge) Initial State Final state  Output 
    0                   A               B           0
    0                   B               B           0
    1                   B               C           1
    1                   C               C           0
    0                   C               B           0
    Reset becomes 1
    X                   X               A           0
    1                   A               C           0
    0                   C               B           0
    1                   B               C           1
*/
`timescale 1ns/1ps

module tb_fsm;
    reg clk;
    reg inp;
    reg reset;
    wire out;

    fsm uut
    (
        .reset(reset),
        .clk(clk),
        .inp(inp),
        .out(out)    
    ); 

    initial
    begin
        $dumpfile ("fsm_out.vcd"); 
	    $dumpvars(0, tb_fsm);
        
        clk = 0;
        reset = 1;

        #10;
        reset = 0;
        inp = 0;
        #10;
        inp = 0;
        #10;
        inp = 1;
        #10;
        inp = 1;
        #10;
        inp = 0;
        #10;
        reset = 1;
        #10;
        reset = 0;
        inp = 1;
        #10;
        inp = 0;
        #10
        inp = 1;
    end
    always
    begin
        #5 clk = ~clk;
    end
    
endmodule