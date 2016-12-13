%
% It's a Tie by Jenny Roberts (via Google Images of "Dell Logic puzzles"
%
% Four colleagus
%

men([crow,evans,hurley,speigler]).
ties([cupids,faces,leprechauns,reindeer]).
relatives([daughter,fatherinlaw,sister,uncle]).

solve :-
      men(Men), ties(Ties), relatives(Relatives),
      Solution = [ mtr(_,cupids,_), mtr(_,faces,_),
                                    mtr(_,leprechauns,_), mtr(_,reindeer,_) ],

      % 1
      member(mtr(Lman, leprechauns, Lrelative), Solution),
      member(Lrelative, [fatherinlaw,sister,uncle]),

      %2
      member(mtr(crow, Cpattern, Crelative), Solution),
      member(Cpattern, [cupids,leprechauns]),

      %3
      member(mtr(speigler, Spattern, Srelative), Solution),
      member(Srelative, [daughter,fatherinlaw,sister]),

      %4
      member(mtr(Fman, faces, Frelative), Solution),
      member(Frelative, [daughter,fatherinlaw,uncle]),

      %5
      member(mtr(evans, EvansPattern, EvansRelative), Solution),
      member(mtr(speigler, SpeiglerPattern, SpeiglerRelative2), Solution),
      (EvansPattern == leprechauns ; SpeiglerRelative2 == fatherinlaw),
      (SpeiglerPattern == leprechauns ; EvansRelative == fatherinlaw),

      %6
      member(mtr(hurley, _, sister), Solution),




      write(Solution), nl.

      
