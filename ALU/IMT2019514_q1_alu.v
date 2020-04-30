//if select line s=00101, out=a+b
//if s=00110, out= a-b;
//if s=01000, a*b
//01011 --> a/b


module alu (a,b,s,out); //input clk has to be in the port list
input [39:0]a,b;
input [4:0]s;
input clk;
reg [39:0]c,d;
output [39:0]out; //out has to be a reg as we are doing assignments to it

reg i;

always @ (posedge clk)
begin
if (s==5'b00101)
out = a+b;
else if (s==5'b1000)
begin //there is no end statement to this begin and hence has to be deleted
out= a*b;
else if (s==5'b00110)
out = a-b;
else if (s==5'b01011)
out = a/b;
end
endmodule


`timescale 1ns/1ps
module alu_test;
reg [39:0]a,b;
reg clk;
reg [4:0]select;
wire out;//out has to declared as a 40 bit value--> wire [39:0] out; has to be put there 
alu uut (a,b,out,select);//clock has to be added in instantiating
initial
begin
$dumpfile("alua.vcd");
$dumpvars(0, alu_test);
a= 40'h000000000b;
b= 40'h0000000003;
clk=0;
s= 5'b00101;
end

always
begin
#3 clk=~clk;
end

always
begin

s = 5'b00111;//there is no delay for this statement so it will not appear in the waveform and delay has to be introduced for this line also
#10 s = 5'b00110;
#10 s = 5'b01000;
#10 s = 5'b01011;

end

endmodule