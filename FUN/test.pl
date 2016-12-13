
male(jay).
male(baron).
male(grayson).
male(ethan).
female(cindy).


% parent(A, B) means A is the parent of B
parent(cindy, baron).
parent(cindy, grayson).
parent(cindy, ethan).
parent(jay, baron).
parent(jay, grayson).
parent(jay, ethan).
sibling(X, Y) :- parent(Z, X), parent(Z, Y), \+ (X = Y).


