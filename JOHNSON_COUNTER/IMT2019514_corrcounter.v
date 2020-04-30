//This is a Johnson counter
//0, 1, 3, 7, F, E, C, 8, 0, repeat

module dff(q,d,clk,reset);
output q;
input d,clk,reset;
reg q;

always@(posedge clk or reset)
begin
	if (reset==1) q=0;
	else q=d;
end
endmodule



module counter(q,reset,clk);
    output [3:0]q;
    input clk,reset;
    wire w;
    
    
        not n1 (w, q[3]);
        dff f1(q[0],w, clk, reset);//interchange reset and clk
        dff f2(q[1],q[0], clk, reset);
        dff f3(q[2],q[1], clk, reset);
        dff f4(q[3],q[2], clk, reset);


endmodule

`timescale 10ns/1ps
module tb_johnson;
    // Inputs
    reg clk;
     reg r;
    // Outputs
    wire [3:0] Count_out;


//in this following notation you have to pass the signals in the same order
//as in the original module
counter uut (.q(Count_out), .reset(r), .clk(clk)); //change the inputs


//alternately, the following notation means that clk in the module connects to clock in the testbench.
//reset connects to r, and q to Count_out.
//In this notation, you can pass signals in any order, as you are explicitly mentioning 
//the signal connections

//   counter uut ( .clk(clock),  .reset(r),.q(Count_out) );


initial begin

$dumpfile ("counter.vcd"); 
$dumpvars(0, tb_johnson);

clk = 0;
r=1;
#50 r=0;  //reset=1 never shows up on the waveform -- why?
//This is because the wave file is created after this statement 
//Dump statements are written after assignments


end

always 
begin
#3 clk=~clk;
end

//initial #300 $finish;

endmodule

