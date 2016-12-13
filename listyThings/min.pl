/*
 * Write the program min/2 that takes a list of integers as its 
 * first argument and an integer as its second argument.
 *    
 * Verification mode: min/2 returns Yes if the second argument
 * is the minimum element value of the first argument list.
 *     
 * Computation mode: min/2 determines a value for the
 * second argument that would verify.
 *
 * min([11,12,13,5,14], 5). returns Yes
 * min([11,12,3,22,11], X). returns X=3
 *
 */

% base case
% The min of a one-item list is that item.
min([X],X).

%case1
min([Head|Tail], Result) :-
    min(Tail, Result),
    Result =< Head.

%case2
min([Head|Tail], Result) :-
    min(Tail, R1),
    Head < R1,
    Result is Head. 


