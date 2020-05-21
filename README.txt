Project Name: Henri's Chess Minimax Solver
Overview: Implemnets a minimax algorithm in prolog and provides interface to supply board and choose best move for certain color
Usage: 
in command prompt type:
swipl

in prolog type: 
[chess_solver].
compute([
[12, 13, 14,  0, 16, 14, 13, 12],
[11, 11, 11,  0, 11, 11, 11, 11],
[ 0,  0,  0,  0,  0,  0,  0,  0],
[ 0,  0,  0, 11,  0,  15,  0,  0],
[ 0,  0,  5,  0,  1,  0,  0,  0],
[ 0,  0,  0,  0,  0,  0,  0,  0],
[ 1,  1,  1,  1,  0,  1,  1,  1],
[ 2,  3,  4,  0,  6,  4,  3,  2]
], black).