%
% It's a Tie by Jenny Roberts (via Google Images of "Dell Logic puzzles"
%
% Four colleagus
%

solve :-
      Solution = [ mtr(_,cupids,_), mtr(_,faces,_),
                                    mtr(_,leprechauns,_), mtr(_,reindeer,_) ],

      % 1
      member(mtr(_, leprechauns, Xrelative), Solution),
      Xrelative \== daughter, 
      write('Leprechaun relative '), write(Xrelative), nl,

      %2
      member(mtr(crow, Pattern, _), Solution),
      Pattern \== reindeer,
      Pattern \== faces,

      %3
      member(mtr(speigler, _, SpeiglerRelative), Solution),
      SpeiglerRelative \== uncle,

      %4
      member(mtr(_, faces, Yrelative), Solution),
      Yrelative \== sister,

      %5
      member(mtr(evans, EvansPattern, EvansRelative), Solution),
      member(mtr(speigler, SpeiglerPattern, SpeiglerRelative2), Solution),
      (EvansPattern == leprechauns ; SpeiglerRelative2 == fatherinlaw),
      (SpeiglerPattern == leprechauns ; EvansRelative == fatherinlaw),

      %6
      member(mtr(hurley, _, sister), Solution),




      write(Solution), nl.

      
