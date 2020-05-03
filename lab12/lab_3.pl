witch(X) :- burns(X).
burns(X) :- wood(X).
wood(X) :- floats(X).
floats(X) :- duck(X).
duck(X) :- sameWeightAsDuck(X).
sameWeightAsDuck(woman).

/*
witch(woman).
    yes
*/