/*Exercise 2.1, questions 1, 2, 8, 9, 14 - Give the necessary instantiations.
1. bread  =  bread
    yes
2. ’Bread’  =  bread
    no
8. food(X)  =  food(bread)
    X = bread   
    yes
9. food(bread,X)  =  food(Y,sausage)
    X = sausage
    Y = bread
    yes
14. meal(food(bread),X)  =  meal(X,drink(beer))
    no
*/

/*Exercise 2.2 - Explain how Prolog does its unification and reasoning. If you have issues getting the results you’d expect, are there things you can do to game the system?
Does inference in propositional logic use unification? Why or why not?*/
/*
magic(house_elf). 
    nope
wizard(harry).
    nope
magic(wizard).
    error
magic(’McGonagall’).
    error
magic(Hermoine)
    Hermione = dobby

two terms unify if they are the same term or if they contain variables that can be uniformly instantiated with terms in such a way that the resulting terms are equal.
inference does use unification, because it is necessary to unify prereq facts with a fact to check if it is true or not.

*/

/*Does Prolog inferencing use resolution? Why or why not?
I don't know.
*/