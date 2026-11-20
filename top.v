module top(
    input sw, // w
    output [9:0] led, // see IO table
    input btnC, // clk
    input btnU // reset
);
    binary b (
        .w(sw),
        .clk(btnC),
        .reset(btnU),
        .z(led[1]),
        .A(led[7]),
        .B(led[8]),
        .C(led[9])
    );
    
    one_hot oh(
        .w(sw),
        .clk(btnC),
        .reset(btnU),
        .z(led[0]),
        .A(led[2]),
        .B(led[3]),
        .C(led[4]),
        .D(led[5]),
        .E(led[6])
        
    );
    // Hook up binary and one-hot state machines

endmodule