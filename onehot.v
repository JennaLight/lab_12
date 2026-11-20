module one_hot(
    input w,
    input clk,
    input reset,
    output z,
    output A, B, C, D, E
);
    wire Anext, Bnext, Cnext, Dnext, Enext;
    wire Astate, Bstate, Cstate, Dstate, Estate;
    
    dff Adff(
        .Default(1'b1),
        .D(Anext),
        .clk(clk),
        .reset(reset),
        .Q(Astate)
    );
    
    dff Bdff(
        .Default(1'b0),
        .D(Bnext),
        .clk(clk),
        .reset(reset),
        .Q(Bstate)
    );
    dff Cdff(
        .Default(1'b0),
        .D(Cnext),
        .clk(clk),
        .reset(reset),
        .Q(Cstate)
    );
    
    dff Ddff(
        .Default(1'b0),
        .D(Dnext),
        .clk(clk),
        .reset(reset),
        .Q(Dstate)
    );
    dff Edff(
        .Default(1'b0),
        .D(Enext),
        .clk(clk),
        .reset(reset),
        .Q(Estate)
    );
    
    assign z = (~Astate & ~Bstate & Cstate & ~Dstate & ~Estate) | (~Astate & ~Bstate & ~Cstate & ~Dstate & Estate);
    assign Anext = 0;
    assign Bnext = (~Dstate & Estate & ~w) | (Dstate & ~Estate & ~w) | (Astate & ~Dstate & ~Estate & ~w);
    assign Cnext = (~Astate & ~Bstate & ~Dstate & ~Estate & ~w) | (~Astate & Bstate & ~Dstate & ~Estate & ~w);
    assign Dnext = (~Astate & Bstate & ~Dstate & ~Estate & w) | (~Bstate & ~Dstate & ~Estate & w);
    assign Enext = (~Astate & ~Bstate & Dstate & ~Estate & w) | (~Astate & ~Bstate & ~Dstate & Estate & w);
    
    assign A = Astate;
    assign B = Bstate;
    assign C = Cstate;
    assign D = Dstate;
    assign E = Estate;
    
    
endmodule