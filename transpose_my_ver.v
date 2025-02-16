`timescale 1ns / 1ps
//我們目前會的版本，採用以下語法:
//https://blog.csdn.net/sz_woshishazi/article/details/106356312

// Description: transposes a matrix of size MxN with DATA_WIDTH bits for each position
module transpose #(	parameter M=16, parameter N=16,	parameter DATA_WIDTH=8)
	(	
		input  [N*M*DATA_WIDTH-1:0] a, //input matrix
		output [N*M*DATA_WIDTH-1:0] b //transposed matrix
	);

	
	wire [DATA_WIDTH-1:0] Amat [0:M-1][0:N-1]; //Matrix form of the input
	wire [DATA_WIDTH-1:0] Bmat [0:N-1][0:M-1]; //Matrix form of the output
	
	genvar i,j;//定義一個變數
	
	//Converts the input to a matrix form
	generate
		for (i = 0; i < M; i = i + 1) begin: loop1
			for (j = 0; j < N; j = j + 1) begin: loop2
					assign Amat[i][j]=a[(N*i*DATA_WIDTH+(j+1)*DATA_WIDTH-1)-:DATA_WIDTH];
			end
		end
	endgenerate
	
	// Computes the transpose
	generate
		for (i = 0; i < M; i = i + 1) begin: loop3
			for (j = 0; j < N; j = j + 1) begin: loop4
					assign Bmat[j][i]=Amat[i][j];
			end
		end
	endgenerate
	
	// Converts the transpose to a matrix form
	generate
		for (i = 0; i < N; i = i + 1) begin: loop5
			for (j = 0; j < M; j = j + 1) begin: loop6
					assign b[(N*i*DATA_WIDTH+(j+1)*DATA_WIDTH-1)-:DATA_WIDTH]=Bmat[i][j];
			end
		end
	endgenerate
	
	
endmodule