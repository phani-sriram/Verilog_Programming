module Counter(clk, enable, reset, out);
    output[3:0] out;
    reg [3:0] out;
    input clk;
    input enable;
    input reset;

    always @(posedge clk)
    begin
        if(reset)
            out = 4'b0;
        else if(enable)
            out = out+1; 
    end
endmodule