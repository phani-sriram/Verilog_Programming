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
    reg w; //w has to be changed to wire as we are not making any assignments to it.


    initial //using builtin gates is structural verilog and cannot contain initial and always blocks
    begin
        not n1 (q[3],w); //w has to the output of this not gate rather than input
        dff f1(q[0],w,reset,clk);//interchange reset and clk
        dff f2(q[1],q[0],reset,clk);
        dff f3(q[2],q[1],reset,clk);
        dff f4(q[3],q[2],reset,clk);
    end
endmodule

`timescale 10ns/1ps
module tb_johnson;
    // Inputs
    reg clock; // change "clock" to "clk" as it is referenced below
     reg r;
    // Outputs
    wire Count_out;


//in this following notation you have to pass the signals in the same order
//as in the original module
counter uut (Count_out,clock, r); //put the inputs in their correct order


//alternately, the following notation means that clk in the module connects to clock in the testbench.
//reset connects to r, and q to Count_out.
//In this notation, you can pass signals in any order, as you are explicitly mentioning 
//the signal connections

//   counter uut ( .clk(clock),  .reset(r),.q(Count_out) );


initial begin


clk = 0;
r=1;
#50 r=0;  //reset=1 never shows up on the waveform -- why?
//This is because the wave file is created after this statement 
//Dump statements are written after assignments

$dumpfile ("counter.vcd"); 
$dumpvars(0,counter_test);//change counter_test to name of the test bench module "tb_johnson"

//Put the dump statements before the clk and r assignments

end

always 
#3 clk=~clk;


//initial #300 $finish;

endmodule

