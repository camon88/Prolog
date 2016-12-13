ee([_,X], [X]).

ee([_,Y|Z], [Y|W]) :- ee(Z,W).
