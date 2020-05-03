/*Exercise 1.4*/
killer(butch).
married(mia, marsellus).
married(marsellus, mia).
dead(zed).
/*These are all facts, so they explain themselves*/

dead(X) :-
    gives_mia_footmassage(X).
/*if there is somebody who gives mia a footmassage, then they are also dead because marcellus has killed them*/
mia_loves(X) :-
    good_dancer(X).
/*if X is a good dancer, then mia loves him/her*/
eaten_by_jules(X) :-
    nutritious(X).
eaten_by_jules(X) :-
    tasty(X).
/*X will be eaten by jules if nutritous, and X will be eaten by jules if tasty.*/

/*Exercise 1.5 - Explain how Prolog comes up with its answers.*/
/*
1. yes, explicitly recorded.
2. no, error because witch not exist. 
3. no, not a fact, and no hasBroom(hermoine) and hasWand(hermione)
4. no, error because witch does not exist
5. yes, hasWand(harry) + quiddichPlayer(harry) which satisfies hasBroom(harry) together result in wizard(harry)
6. ron; harry; yes. because wizard(ron) is a fact, and wizard(harry) is deduced
7. no. witch error again.
*/

/*Consider the well-known modus ponens. Does Prolog implement a version of modus ponens in propositional logic form? If so, demonstrate how it’s done; if not, explain why not. If it doesn’t, can you implement one? Why or why not?
yes. The rules are how prolog does this.
X implies Y is written in prolog as 
Y :- X. where X and Y are facts.
*/

/*Prolog supports representations in the form of Horn clauses. Compare and contrast the representational power they provide with that of propositional logic.
I dont know.
*/

/*Logical implementations generally distinguish the basic operations of TELL and ASK. Does Prolog support this distinction? If so, how; if not, why not?
Yes. You can TELL prolog facts, and you can also query new facts by ASKing for example to list all people who are male by saying male(X).
*/