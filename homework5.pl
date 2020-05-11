/*7.2 (Adapted from Barwise and Etchemendy (1993).) 
Given the following, can you prove that the unicorn is mythical? 
How about magical? 
Horned?
If the unicorn is mythical, then it is immortal, but if it is not mythical, then it is a mortal mammal. 
If the unicorn is either immortal or a mammal, then it is horned. The unicorn is magical if it is horned.

attempt: 
immortal(unicorn) :- mythical(unicorn).
mortal(unicorn) :- not(mythical(unicorn)).
horned(unicorn) :- immortal(unicorn).
horned(unicorn) :- mammal(unicorn).
magical(unicorn) :- horned(unicorn).

You cannot program this in prolog because there is a variable state of whether the unicorn is mythical or not. 
Prolog is made so that it will not allow variable states. This is impossible */

/*LPN! Exercise 2.4
The following knowledge base represents a lexicon containing these words:

   word(astante,  a,s,t,a,n,t,e). 
   word(astoria,  a,s,t,o,r,i,a). 
   word(baratto,  b,a,r,a,t,t,o). 
   word(cobalto,  c,o,b,a,l,t,o). 
   word(pistola,  p,i,s,t,o,l,a). 
   word(statale,  s,t,a,t,a,l,e).
Write a predicate crossword/6 that tells us how to fill in the grid. 
The first three arguments should be the vertical words from left to right, 
and the last three arguments the horizontal words from top to bottom.
*/

word(astante,  a,s,t,a,n,t,e). 
word(astoria,  a,s,t,o,r,i,a). 
word(baratto,  b,a,r,a,t,t,o). 
word(cobalto,  c,o,b,a,l,t,o). 
word(pistola,  p,i,s,t,o,l,a). 
word(statale,  s,t,a,t,a,l,e).

crossword(V1, V2, V3, H1, H2, H3) :- 
    word(V1, _,L1,_,L4,_,L7,_),
    word(V2, _,L2,_,L5,_,L8,_),
    word(V3, _,L3,_,L6,_,L9,_),
    word(H1, _,L1,_,L2,_,L3,_),
    word(H2, _,L4,_,L5,_,L6,_),
    word(H3, _,L7,_,L8,_,L9,_),
    V1\==V2,
    V1\==V3,
    V1\==H1,
    V1\==H2,
    V1\==H3,
    V2\==V3,
    V2\==H1,
    V2\==H2,
    V2\==H3,
    V3\==H1,
    V3\==H2,
    V3\==H3,
    H1\==H2,
    H1\==H3,
    H2\==H3.

/* This solution for crossword/6 finds all solutions which do not use a word more than once*/