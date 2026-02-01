//tb for single cylce

module tb;
reg clk;
S16 cpu(clk);

initial begin
 clk=0;
 repeat(10) #5 clk=~clk;
end
endmodule


//tb for multi cycle

/*
module tb;
reg clk, reset;

S16_MC cpu(clk, reset);

initial begin
    reset = 1; 
    clk = 0;
    #10 reset = 0;      // release reset
    repeat(50) #5 clk = ~clk;
end

initial begin
    $dumpfile("cpu_mc.vcd");
    $dumpvars(0,tb);
end

endmodule
*/