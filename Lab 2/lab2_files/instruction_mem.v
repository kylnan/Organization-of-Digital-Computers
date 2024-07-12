`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/25/2021 10:34:43 AM
// Design Name: 
// Module Name: instruction_mem
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



module instruction_mem(
    input [9:0] read_addr,
    output [31:0] data
    );
    
    reg [31:0]rom[255:0];  
    
    initial  
    begin  
 
        ////////////////////////////////////////////////////// grading
        // load to registers 1 to 10
        /*                                               // instruction            alu result in hex       register content       mem content
        rom[0] = 32'b10001100000000010000000000000000; // r1  = mem[0]                4 (add 0)           r1 = 00000005              -
        rom[1] = 32'b10001100000000100000000000000100; // r2  = mem[1]                8 (add 1)           r2 = 0fdf6e91              -
        rom[2] = 32'b10001100000000110000000000001000; // r3  = mem[2]                c (add 2)           r3 = 6a31439b              -
        rom[3] = 32'b10001100000001000000000000001100; // r4  = mem[3]                10(add 3)           r4 = 56343ffd              -
        rom[4] = 32'b10001100000001010000000000010000; // r5  = mem[4]                14(add 4)           r5 = 429eeddb              -
        rom[5] = 32'b10001100000001100000000000010100; // r6  = mem[5]                18(add 5)           r6 = 90000000              -
        rom[6] = 32'b10001100000001110000000000011000; // r7  = mem[6]                1c(add 6)           r7 = 9134fd75              -
        rom[7] = 32'b10001100000010000000000000011100; // r8  = mem[7]                20(add 7)           r8 = bcd11247              -
        rom[8] = 32'b10001100000010010000000000100000; // r9  = mem[8]                24(add 8)           r9 = b55bd831              -
        rom[9] = 32'b10001100000010100000000000100100; // r10 = mem[9]                28(add 9)           r10= d18fa600              -
        */        
        //Program 1
        rom[10] = 32'b00100000000100000000000000000010; //$s0 = 2
        rom[11] = 32'b00100000000100010000000000001010; //$s1 = 10
        rom[12] = 32'b00100000000100100000000000000101; //$s2 = 5
        rom[13] = 32'b00100000000100110000000000000110; //$s3 = 6
        rom[14] = 32'b00100000000101000000000000000010; //$s4 = 2
        
        rom[15] = 32'b00000010010100110100000000100000;
        rom[16] = 32'b00000010100100000100100000100000;
        rom[17] = 32'b00000001000010011000100000100010;
        
        //Program 2
        rom[18] = 32'b00010010000101000000000000000010;
        rom[19] = 32'b00000010010100111000100000100000;
        rom[20] = 32'b00001000000000000000000000010110;
        rom[21] = 32'b00000010010100111000100000100010;
        
        //Program 3
        rom[22] = 32'b00100000000100010000000000001010;
        rom[23] = 32'b00100000000010000000000000000001;
        rom[24] = 32'b00100000000010010000000000000000;
        rom[25] = 32'b10001100000100100000000000000000; //lw
        
        rom[26] = 32'b11000001000000000100100010000000;
        rom[27] = 32'b00000010010010010100100000100000;
        rom[28] = 32'b10001101001010100000000000000000;
        rom[29] = 32'b00010001010100010000000000000010;
        rom[30] = 32'b00100001000010000000000000000001;
        rom[31] = 32'b00001000000000000000000000011010;
        
        //Program 4
        rom[32] = 32'b00100000000001010000000000000001;
        rom[33] = 32'b10001100000001000000000000100100; //lw
        
        rom[34] = 32'b11000000101000000100000010000000;
        rom[35] = 32'b00000000100010000100000000100000;
        
        rom[36] = 32'b10001101000010010000000000000000;
        rom[37] = 32'b10001101000010100000000000000100;
        rom[38] = 32'b10101101000010100000000000000000;
        rom[39] = 32'b10101101000010010000000000000100;
        
        end  
      
      assign data = rom[read_addr[9:2]];

endmodule