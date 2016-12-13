zebra(N) :-
       %% the street is represented as list of 3 houses
       Street = [_House1,_House2,_House3],

       %% a house is represented as a 3-place (color, nationality, pet) complex term
       %% there is a red house in the street
       member(house(red,_,_), Street),

       %% there is a blue house in the street
       member(house(blue,_,_), Street),

       %% there is a green house in the street
       member(house(green,_,_), Street),

       %% the Englishman lives in the red house
       member(house(red,english,_), Street),

       %% the jaguar is the pet of the Spanish family
       member(house(_,spanish,jaguar), Street),

       %% the Japanese lives to the right of the snail keeper
       sublist([house(_,_,snail),house(_,japanese,_)], Street),

       %% the snail keeper lives to the left of the blue house
       sublist([house(_,_,snail),house(blue,_,_)], Street),

       %% the zebra belongs to the person with nationality N
       member(house(_,N,zebra),Street),

       %% print result
       write(Street), nl.
