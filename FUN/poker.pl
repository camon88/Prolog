/*
    Four guys meet each week on Thursday to play poker.
    At each meeting they decide what everyone has to bring
    for the next meeting.

    1. Mr. Dixon will bring cigars.
    2. Neither Mr. Long, nor Paul, nor Bill Riley will bring pepsi.
    3. Tim, who is not from the Wyatt family, will bring radio.
    4. Ben will not bring the chips.

    Find the whole name of each player and what he is supposed to 
    bring next week. (Note, solution is unique.)
*/

firstname([paul, bill, tim, ben]).
lastname([dixon, long, wyatt, riley]).

fullname(FN, LN) :- firstname(X), lastname(Y),
    member(FN,X), member(LN,Y).

 solve :-
     firstname(FN), lastname(LN),
      
      member(First1, FN), member(First2, FN), member(First3, FN), member(First4, FN),
      member(Last1, LN), member(Last2, LN), member(Last3, LN), member(Last4, LN),
      First2 \== paul, First2 \== bill,
      Last2 \== long, Last2 \== riley,
      Last3 \== wyatt, Last3 \== dixon,
      First4 \== ben, First1 \== First2, 
      First1 \== First3, First1 \== First4,
      First2 \== First3, First2 \== First4,
      First3 \== First4, Last1 \== Last2, 
      Last1 \== Last3, Last1 \== Last4, 
      Last2 \== Last4, Last2 \== Last3, 
      Last3 \== Last4, First3 == tim,
      
      Final = [bringing(First1,dixon,cigars),bringing(First2,Last2,pepsi),
               bringing(tim,Last3,radio),bringing(First4,Last4,chips)],
              
      member(bringing(_, dixon, DixonItem), Final), DixonItem == cigars,
      member(First1, FN),member(Last1, LN),
      % member((bringing(CF,CL,cigars), Final), 
      % CL == dixon, CL \== wyatt, CL \== riley, member(CF, FN),
  
      
        member(bringing(tim,_,TimItem), Final), TimItem == radio,
         member(First3,FN),
         member(Last3,LN),



        member(bringing(_, _,pepsi), Final), 
       
        member(First2,FN),
        member(Last2,LN),
     
        
  
        
              
  
       member(bringing(_,_,chips), Final),
       member(_, FN), 
       member(_, LN),
             

   prettyprint(First1, Last1, First2, Last2, First3, Last3, First4, Last4), nl.
  
   prettyprint(First1, Last1, First2, Last2, First3, Last3, First4, Last4) :-
    write('Cigar: '), write(First1), write(' '), write(Last1), nl,
    write('Pepsi: '), write(First2), write(' '), write(Last2), nl,
    write('Radio: '), write(First3), write(' '), write(Last3), nl,
    write('Chips: '), write(First4), write(' '), write(Last4), nl.
