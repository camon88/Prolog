%keep half

%base case

keephalf([],[]).
keephalf([X],[X]).
keephalf([X,Y],[X]).

%recursive cases
keephalf([I1, I2 | Tail], [I1 | X]) :- keephalf(Tail, X).

