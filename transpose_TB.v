`timescale 1ns / 1ps

module transpose_tb;
    parameter M = 6;
    parameter N = 6;
    parameter DATA_WIDTH = 8;
    
    reg [N*M*DATA_WIDTH-1:0] a;
    wire [N*M*DATA_WIDTH-1:0] b;
    
    // Instantiate the transpose module
    transpose #(M, N, DATA_WIDTH) uut (.a(a),.b(b));

    initial begin
        a=288'd1231231239810923809808123123980812038102938012830981238102398019283012983012983019823aaeeeecc;
        
    end
endmodule