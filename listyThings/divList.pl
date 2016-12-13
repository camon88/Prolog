%
% divList/2 - divide list into two "equal" sublists
%
% divList([a,1,b,2,c,3], [a,b,c], [1,2,3]).
% divList([a,1,b,2,c,3,d], [a,b,c,d], [1,2,3]).
%

% base case 1
% An empty list is divided into two empty sublists.
divList([],[],[]).

% base case 2
% A list of one item is divided into a one-item sublist and an empty sublist.
divList([X],[X],[]).
% recursive case
% A list of a pair of items or more is divided by putting the first 
% item in one sublist, the second item in the other sublist, and 
% the tails of those sublists come from the recursive results.
divList([ITEM1, ITEM2 | TAIL], [ITEM1 | LIST1], [ITEM2 | LIST2]) :- divList(TAIL, LIST1, LIST2).
%This takes a list for Arugment1 and takes the first two items(ITEM1 and ITEM2) seperately plus the rest of the list (TAIL).
%Argument2 shows that ITEM1 is put into LIST1.
%Argument3 shows that ITEM2 is put into LIST2.
%Then it says IF there is anything else left in the TAIL part of the list recurse and place ITEM1 of the remaining TAIL into LIST1 and ITEM2 of that
%remaining TAIL into LIST2.
%Keeps going until there is nothing left to recurse on.
%
