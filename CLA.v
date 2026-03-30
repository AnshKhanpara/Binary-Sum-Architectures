///// 4 bit carry look ahead adder

module CA_EXP_2(
	input [3:0] a,
	input [3:0] b,
	input cin,
	output [3:0] c,
	output [3:0] y
);

reg [3:0] g;
reg [3:0] p;
integer i;
initial 
begin 
	for(i = 0;i<4;i = i + 1)
	begin 
		g[i] = a[i] & b[i];
		p[i] = a[i] ^ b[i];
	end
end


assign c[0] = g[0] | (p[0] & cin);
assign c[1] = g[1] | (p[1] & c[0]) | (p[1] & p[0] & c[0]);
assign c[2] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & c[0]);
assign c[3] = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0])| (p[3] & p[2] & p[1] & p[0] & g[0]);

assign y[0] = a[0] ^ b[0] ^ cin;
assign y[1] = a[1] ^ b[1] ^ c[0];
assign y[2] = a[2] ^ b[2] ^ c[1];
assign y[3] = a[3] ^ b[3] ^ c[2];


endmodule