

module mux2to1(data1, data0, sel, out);
    input data1;
    input data0;
    input sel;
    output out;
    reg out;

    always @(data0, data1, sel)
    begin
        if(!sel)
            out = data0;
        else
            out = data1; 
    end
endmodule
