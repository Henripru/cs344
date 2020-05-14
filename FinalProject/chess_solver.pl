/*
White Pawn is 1.    Black Pawn is 11.
White Rook is 2.    Black Rook is 12.
White Knight is 3.  Black Knight is 13.
White Bishop is 4.  Black Bishop is 14.
White Queen is 5.   Black Queen is 15.
White King is 6.    Black King is 16.
Empty Slot is 0.

Example: 
compute([
    [12, 13, 14, 15, 16, 14, 13, 12],
    [11, 11, 11, 11, 11, 11, 11, 11],
    [ 0,  0,  0,  0,  0,  0,  0,  0],
    [ 0,  0,  0,  0,  0,  0,  0,  0],
    [ 0,  0,  0,  0,  1,  0,  0,  0],
    [ 0,  0,  0,  0,  0,  0,  0,  0],
    [ 1,  1,  1,  1,  0,  1,  1,  1],
    [ 2,  3,  4,  5,  6,  4,  3,  2]
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
% make methods dynamic so that we can call newly asserted facts from functions
:- dynamic(position/3).
:- dynamic(possibleMove/4).

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
    recordPositionsInRow(Row, RowIndex, _).

/*
Method for determining piece color
*/
getColor(Piece, Color) :- 
    (Piece < 9 -> 
        Color = white
    ;
        Color = black
    ).

/*
Method for switching players
*/
switchColor(white, OtherColor) :-
    OtherColor = black.
switchColor(black, OtherColor) :-
    OtherColor = white.


/*
Method for getting piece at point(X, Y).
*/
getPieceAt(Piece, X, Y) :-
    position(Piece, X, Y).

/*
Method for getting individual values from list of of pieceData
*/
getPieceData(PieceData, Piece, PieceRow, PieceCol) :-
    nth0(0, PieceData, Piece), 
    nth0(1, PieceData, PieceRow), 
    nth0(2, PieceData, PieceCol).

/*
Method for asserting all possible moves of current board state
*/
findMoves([]).
findMoves([PieceData|RestOfPiecesList]) :-
    findMoves(RestOfPiecesList),
    getPieceData(PieceData, Piece, PieceRow, PieceCol),

    % white pawn
    (Piece =:= 1 ->
        % step
        R1 is PieceRow + 1,
        C1 is PieceCol + 1,
        C2 is PieceCol - 1,
        (position(0, R1, PieceCol) ->
            asserta(possibleMove(PieceRow, PieceCol, R1, PieceCol));true
        ),
        % attack right
        forall((position(T1, R1, C1), T1 > 10),
            asserta(possibleMove(PieceRow, PieceCol, R1, C1))
        ),
        % attack left
        forall((position(T2, R1, C2), T2 > 10),
            asserta(possibleMove(PieceRow, PieceCol, R1, C2))
        )
    ;true
    ).

/*
Method for generating possible next moves
*/
generateAllMoves(Color) :-
    findall([X, Y, Z], (position(X, Y, Z), ((Color = black, X > 10); (Color = white, X > 0, X < 10))), PiecesList),
    findMoves(PiecesList).


/*
Minimax Method
*/
/*minimax(0, white, ScoreList,...) :-
    evaluateBoard(TempScore).
    .
minimax(0, black, ScoreList, ...) :-
    .
minimax(Depth, Color) :-
    switchColor(Color, OtherColor),
    minimax(Depth - 1, OtherColor)
    .
*/


/*
Main method called to run chess solver
*/
compute(Board) :-
    parseInitialState(Board, _).
    /*,
    minimax(2, black, ...).*/