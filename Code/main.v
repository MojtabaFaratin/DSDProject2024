module STACK_BASED_ALU #(parameter n) (input clk, input [n-1:0] in, input signed [2:0] opcode, output reg [n-1:0] out, output reg overflow);
    reg [n-1:0] memory [511:0];
    reg [2*n-2:0] overflowCheck;
    integer stackPointer = 0;
    always @(posedge clk) begin
        if(opcode == -4) begin
            out <= memory[stackPointer - 1] + memory[stackPointer - 2];
            overflowCheck <= memory[stackPointer - 1] + memory[stackPointer - 2];
            if (overflowCheck != out) #2 overflow <= 1;
            else #2 overflow <= 0;
        end
        else if(opcode == -3) begin
            out <= memory[stackPointer - 1] * memory[stackPointer - 2];
            overflowCheck <= memory[stackPointer - 1] * memory[stackPointer - 2];
            if (overflowCheck != out) #2 overflow <= 1;
            else #2 overflow <= 0;
        end
        else if(opcode == -2) begin
            memory[stackPointer] <= in;
            #1 stackPointer = stackPointer + 1;
        end
        else if(opcode == -1 && stackPointer != 0) begin
            out <= memory[stackPointer - 1];
            #2 memory[stackPointer - 1] <= 0;
            #3 stackPointer = stackPointer - 1;
        end
    end
endmodule
