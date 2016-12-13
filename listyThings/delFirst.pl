%
% delFirst/3 I,L,R - delete first occurrence of item I in list L resulting
%                    in list R    
%
% delFirst(a, [b,a,c,a,d], [b,c,a,d]).
% delFirst(a, [b,c,d], [b,c,d]).


% base case
% Deleting any item from an empty list is an empty list    
delFirst(_,[],[]).


% recursive case 1
% Deleting Item from a list whose Head is not equal to the Item is a
%    list containing the Head and the result of the recursion.
delFirst(X,[X|TAIL], TAIL).
delFirst(X,[HEAD|TAIL], [HEAD,RESULT]):- delFirst(X,TAIL, RESULT).

% recursive case 2
%i Deleting Item from a list whose Head is the same as the Item is a
%
delFirst(X,[X|TAIL], TAIL).
delFirst(X,[HEAD|TAIL], [HEAD,RESULT]):- delFirst(X,TAIL, RESULT).
