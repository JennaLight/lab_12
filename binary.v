module binary(
    input w,
    input clk,
    input reset,
    output z,
    output A, B, C
);
    wire[2:0] State;
    wire[2:0] Next;
    
    dff zero(
        .Default(1'b0),
        .D(Next[0]),
        .clk(clk),
        .reset(reset),
        .Q(State[0])
    );
    
    dff one(
        .Default(1'b0),
        .D(Next[1]),
        .clk(clk),
        .reset(reset),
        .Q(State[1])
    );
    
    dff two(
        .Default(1'b0),
        .D(Next[2]),
        .clk(clk),
        .reset(reset),
        .Q(State[2])
    );
    // 0 is A; 1 is B; 2 is C; 3 is D; 4 is E;
    assign z = (~State[0] & State[1] & ~State[2])|(~State[0] & ~State[1] & State[2]); // z = 1 at C and E
    assign Next[0] = (~State[0]&~State[1]&~w) | (State[0]&State[1]&~w) | (~State[1]&~State[2]&w)|(~State[0]&State[1]&w);
    assign Next[1] = (~State[1]&~State[2]&w) | (State[0]&~State[1]) | (~State[0]&State[1]);
    assign Next[2] = (State[2]&w)+(State[0]&State[1]&w);

    assign A = State[0];
    assign B = State[1];
    assign C = State[2];
    
endmodule