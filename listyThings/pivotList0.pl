%
% pivotList0/3 L,N,NN - pivot list items into two sublists on 0, hence
%                       negatives and non-negatives
%
% pivotList0([1,0,-2,-3,4,-5,6], [-2,-3,-5], [1,0,4,6]).
% pivotList0([1,2,3,4,5,6], [], [1,2,3,4,5,6]).
%

% base case 
% An empty list is divided into two empty sublists.
pivotList0([],[],[]).

    

% Recursive cases
% Prolog+Java-style thinking:
%   pivotList0([H|T],NegList,NonnegList)
%   if(H<0) then H should be head of NegList, recursive processing of T
%      fills out rest of NegList and all of NonnegList.    
%   if(H>=0) then H should be head of NonnegList, recursive processing of T
%      fills out all of NegList and rest of NonnegList.
%
 pivotList0([HEAD|TAIL], [HEAD|NegList], NonnegList) :- HEAD <0, pivotList0(TAIL, NegList, NonnegList).
 pivotList0([HEAD|TAIL], NegList, [HEAD|NonnegList]) :- HEAD >=0, pivotList0(TAIL, NegList, NonnegList).

