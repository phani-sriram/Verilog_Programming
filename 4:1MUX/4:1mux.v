/*module mux2to1(data1, data0, sel, out);
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
endmodule*/

module mux4(data0, data1, data2, data3, sel0, sel1, out);
    input data0;
    input data1;
    input data2;
    input data3;
    input sel0;
    input sel1;
    reg mid1;
    reg mid2;
    output out;
    reg out;


    /*mux1(data1, data0, sel1, mid1);
    mux2(data2, data3, sel1, mid2);
    mux3(mid1, mid2, sel0, out);*/

    always @(data0, data1, data2, data3, sel0, sel1)
    begin
        if(sel1==1)
        begin
            mid1 = data1;
            mid2 = data3;
        end
        else
        begin
            mid1 = data0;
            mid2 = data2;
        end
        if(sel0==0)
            out = mid1;
        else
            out = mid2;
    end
endmodule