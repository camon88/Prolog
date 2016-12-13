

opposite(e,w).
opposite(w,e).


move([F1,W,G,C],[F2,W,G,C]) :- opposite(F1,F2),
                               safe([F2,W,G,C]).
move([S1,S1,G,C],[S2,S2,G,C]) :- opposite(S1,S2),
                                 safe([S2,S2,G,C]).
move([S1,W,S1,C],[S2,W,S2,C]) :- opposite(S1,S2),
                                 safe([S2,W,S2,C]).
move([S1,W,G,S1],[S2,W,G,S2]) :- opposite(S1,S2),
                                 safe([S2,W,G,S2]).


safe([F,W,G,C]) :- \+(unsafe([F,W,G,C])).
unsafe([S1,S2,S2,_]) :- opposite(S1,S2).
unsafe([S1,_,S2,S2]) :- opposite(S1,S2).


solution([[w,w,w,w]]).
solution([State1, State2 | Tail]) :- 
    move(State1, State2), 
    solution([State2|Tail]).


puzzle([Start|StateList]) :- 
    Start = [e,e,e,e], 
    length(StateList,L), L<8, 
    solution([Start|StateList]).
