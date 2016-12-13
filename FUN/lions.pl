/* Boats, Gnus, and Lions

    On a river bank there are 3 lions and 3 gnus.
    Here is a boat with 2 places for crossing the river.
    If on a bank there remain more lions than gnus
    then it is dangerous, since the lions may eat them.

    How could they all cross the river without being in danger?

  Representation:
    The banks are labeled e (east) and w (west). 

    A state (node) is:
       [Boat_Location, NumGnusEast, NumLionsEast, NumGnusWest, NumLionsWest]
    or short:
    [Bank,GnuE,LionE,GnuW,LionW]
    [e,2,0,1,3] - means the boat is on the east bank
                  on the east bank there are: 2 gnus and no lions
                  on the west bank there is 1 gnu and 3 lions
              (this is acutally a unacceptable state).
*/


/* Generators.
    Initial state is all people on east bank.
    Final state is all people on west bank.
    
    Allowable boat seatings:
    boat/2 cycles through the various allowable boat seatings. It "generates"
    valid boat seatings that you can then try to see if they result in
    okay numbers left on the banks. See how boat/2 is used below.
*/
initial([e,3,3,0,0]).
final([w,0,0,3,3]).
boat(NumGnus,NumLions):- 
   member([NumGnus,NumLions], [[0,1],[1,0],[1,1],[2,0],[0,2]]).


/* Program entry: start. */
start :- initial(Start),         /* generator makes Start = [e,3,3,0,0] */
         solve(Start,Solution),  /* find a solution, see below */
         prettyprint(Solution).  /* print solution */

solve(Start,Solution) :- 
         buildPath(Start,[],Solution). /* literally build up a solution
                                          "path", so far we have Start 
                                          and nothing else. SEE BELOW! */



/*********************** YOUR CONTRIBUTIONS ************************/

/* Define what it means to be in an unsafe state.
   fill in the ????s with unsafe conditions
   Sample: unsafe([e,2,3,1,0]) is true
           unsafe([e,2,2,1,1]) is false
   There are lots of variations that you can capture with just these
   two rules!
*/

unsafe([_,GnusEast,LionsEast,_,_]):- GnusEast < LionsEast.
unsafe([_,_,_,GnusWest,LionsWest]):- GnusWest < LionsWest.



/* move/2
 * First arg is an input state.
 * Second arg is an output state that is "generated."
 * There are two moves: boat on east goes west, boat on west goes east.
 * Here is description of first move, other is similar.
 * Use boat/2 to generate a configuration of gnus and lions in the boat.
 * Gnus on the east side originally should be >= gnus in the boat.
 * Gnus on the east side in the new state "is" original east side gnus
 * less gnus in the boat. Similarly for lions on the east side.
 * Gnus on the west side in the new state is the sum of the gnus on
 * on the west side originally and the gnus in the boat. Similarly for the
 * lions.
 * Pictures help you "see" these moves and the constraints! ;-)
 * Sample: move([e,2,2,1,1],[w,1,1,2,2]) is true 
 *              because boat/2 generated [1,1]
 */

 move([BoatPosition, GnusEast, LionsEast, GnusWest, LionsWest],
[BoatPositionOther, GnusEastFinal, LionsEastFinal, GnusEastFinal, LionsEastFinal]) 
:- boat(GnuM, LionM),
 
 (BoatPosition == e, GnusEast >= GnusOnBoat, LionsEast >= LionsOnBoat,
 GnusWestFinal is GnuM + GnusWest, LionsWestFinal is LionM + LionsWest, 
 GnusEastFinal is GnusEast - GnuM, LionsEastFinal is LionsEast - LionM) ;

 (BoatPosition == w, GnusWest >= GnusOnBoat, LionsWest >= LionsOnBoat,
 GnusEastFinal is GnuM + GnusEast, LionsEastFinal is LionM + LionsEast,
 GnusWestFinal is GnusWest - GnuM, LionsWestFinal is LionsWest - LionM).
 
  
   

    



/* buildPath/3: state list list
 * First two arguments are "inputs": state and path-so-far
 *   and third argument is "output.": Solution
 * Base case: input state becomes output head and input path becomes
 *            output tail only if the input state is the final(State).
 * Recursive case: use move to generate a NewState from the input state, 
 *                 make sure the NewState is not unsafe, 
 *                 make sure the NewState is not already on the Path (2nd arg),
 *                 then recurse using NewState, new path of
 *                 input State as head and input Path as tail, and Solution.
 */


%buildpath(InputState ,PathSoFar,[InputState | InputPathTail]) :- InputState == final.

%move([InputState],[PathSoFar]) :- \+ unsafe(InputState), \+ unsafe(PathSoFar), \= PathSofar.




/* prettyprint
 * Very simple: prints each path state.
 * base case: empty path, write a "nl".
 * recursive case: "write" the head, write a "nl", prettyprint tail.
 */

