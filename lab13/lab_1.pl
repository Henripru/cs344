/*13.1*/
/*a*/

/*Exercise 3.2*/
directlyIn(Irina, Natasha).
directlyIn(Natasha, Olga).
directlyIn(Olga, Katarina).

in(X, Y) :-
    directlyIn(X, Y).
in(X, Y) :-
    directlyIn(X, Z),
    in(Z, Y).
/*
The first predicate is the base case, the second predicate is the recursive case. 
If something is directly in, then it is also in.
If something is not directly in, then it is in something that is directly in, so recurse.
*/


/*Exercise 4.5*/

tran(eins,one). 
tran(zwei,two). 
tran(drei,three). 
tran(vier,four). 
tran(fuenf,five). 
tran(sechs,six). 
tran(sieben,seven). 
tran(acht,eight). 
tran(neun,nine).

listtran([],[]).
listtran([X|InputTail], [Y|OutputTail]) :-
    tran(X, Y),
    listtran(InputTail, OutputTail).

/*
The first predicate is the base case, the second predicate is the recursive case.
The first predicate just ends the tailing and also ensures that the lists have the same length
The second predicate finds the Y which can be translated from X and recurses down the list.
*/

/*b*/
/*
Short answer: yes. The the predicate rules are how prolog does this.
X implies Y is written in prolog as Y :- X.
*/