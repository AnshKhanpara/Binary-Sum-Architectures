// 4 bit ripple carry adder
module CA_EXP_2(
	input [3:0] a,
	input [3:0] b,
	input cin,
	output [3:0] y
);
wire w1,w2,w3;

full_add f1(a[0],b[0],cin,w1,y[0]);
full_add f2(a[1],b[1],w1,w2,y[1]);
full_add f3(a[2],b[2],w2,w3,y[2]);
full_add f4(a[3],b[3],w3,cout,y[3]);
endmodule

module full_add(
	input a,
	input b,
	input cin,
	output cout,
	output s
);

assign s =  a ^ b ^ cin;
assign cout = (a & b) + (cin & (a ^ b));
endmodule
