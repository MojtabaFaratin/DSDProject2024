module test ();
    reg clk;
    parameter mn = 8;
    wire overflow;
    reg [7:0] in;
    reg signed [2:0] opcode;
    wire [7:0] out;
    STACK_BASED_ALU #(.n(mn)) STACK_BASED_ALU_Test(clk, in, opcode, out, overflow);

    always begin
        #5 clk = ~clk;
    end
    
    initial begin
        clk = 0;
        opcode <= 3; in <= 5;
        #10 opcode <= 2; in <= 5;
        #10 opcode <= -2; in <= 3;
        #10 opcode <= -2; in <= 5;
        #10 opcode <= -4; in <= 3;
        #10 opcode <= -3; in <= 3;
        #10 opcode <= -1; in <= 3;
        #10 opcode <= -2; in <= 1;
        #10 opcode <= -2; in <= 2;
        #10 opcode <= -2; in <= 3;
        #10 opcode <= -2; in <= 4;
        #10 opcode <= -2; in <= 5;
        #10 opcode <= -4; in <= 3;
        #10 opcode <= -3; in <= 3;
        #10 opcode <= -1; in <= 3;
        #10 opcode <= -1; in <= 3;
        #10 opcode <= -1; in <= 3;
        #10 opcode <= -1; in <= 3;
        #10 opcode <= -1; in <= 3;
        #10 opcode <= -1; in <= 3;
        #10 opcode <= -1; in <= 3;
        #10 opcode <= -2; in <= 40;
        #10 opcode <= -2; in <= 30;
        #10 opcode <= -4; in <= 3;
        #10 opcode <= -3; in <= 3;
        #10 opcode <= -1; in <= 3;
    end

    initial begin
        $monitor("output: %d, overflow: %b", out, overflow);
    end
endmodule

