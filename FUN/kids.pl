%
% Kid-Animal friends
%
% Kids: Doug, Sue, Melanie, Ulysses
% Animals: Unicorn, Seahorse, Manatee, Dragon
%
% 1. No child has a pet that starts with same letter as their name.
% 2. Doug doesn't have a pet that lives in water.
% 3. Melanie is allergic to smoke.
% 4. Sue loves to fly.
%



















waterpets([seahorse, manatee]).
smokypets([dragon]).
flyingpets([unicorn, dragon]).
d_pets([dragon]).
s_pets([seahorse]).
m_pets([manatee]).
u_pets([unicorn]).
















solve :-
	    /* generators */
            waterpets(WP), smokypets(SP), flyingpets(FP),
	    d_pets(DPets), s_pets(SPets), m_pets(MPets), u_pets(UPets),

	    Final = [kafriend(_,dragon),  kafriend(_,seahorse),
	    	     kafriend(_,manatee), kafriend(_,unicorn)],


	    /* constraints */
   /* 1 */  member(kafriend(doug,D), Final),   \+(member(D,DPets)),
            member(kafriend(sue,S),Final),     \+(member(S, SPets)),
            member(kafriend(melanie,M),Final), \+(member(M, MPets)),
            member(kafriend(ulysses,U),Final), \+(member(U, UPets)),

   /* 2 */  \+(member(D,WP)),

   /* 3 */  \+(member(M,SP)),

   /* 4 */  member(S,FP),


      	    /* if made it to this rule, then have instantianted 
               values for D,S,M,U that satisfy all the previous
               rules! Yay for you! 
               Now, pretty print them! */
	    prettyprint(D,S,M,U),
	    nl.

prettyprint(D,S,M,U) :-
	    write('Doug took home the '), write(D), nl,
	    write('Sue took home the '), write(S), nl,
	    write('Melanie took home the '), write(M), nl,
	    write('Ulysses took home the '), write(U), nl.

              

	
