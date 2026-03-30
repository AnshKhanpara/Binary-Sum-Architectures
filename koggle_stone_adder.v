module koggle_stone_adder(
	input  	  [3:0] a,
	input  	  [3:0] b,
	input 	        cin,
	output    [3:0] s,
	output 	  		cout
);

wire [3:0] p;
wire [3:0] g;


assign 	p = a ^ b;
assign	g = a & b;


// p = pi and pi*
// g = (pi and gi*) or gi

wire [3:0] P1,P2;
wire [3:0] G1,G2;
wire [3:0] c;


// stage 1 
assign P1[0] = p[0];
assign G1[0] = g[0];

assign P1[1] = p[1] & p[0];
assign G1[1] = g[1] | (p[1] & g[0]);

assign P1[2] = p[2] & p[1];
assign G1[2] = g[2] | (p[2] & g[1]);

assign P1[3] = p[3] & p[2];
assign G1[3] = g[3] | (p[3] & g[2]);

// stage 2
assign P2[0] = P1[0];
assign G2[0] = G1[0];

assign P2[1] = P1[1];
assign G2[1] = G1[1];

assign P2[2] = P1[2] & P1[0];
assign G2[2] = G1[2] | (P1[2] & G1[0]);

assign P2[3] = P1[3] & P1[1];
assign G2[3] = G1[3] | (P1[3] & G1[1]);

// CARry
assign c[0] = G2[0] | (P2[0] & cin);
assign c[1] = G2[1] | (P2[1] & cin);
assign c[2] = G2[2] | (P2[2] & cin);
assign c[3] = G2[3] | (P2[3] & cin);


// sum P ^ C
assign s[0] = p[0] ^ cin;
assign s[1] = p[1] ^ c[0];
assign s[2] = p[2] ^ c[1];
assign s[3] = p[3] ^ c[2];



assign cout = c[3];
endmodule