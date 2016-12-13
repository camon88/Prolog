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

      %2
      member(mtr(crow, Pattern, _), Solution),

      %3
      member(mtr(speigler, _, SpeiglerRelative), Solution),

      %4
      member(mtr(_, faces, Yrelative), Solution),

      %5
      member(mtr(evans, EvansPattern, EvansRelative), Solution),
      member(mtr(speigler, SpeiglerPattern, SpeiglerRelative2), Solution),

      %6
      member(mtr(hurley, _, sister), Solution),


      Xrelative \== daughter,
      Pattern \== reindeer,
      Pattern \== faces,
      SpeiglerRelative \== uncle,
      Yrelative \== sister,
      (EvansPattern == leprechauns ; SpeiglerRelative2 == fatherinlaw),
      (SpeiglerPattern == leprechauns ; EvansRelative == fatherinlaw),


      write(Solution), nl.

      
