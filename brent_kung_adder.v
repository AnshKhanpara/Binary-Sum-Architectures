//brent_kung_adder

module brent_kung_adder(
	input [3:0]a,
	input [3:0]b,
	input cin,
	
	output [3:0] s,
	output cout
);

wire [3:0] p;
wire [3:0] g;
wire [3:0] c;

assign p = a ^ b;
assign g = a & b;

wire p10,p32,p30;
wire g10,g32,g30;

// stage 1
assign p10 = p[1] & p[0];
assign g10 = g[1] | (g[0] & p[1]);

assign p32 = p[3] & p[2];
assign g32 = g[3] | (g[2] & p[3]);

// stage 2
assign p30 = p32 & p10;
assign g30 = g32 | (g10 & p32);


// c
assign c[0] = g[0] | (p[0] & cin);
assign c[1] = g10 | (p10 & c[0]);
assign c[2] = g[2] | (p[2] & c[1]);
assign c[3] = g30 | (p30 & c[2]);

assign cout = c[3];

assign s[0] = p[0] ^ cin;
assign s[1] = p[1] ^ c[0];
assign s[2] = p[2] ^ c[1];
assign s[3] = p[3] ^ c[2];
endmodule