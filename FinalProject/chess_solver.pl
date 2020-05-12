/*
Example: 
compute([
    [bR, bKn, bB, bQ, bK, bB, bKn, bR],
    [bP, bP,  bP, bP, bP, bP, bP,  bP],
    [nA, nA,  nA, nA, nA, nA, nA,  nA],
    [nA, nA,  nA, nA, nA, nA, nA,  nA],
    [nA, nA,  nA, nA, nA, nA, nA,  nA],
    [nA, nA,  nA, nA, nA, nA, nA,  nA],
    [wP, wP,  wP, wP, wP, wP, wP,  wP],
    [wR, wKn, wB, wQ, wK, wB, wKn, wR]
]).

How to test chessboard state:
position(Z_OccupiedBy, X_Row, Y_Col).
*/

/*
Method for creating facts with corresponding list index
Main Source: https://stackoverflow.com/a/4381254/6902388
*/
/*
y([], 8).
y([Element|RestOfList], I) :-
    y(RestOfList, IndexTemp),
    I is IndexTemp - 1,
    asserta(truth(Element, I)).

x(List) :-
    y(List, X).
*/


/*
Methods for parsing input chessboard
*/
% Base definition. 
% We look that ColIndex has accumulated to 8 and that the list is now empty
recordPositionsInRow([], _, 8).
% Recursive definition
recordPositionsInRow([Piece|RestOfRow], RowIndex, ColIndex) :-
    recordPositionsInRow(RestOfRow, RowIndex, ColTemp),
    ColIndex is ColTemp - 1,
    asserta(position(Piece, RowIndex, ColIndex)).

% Base definition.
% We set -1 so that indexing starts at 0.
parseInitialState([], -1).
% Recursive definition.
parseInitialState([Row|RestOfBoard], RowIndex) :-
    parseInitialState(RestOfBoard, RowTemp),
    RowIndex is RowTemp + 1,
    recordPositionsInRow(Row, RowIndex, ColVar).

/*
Main method called to run chess solver
*/
compute(Board) :-
    parseInitialState(Board, _).