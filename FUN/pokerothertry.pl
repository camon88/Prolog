/*
Final = [[FN, LN, ITEM], [FN, LN, ITEM],...]
*/

solve(Final):- Final = [[FN, Dixon, ITEM], [FN, Long, ITEM], 
    [Paul, LN, ITEM],[Bill, Riley, ITEM],[Tim, LN, ITEM],[Ben, LN, ITEM]],

    %1-------------------------------------------------------
    member([ FN, Dixon, cigars], Final),
    
    %4-------------------------------------------------------
    member([Ben, LN, ITEM], Final),     
    member(ITEM, [cigars, pepsi, radio]),

    %3--------------------------------------------------------    
    member([Tim, LN, radio], Final), member(LN, [Long, Riley]),    
    

    
   %2----------------------------------------------------------
    %__FN___ Long will bring either cigars, radio, or chips
    member([FN, Long, ITEM], Final),      
    member(ITEM, [cigars, radio, chips]),
    
    %Paul __LN__ will bring either cigar, radio, or chips.
    member([Paul, LN, ITEM], Final), 
    member(ITEM, [cigars, radio, chips]),
    
    %Bill Riley will bring either cigars radio or chips.
    member([Bill, Riley, Item], Final), 
    member(ITEM, [cigars, radio, chips]).











