%
% exists/2 X,Y : X exists in list Y
%
% base case
% An item X exists in a list whose head item is X.

exists(X, [X|_]) :- ! . %preferred way

exists(X, [H|T]) :- X == H. %un preferred way

% recursive case
% An item X exists in a list whose head item is not X if it exists in the tail.

exists(X,[H|T]) :- exists(X,T).
