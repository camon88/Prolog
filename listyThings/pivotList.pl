%
% pivotList/4 L,P,SP,PLP - pivot list items into two sublists on value P, 
%                          hence Smaller-than-P, P-and-Larger-than-P
%
% pivotList([1,0,-2,-3,4,-5,6], 0, [-2,-3,-5], [1,0,4,6]).
% pivotList([1,2,3,4,5,6], 3, [1,2], [3,4,5,6]).
% pivotList([1,2,3,4,5,6], 7, [1,2,3,4,5,6], []).
%

% base case 
% An empty list is divided into two empty sublists, regardless of Pivot value
pivotList([],_,[],[]).

% Recursive cases
% Prolog+Java-style thinking:
%   pivotList([H|T],P,SP,PLP)
%   if(H<P) then H should be head of SP, recursive processing of T
%      fills out rest of SP and all of PLP.
%   if(H>=P) then H should be head of PLP, recursive processing of T
%      fills out all of SP and rest of PLP.
%
 pivotList([HEAD|TAIL],P,[HEAD|SP],PLP) :- HEAD < P, pivotList(TAIL, P, SP, PLP).
 pivotList([HEAD|TAIL],P, SP, [HEAD|PLP]) :- HEAD >= P, pivotList(TAIL, P, SP, PLP).
