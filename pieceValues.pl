% This file contains values for all pieces.
% Based on tables from https://web.archive.org/web/20171215161422/https://chessprogramming.wikispaces.com/Simplified+evaluation+function/


% piece base values
pieceValue(_, [_,_,pawn,black], 100).
pieceValue(_, [_,_,pawn,white], -100).
pieceValue(_, [_,_,queen,black], 900).
pieceValue(_, [_,_,queen,white], -900).
pieceValue(_, [_,_,rook,black], 500).
pieceValue(_, [_,_,rook,white], -500).
pieceValue(_, [_,_,bishop,black], 330).
pieceValue(_, [_,_,bishop,white], -330).
pieceValue(_, [_,_,knight,black], 320).
pieceValue(_, [_,_,knight,white], -320).
pieceValue(_, [_,_,king,black], 10000).
pieceValue(_, [_,_,king,white], -10000).


% positional piece values for white pawn
pieceValue(_, [1, 8, pawn, white], 0).
pieceValue(_, [2, 8, pawn, white], 0).
pieceValue(_, [3, 8, pawn, white], 0).
pieceValue(_, [4, 8, pawn, white], 0).
pieceValue(_, [5, 8, pawn, white], 0).
pieceValue(_, [6, 8, pawn, white], 0).
pieceValue(_, [7, 8, pawn, white], 0).
pieceValue(_, [8, 8, pawn, white], 0).

pieceValue(_, [1, 7, pawn, white], -50).
pieceValue(_, [2, 7, pawn, white], -50).
pieceValue(_, [3, 7, pawn, white], -50).
pieceValue(_, [4, 7, pawn, white], -50).
pieceValue(_, [5, 7, pawn, white], -50).
pieceValue(_, [6, 7, pawn, white], -50).
pieceValue(_, [7, 7, pawn, white], -50).
pieceValue(_, [8, 7, pawn, white], -50).

pieceValue(_, [1, 6, pawn, white], -10).
pieceValue(_, [2, 6, pawn, white], -10).
pieceValue(_, [3, 6, pawn, white], -20).
pieceValue(_, [4, 6, pawn, white], -30).
pieceValue(_, [5, 6, pawn, white], -30).
pieceValue(_, [6, 6, pawn, white], -20).
pieceValue(_, [7, 6, pawn, white], -10).
pieceValue(_, [8, 6, pawn, white], -10).

pieceValue(_, [1, 5, pawn, white], -5).
pieceValue(_, [2, 5, pawn, white], -5).
pieceValue(_, [3, 5, pawn, white], -10).
pieceValue(_, [4, 5, pawn, white], -25).
pieceValue(_, [5, 5, pawn, white], -25).
pieceValue(_, [6, 5, pawn, white], -10).
pieceValue(_, [7, 5, pawn, white], -5).
pieceValue(_, [8, 5, pawn, white], -5).

pieceValue(_, [1, 4, pawn, white], 0).
pieceValue(_, [2, 4, pawn, white], 0).
pieceValue(_, [3, 4, pawn, white], 0).
pieceValue(_, [4, 4, pawn, white], -20).
pieceValue(_, [5, 4, pawn, white], -20).
pieceValue(_, [6, 4, pawn, white], 0).
pieceValue(_, [7, 4, pawn, white], 0).
pieceValue(_, [8, 4, pawn, white], 0).

pieceValue(_, [1, 3, pawn, white], -5).
pieceValue(_, [2, 3, pawn, white], 5).
pieceValue(_, [3, 3, pawn, white], 10).
pieceValue(_, [4, 3, pawn, white], 0).
pieceValue(_, [5, 3, pawn, white], 0).
pieceValue(_, [6, 3, pawn, white], 10).
pieceValue(_, [7, 3, pawn, white], 5).
pieceValue(_, [8, 3, pawn, white], -5).

pieceValue(_, [1, 2, pawn, white], -5).
pieceValue(_, [2, 2, pawn, white], -10).
pieceValue(_, [3, 2, pawn, white], -10).
pieceValue(_, [4, 2, pawn, white], 20).
pieceValue(_, [5, 2, pawn, white], 20).
pieceValue(_, [6, 2, pawn, white], -10).
pieceValue(_, [7, 2, pawn, white], -10).
pieceValue(_, [8, 2, pawn, white], -5).

pieceValue(_, [1, 1, pawn, white], 0).
pieceValue(_, [2, 1, pawn, white], 0).
pieceValue(_, [3, 1, pawn, white], 0).
pieceValue(_, [4, 1, pawn, white], 0).
pieceValue(_, [5, 1, pawn, white], 0).
pieceValue(_, [6, 1, pawn, white], 0).
pieceValue(_, [7, 1, pawn, white], 0).
pieceValue(_, [8, 1, pawn, white], 0).


% positional piece values for white queen.
pieceValue(_, [1, 8, queen, white], 20).
pieceValue(_, [2, 8, queen, white], 10).
pieceValue(_, [3, 8, queen, white], 10).
pieceValue(_, [4, 8, queen, white], 5).
pieceValue(_, [5, 8, queen, white], 5).
pieceValue(_, [6, 8, queen, white], 10).
pieceValue(_, [7, 8, queen, white], 10).
pieceValue(_, [8, 8, queen, white], 20).

pieceValue(_, [1, 7, queen, white], 10).
pieceValue(_, [2, 7, queen, white], 0).
pieceValue(_, [3, 7, queen, white], 0).
pieceValue(_, [4, 7, queen, white], 0).
pieceValue(_, [5, 7, queen, white], 0).
pieceValue(_, [6, 7, queen, white], 0).
pieceValue(_, [7, 7, queen, white], 0).
pieceValue(_, [8, 7, queen, white], 10).

pieceValue(_, [1, 6, queen, white], 10).
pieceValue(_, [2, 6, queen, white], 0).
pieceValue(_, [3, 6, queen, white], -5).
pieceValue(_, [4, 6, queen, white], -5).
pieceValue(_, [5, 6, queen, white], -5).
pieceValue(_, [6, 6, queen, white], -5).
pieceValue(_, [7, 6, queen, white], 0).
pieceValue(_, [8, 6, queen, white], 10).

pieceValue(_, [1, 5, queen, white], 5).
pieceValue(_, [2, 5, queen, white], 0).
pieceValue(_, [3, 5, queen, white], -5).
pieceValue(_, [4, 5, queen, white], -5).
pieceValue(_, [5, 5, queen, white], -5).
pieceValue(_, [6, 5, queen, white], -5).
pieceValue(_, [7, 5, queen, white], 0).
pieceValue(_, [8, 5, queen, white], 5).

pieceValue(_, [1, 4, queen, white], 0).
pieceValue(_, [2, 4, queen, white], 0).
pieceValue(_, [3, 4, queen, white], -5).
pieceValue(_, [4, 4, queen, white], -5).
pieceValue(_, [5, 4, queen, white], -5).
pieceValue(_, [6, 4, queen, white], -5).
pieceValue(_, [7, 4, queen, white], 0).
pieceValue(_, [8, 4, queen, white], 5).

pieceValue(_, [1, 3, queen, white], 10).
pieceValue(_, [2, 3, queen, white], -5).
pieceValue(_, [3, 3, queen, white], -5).
pieceValue(_, [4, 3, queen, white], -5).
pieceValue(_, [5, 3, queen, white], -5).
pieceValue(_, [6, 3, queen, white], -5).
pieceValue(_, [7, 3, queen, white], 0).
pieceValue(_, [8, 3, queen, white], 10).

pieceValue(_, [1, 2, queen, white], 10).
pieceValue(_, [2, 2, queen, white], 0).
pieceValue(_, [3, 2, queen, white], -5).
pieceValue(_, [4, 2, queen, white], 0).
pieceValue(_, [5, 2, queen, white], 0).
pieceValue(_, [6, 2, queen, white], 0).
pieceValue(_, [7, 2, queen, white], 0).
pieceValue(_, [8, 2, queen, white], 10).

pieceValue(_, [1, 1, queen, white], 20).
pieceValue(_, [2, 1, queen, white], 10).
pieceValue(_, [3, 1, queen, white], 10).
pieceValue(_, [4, 1, queen, white], 5).
pieceValue(_, [5, 1, queen, white], 5).
pieceValue(_, [6, 1, queen, white], 10).
pieceValue(_, [7, 1, queen, white], 10).
pieceValue(_, [8, 1, queen, white], 20).


% positional piece values for white bishop.
pieceValue(_, [1, 8, bishop, white], 20).
pieceValue(_, [2, 8, bishop, white], 10).
pieceValue(_, [3, 8, bishop, white], 10).
pieceValue(_, [4, 8, bishop, white], 10).
pieceValue(_, [5, 8, bishop, white], 10).
pieceValue(_, [6, 8, bishop, white], 10).
pieceValue(_, [7, 8, bishop, white], 10).
pieceValue(_, [8, 8, bishop, white], 20).

pieceValue(_, [1, 7, bishop, white], 10).
pieceValue(_, [2, 7, bishop, white], 0).
pieceValue(_, [3, 7, bishop, white], 0).
pieceValue(_, [4, 7, bishop, white], 0).
pieceValue(_, [5, 7, bishop, white], 0).
pieceValue(_, [6, 7, bishop, white], 0).
pieceValue(_, [7, 7, bishop, white], 0).
pieceValue(_, [8, 7, bishop, white], 10).

pieceValue(_, [1, 6, bishop, white], 10).
pieceValue(_, [2, 6, bishop, white], 0).
pieceValue(_, [3, 6, bishop, white], -5).
pieceValue(_, [4, 6, bishop, white], -10).
pieceValue(_, [5, 6, bishop, white], -10).
pieceValue(_, [6, 6, bishop, white], -5).
pieceValue(_, [7, 6, bishop, white], 0).
pieceValue(_, [8, 6, bishop, white], 10).

pieceValue(_, [1, 5, bishop, white], 10).
pieceValue(_, [2, 5, bishop, white], -5).
pieceValue(_, [3, 5, bishop, white], -5).
pieceValue(_, [4, 5, bishop, white], -10).
pieceValue(_, [5, 5, bishop, white], -10).
pieceValue(_, [6, 5, bishop, white], -5).
pieceValue(_, [7, 5, bishop, white], -5).
pieceValue(_, [8, 5, bishop, white], 10).

pieceValue(_, [1, 4, bishop, white], 10).
pieceValue(_, [2, 4, bishop, white], 0).
pieceValue(_, [3, 4, bishop, white], -10).
pieceValue(_, [4, 4, bishop, white], -10).
pieceValue(_, [5, 4, bishop, white], -10).
pieceValue(_, [6, 4, bishop, white], -10).
pieceValue(_, [7, 4, bishop, white], 0).
pieceValue(_, [8, 4, bishop, white], 10).

pieceValue(_, [1, 3, bishop, white], 10).
pieceValue(_, [2, 3, bishop, white], -10).
pieceValue(_, [3, 3, bishop, white], -10).
pieceValue(_, [4, 3, bishop, white], -10).
pieceValue(_, [5, 3, bishop, white], -10).
pieceValue(_, [6, 3, bishop, white], -10).
pieceValue(_, [7, 3, bishop, white], -10).
pieceValue(_, [8, 3, bishop, white], 10).

pieceValue(_, [1, 2, bishop, white], 10).
pieceValue(_, [2, 2, bishop, white], -5).
pieceValue(_, [3, 2, bishop, white], 0).
pieceValue(_, [4, 2, bishop, white], 0).
pieceValue(_, [5, 2, bishop, white], 0).
pieceValue(_, [6, 2, bishop, white], 0).
pieceValue(_, [7, 2, bishop, white], -5).
pieceValue(_, [8, 2, bishop, white], 10).

pieceValue(_, [1, 1, bishop, white], 20).
pieceValue(_, [2, 1, bishop, white], 10).
pieceValue(_, [3, 1, bishop, white], 10).
pieceValue(_, [4, 1, bishop, white], 10).
pieceValue(_, [5, 1, bishop, white], 10).
pieceValue(_, [6, 1, bishop, white], 10).
pieceValue(_, [7, 1, bishop, white], 10).
pieceValue(_, [8, 1, bishop, white], 20).


% positional piece values for white rook
pieceValue(_, [1, 8, rook, white], 0).
pieceValue(_, [2, 8, rook, white], 0).
pieceValue(_, [3, 8, rook, white], 0).
pieceValue(_, [4, 8, rook, white], 0).
pieceValue(_, [5, 8, rook, white], 0).
pieceValue(_, [6, 8, rook, white], 0).
pieceValue(_, [7, 8, rook, white], 0).
pieceValue(_, [8, 8, rook, white], 0).

pieceValue(_, [1, 7, rook, white], -5).
pieceValue(_, [2, 7, rook, white], -10).
pieceValue(_, [3, 7, rook, white], -10).
pieceValue(_, [4, 7, rook, white], -10).
pieceValue(_, [5, 7, rook, white], -10).
pieceValue(_, [6, 7, rook, white], -10).
pieceValue(_, [7, 7, rook, white], -10).
pieceValue(_, [8, 7, rook, white], -5).

pieceValue(_, [1, 6, rook, white], 5).
pieceValue(_, [2, 6, rook, white], 0).
pieceValue(_, [3, 6, rook, white], 0).
pieceValue(_, [4, 6, rook, white], 0).
pieceValue(_, [5, 6, rook, white], 0).
pieceValue(_, [6, 6, rook, white], 0).
pieceValue(_, [7, 6, rook, white], 0).
pieceValue(_, [8, 6, rook, white], 5).

pieceValue(_, [1, 5, rook, white], 5).
pieceValue(_, [2, 5, rook, white], 0).
pieceValue(_, [3, 5, rook, white], 0).
pieceValue(_, [4, 5, rook, white], 0).
pieceValue(_, [5, 5, rook, white], 0).
pieceValue(_, [6, 5, rook, white], 0).
pieceValue(_, [7, 5, rook, white], 0).
pieceValue(_, [8, 5, rook, white], 5).

pieceValue(_, [1, 4, rook, white], 5).
pieceValue(_, [2, 4, rook, white], 0).
pieceValue(_, [3, 4, rook, white], 0).
pieceValue(_, [4, 4, rook, white], 0).
pieceValue(_, [5, 4, rook, white], 0).
pieceValue(_, [6, 4, rook, white], 0).
pieceValue(_, [7, 4, rook, white], 0).
pieceValue(_, [8, 4, rook, white], 5).

pieceValue(_, [1, 3, rook, white], 5).
pieceValue(_, [2, 3, rook, white], 0).
pieceValue(_, [3, 3, rook, white], 0).
pieceValue(_, [4, 3, rook, white], 0).
pieceValue(_, [5, 3, rook, white], 0).
pieceValue(_, [6, 3, rook, white], 0).
pieceValue(_, [7, 3, rook, white], 0).
pieceValue(_, [8, 3, rook, white], 5).

pieceValue(_, [1, 2, rook, white], 5).
pieceValue(_, [2, 2, rook, white], 0).
pieceValue(_, [3, 2, rook, white], 0).
pieceValue(_, [4, 2, rook, white], 0).
pieceValue(_, [5, 2, rook, white], 0).
pieceValue(_, [6, 2, rook, white], 0).
pieceValue(_, [7, 2, rook, white], 0).
pieceValue(_, [8, 2, rook, white], 5).

pieceValue(_, [1, 1, rook, white], 0).
pieceValue(_, [2, 1, rook, white], 0).
pieceValue(_, [3, 1, rook, white], 0).
pieceValue(_, [4, 1, rook, white], -5).
pieceValue(_, [5, 1, rook, white], -5).
pieceValue(_, [6, 1, rook, white], 0).
pieceValue(_, [7, 1, rook, white], 0).
pieceValue(_, [8, 1, rook, white], 0).


% piece value for white king in midgame
pieceValue(_, [1, 8, king, white], 30).
pieceValue(_, [2, 8, king, white], 40).
pieceValue(_, [3, 8, king, white], 40).
pieceValue(_, [4, 8, king, white], 50).
pieceValue(_, [5, 8, king, white], 50).
pieceValue(_, [6, 8, king, white], 40).
pieceValue(_, [7, 8, king, white], 40).
pieceValue(_, [8, 8, king, white], 30).

pieceValue(_, [1, 7, king, white], 30).
pieceValue(_, [2, 7, king, white], 40).
pieceValue(_, [3, 7, king, white], 40).
pieceValue(_, [4, 7, king, white], 50).
pieceValue(_, [5, 7, king, white], 50).
pieceValue(_, [6, 7, king, white], 40).
pieceValue(_, [7, 7, king, white], 40).
pieceValue(_, [8, 7, king, white], 30).

pieceValue(_, [1, 6, king, white], 30).
pieceValue(_, [2, 6, king, white], 40).
pieceValue(_, [3, 6, king, white], 40).
pieceValue(_, [4, 6, king, white], 50).
pieceValue(_, [5, 6, king, white], 50).
pieceValue(_, [6, 6, king, white], 40).
pieceValue(_, [7, 6, king, white], 40).
pieceValue(_, [8, 6, king, white], 30).

pieceValue(_, [1, 5, king, white], 30).
pieceValue(_, [2, 5, king, white], 40).
pieceValue(_, [3, 5, king, white], 40).
pieceValue(_, [4, 5, king, white], 50).
pieceValue(_, [5, 5, king, white], 50).
pieceValue(_, [6, 5, king, white], 40).
pieceValue(_, [7, 5, king, white], 40).
pieceValue(_, [8, 5, king, white], 30).

pieceValue(_, [1, 4, king, white], 20).
pieceValue(_, [2, 4, king, white], 30).
pieceValue(_, [3, 4, king, white], 30).
pieceValue(_, [4, 4, king, white], 40).
pieceValue(_, [5, 4, king, white], 40).
pieceValue(_, [6, 4, king, white], 30).
pieceValue(_, [7, 4, king, white], 30).
pieceValue(_, [8, 4, king, white], 20).

pieceValue(_, [1, 3, king, white], 10).
pieceValue(_, [2, 3, king, white], 20).
pieceValue(_, [3, 3, king, white], 20).
pieceValue(_, [4, 3, king, white], 20).
pieceValue(_, [5, 3, king, white], 20).
pieceValue(_, [6, 3, king, white], 20).
pieceValue(_, [7, 3, king, white], 20).
pieceValue(_, [8, 3, king, white], 10).

pieceValue(_, [1, 2, king, white], -20).
pieceValue(_, [2, 2, king, white], -20).
pieceValue(_, [3, 2, king, white], 0).
pieceValue(_, [4, 2, king, white], 0).
pieceValue(_, [5, 2, king, white], 0).
pieceValue(_, [6, 2, king, white], 0).
pieceValue(_, [7, 2, king, white], -20).
pieceValue(_, [8, 2, king, white], -20).

pieceValue(_, [1, 1, king, white], -20).
pieceValue(_, [2, 1, king, white], -30).
pieceValue(_, [3, 1, king, white], -10).
pieceValue(_, [4, 1, king, white], 0).
pieceValue(_, [5, 1, king, white], 0).
pieceValue(_, [6, 1, king, white], -10).
pieceValue(_, [7, 1, king, white], -30).
pieceValue(_, [8, 1, king, white], -20).


% piece value for white knight
pieceValue(_, [1, 8, knight, white], 50).
pieceValue(_, [2, 8, knight, white], 40).
pieceValue(_, [3, 8, knight, white], 30).
pieceValue(_, [4, 8, knight, white], 30).
pieceValue(_, [5, 8, knight, white], 30).
pieceValue(_, [6, 8, knight, white], 30).
pieceValue(_, [7, 8, knight, white], 40).
pieceValue(_, [8, 8, knight, white], 50).

pieceValue(_, [1, 7, knight, white], 40).
pieceValue(_, [2, 7, knight, white], 20).
pieceValue(_, [3, 7, knight, white], 0).
pieceValue(_, [4, 7, knight, white], 0).
pieceValue(_, [5, 7, knight, white], 0).
pieceValue(_, [6, 7, knight, white], 0).
pieceValue(_, [7, 7, knight, white], 20).
pieceValue(_, [8, 7, knight, white], 40).

pieceValue(_, [1, 6, knight, white], 30).
pieceValue(_, [2, 6, knight, white], 0).
pieceValue(_, [3, 6, knight, white], -10).
pieceValue(_, [4, 6, knight, white], -15).
pieceValue(_, [5, 6, knight, white], -15).
pieceValue(_, [6, 6, knight, white], -10).
pieceValue(_, [7, 6, knight, white], 0).
pieceValue(_, [8, 6, knight, white], 30).

pieceValue(_, [1, 5, knight, white], 30).
pieceValue(_, [2, 5, knight, white], -5).
pieceValue(_, [3, 5, knight, white], -15).
pieceValue(_, [4, 5, knight, white], -20).
pieceValue(_, [5, 5, knight, white], -20).
pieceValue(_, [6, 5, knight, white], -15).
pieceValue(_, [7, 5, knight, white], -5).
pieceValue(_, [8, 5, knight, white], 30).

pieceValue(_, [1, 4, knight, white], 30).
pieceValue(_, [2, 4, knight, white], 0).
pieceValue(_, [3, 4, knight, white], -15).
pieceValue(_, [4, 4, knight, white], -20).
pieceValue(_, [5, 4, knight, white], -20).
pieceValue(_, [6, 4, knight, white], -15).
pieceValue(_, [7, 4, knight, white], 0).
pieceValue(_, [8, 4, knight, white], 30).

pieceValue(_, [1, 3, knight, white], 30).
pieceValue(_, [2, 3, knight, white], -5).
pieceValue(_, [3, 3, knight, white], -10).
pieceValue(_, [4, 3, knight, white], -15).
pieceValue(_, [5, 3, knight, white], -15).
pieceValue(_, [6, 3, knight, white], -10).
pieceValue(_, [7, 3, knight, white], -5).
pieceValue(_, [8, 3, knight, white], 30).

pieceValue(_, [1, 2, knight, white], 40).
pieceValue(_, [2, 2, knight, white], 20).
pieceValue(_, [3, 2, knight, white], 0).
pieceValue(_, [4, 2, knight, white], -5).
pieceValue(_, [5, 2, knight, white], -5).
pieceValue(_, [6, 2, knight, white], 0).
pieceValue(_, [7, 2, knight, white], 20).
pieceValue(_, [8, 2, knight, white], 40).

pieceValue(_, [1, 1, knight, white], 50).
pieceValue(_, [2, 1, knight, white], 40).
pieceValue(_, [3, 1, knight, white], 30).
pieceValue(_, [4, 1, knight, white], 30).
pieceValue(_, [5, 1, knight, white], 30).
pieceValue(_, [6, 1, knight, white], 30).
pieceValue(_, [7, 1, knight, white], 40).
pieceValue(_, [8, 1, knight, white], 50).


% positional piece values for black pawn
pieceValue(_, [1, 8, pawn, black], 0).
pieceValue(_, [2, 8, pawn, black], 0).
pieceValue(_, [3, 8, pawn, black], 0).
pieceValue(_, [4, 8, pawn, black], 0).
pieceValue(_, [5, 8, pawn, black], 0).
pieceValue(_, [6, 8, pawn, black], 0).
pieceValue(_, [7, 8, pawn, black], 0).
pieceValue(_, [8, 8, pawn, black], 0).

pieceValue(_, [1, 7, pawn, black], 5).
pieceValue(_, [2, 7, pawn, black], 10).
pieceValue(_, [3, 7, pawn, black], 10).
pieceValue(_, [4, 7, pawn, black], -20).
pieceValue(_, [5, 7, pawn, black], -20).
pieceValue(_, [6, 7, pawn, black], 10).
pieceValue(_, [7, 7, pawn, black], 10).
pieceValue(_, [8, 7, pawn, black], 5).

pieceValue(_, [1, 6, pawn, black], 5).
pieceValue(_, [2, 6, pawn, black], -5).
pieceValue(_, [3, 6, pawn, black], -10).
pieceValue(_, [4, 6, pawn, black], 0).
pieceValue(_, [5, 6, pawn, black], 0).
pieceValue(_, [6, 6, pawn, black], -10).
pieceValue(_, [7, 6, pawn, black], -5).
pieceValue(_, [8, 6, pawn, black], 5).

pieceValue(_, [1, 5, pawn, black], 0).
pieceValue(_, [2, 5, pawn, black], 0).
pieceValue(_, [3, 5, pawn, black], 0).
pieceValue(_, [4, 5, pawn, black], 20).
pieceValue(_, [5, 5, pawn, black], 20).
pieceValue(_, [6, 5, pawn, black], 0).
pieceValue(_, [7, 5, pawn, black], 0).
pieceValue(_, [8, 5, pawn, black], 0).

pieceValue(_, [1, 4, pawn, black], 5).
pieceValue(_, [2, 4, pawn, black], 5).
pieceValue(_, [3, 4, pawn, black], 10).
pieceValue(_, [4, 4, pawn, black], 25).
pieceValue(_, [5, 4, pawn, black], 25).
pieceValue(_, [6, 4, pawn, black], 10).
pieceValue(_, [7, 4, pawn, black], 5).
pieceValue(_, [8, 4, pawn, black], 5).

pieceValue(_, [1, 3, pawn, black], 10).
pieceValue(_, [2, 3, pawn, black], 10).
pieceValue(_, [3, 3, pawn, black], 20).
pieceValue(_, [4, 3, pawn, black], 30).
pieceValue(_, [5, 3, pawn, black], 30).
pieceValue(_, [6, 3, pawn, black], 20).
pieceValue(_, [7, 3, pawn, black], 10).
pieceValue(_, [8, 3, pawn, black], 10).

pieceValue(_, [1, 2, pawn, black], 50).
pieceValue(_, [2, 2, pawn, black], 50).
pieceValue(_, [3, 2, pawn, black], 50).
pieceValue(_, [4, 2, pawn, black], 50).
pieceValue(_, [5, 2, pawn, black], 50).
pieceValue(_, [6, 2, pawn, black], 50).
pieceValue(_, [7, 2, pawn, black], 50).
pieceValue(_, [8, 2, pawn, black], 50).

pieceValue(_, [1, 1, pawn, black], 0).
pieceValue(_, [2, 1, pawn, black], 0).
pieceValue(_, [3, 1, pawn, black], 0).
pieceValue(_, [4, 1, pawn, black], 0).
pieceValue(_, [5, 1, pawn, black], 0).
pieceValue(_, [6, 1, pawn, black], 0).
pieceValue(_, [7, 1, pawn, black], 0).
pieceValue(_, [8, 1, pawn, black], 0).


% positional piece values for black knight
pieceValue(_, [1, 8, knight, black], -50).
pieceValue(_, [2, 8, knight, black], -40).
pieceValue(_, [3, 8, knight, black], -30).
pieceValue(_, [4, 8, knight, black], -30).
pieceValue(_, [5, 8, knight, black], -30).
pieceValue(_, [6, 8, knight, black], -30).
pieceValue(_, [7, 8, knight, black], -40).
pieceValue(_, [8, 8, knight, black], -50).

pieceValue(_, [1, 7, knight, black], -40).
pieceValue(_, [2, 7, knight, black], -20).
pieceValue(_, [3, 7, knight, black], 0).
pieceValue(_, [4, 7, knight, black], 5).
pieceValue(_, [5, 7, knight, black], 5).
pieceValue(_, [6, 7, knight, black], 0).
pieceValue(_, [7, 7, knight, black], -20).
pieceValue(_, [8, 7, knight, black], -40).

pieceValue(_, [1, 6, knight, black], -30).
pieceValue(_, [2, 6, knight, black], 5).
pieceValue(_, [3, 6, knight, black], 10).
pieceValue(_, [4, 6, knight, black], 15).
pieceValue(_, [5, 6, knight, black], 15).
pieceValue(_, [6, 6, knight, black], 10).
pieceValue(_, [7, 6, knight, black], 5).
pieceValue(_, [8, 6, knight, black], -30).

pieceValue(_, [1, 5, knight, black], -30).
pieceValue(_, [2, 5, knight, black], 0).
pieceValue(_, [3, 5, knight, black], 15).
pieceValue(_, [4, 5, knight, black], 20).
pieceValue(_, [5, 5, knight, black], 20).
pieceValue(_, [6, 5, knight, black], 15).
pieceValue(_, [7, 5, knight, black], 0).
pieceValue(_, [8, 5, knight, black], -30).

pieceValue(_, [1, 4, knight, black], -30).
pieceValue(_, [2, 4, knight, black], 5).
pieceValue(_, [3, 4, knight, black], 15).
pieceValue(_, [4, 4, knight, black], 20).
pieceValue(_, [5, 4, knight, black], 20).
pieceValue(_, [6, 4, knight, black], 15).
pieceValue(_, [7, 4, knight, black], 5).
pieceValue(_, [8, 4, knight, black], -30).

pieceValue(_, [1, 3, knight, black], -30).
pieceValue(_, [2, 3, knight, black], 0).
pieceValue(_, [3, 3, knight, black], 10).
pieceValue(_, [4, 3, knight, black], 15).
pieceValue(_, [5, 3, knight, black], 15).
pieceValue(_, [6, 3, knight, black], 10).
pieceValue(_, [7, 3, knight, black], 0).
pieceValue(_, [8, 3, knight, black], -30).

pieceValue(_, [1, 2, knight, black], -40).
pieceValue(_, [2, 2, knight, black], -20).
pieceValue(_, [3, 2, knight, black], 0).
pieceValue(_, [4, 2, knight, black], 0).
pieceValue(_, [5, 2, knight, black], 0).
pieceValue(_, [6, 2, knight, black], 0).
pieceValue(_, [7, 2, knight, black], -20).
pieceValue(_, [8, 2, knight, black], -40).

pieceValue(_, [1, 1, knight, black], -50).
pieceValue(_, [2, 1, knight, black], -40).
pieceValue(_, [3, 1, knight, black], -30).
pieceValue(_, [4, 1, knight, black], -30).
pieceValue(_, [5, 1, knight, black], -30).
pieceValue(_, [6, 1, knight, black], -30).
pieceValue(_, [7, 1, knight, black], -40).
pieceValue(_, [8, 1, knight, black], -50).


% positional piece values for black bishop
pieceValue(_, [1, 8, bishop, black], -20).
pieceValue(_, [2, 8, bishop, black], -10).
pieceValue(_, [3, 8, bishop, black], -10).
pieceValue(_, [4, 8, bishop, black], -10).
pieceValue(_, [5, 8, bishop, black], -10).
pieceValue(_, [6, 8, bishop, black], -10).
pieceValue(_, [7, 8, bishop, black], -10).
pieceValue(_, [8, 8, bishop, black], -20).

pieceValue(_, [1, 7, bishop, black], -10).
pieceValue(_, [2, 7, bishop, black], 5).
pieceValue(_, [3, 7, bishop, black], 0).
pieceValue(_, [4, 7, bishop, black], 0).
pieceValue(_, [5, 7, bishop, black], 0).
pieceValue(_, [6, 7, bishop, black], 0).
pieceValue(_, [7, 7, bishop, black], 5).
pieceValue(_, [8, 7, bishop, black], -10).

pieceValue(_, [1, 6, bishop, black], -10).
pieceValue(_, [2, 6, bishop, black], 10).
pieceValue(_, [3, 6, bishop, black], 10).
pieceValue(_, [4, 6, bishop, black], 10).
pieceValue(_, [5, 6, bishop, black], 10).
pieceValue(_, [6, 6, bishop, black], 10).
pieceValue(_, [7, 6, bishop, black], 10).
pieceValue(_, [8, 6, bishop, black], -10).

pieceValue(_, [1, 5, bishop, black], -10).
pieceValue(_, [2, 5, bishop, black], 0).
pieceValue(_, [3, 5, bishop, black], 10).
pieceValue(_, [4, 5, bishop, black], 10).
pieceValue(_, [5, 5, bishop, black], 10).
pieceValue(_, [6, 5, bishop, black], 10).
pieceValue(_, [7, 5, bishop, black], 0).
pieceValue(_, [8, 5, bishop, black], -10).

pieceValue(_, [1, 4, bishop, black], -10).
pieceValue(_, [2, 4, bishop, black], 5).
pieceValue(_, [3, 4, bishop, black], 5).
pieceValue(_, [4, 4, bishop, black], 10).
pieceValue(_, [5, 4, bishop, black], 10).
pieceValue(_, [6, 4, bishop, black], 5).
pieceValue(_, [7, 4, bishop, black], 5).
pieceValue(_, [8, 4, bishop, black], -10).

pieceValue(_, [1, 3, bishop, black], -10).
pieceValue(_, [2, 3, bishop, black], 0).
pieceValue(_, [3, 3, bishop, black], 5).
pieceValue(_, [4, 3, bishop, black], 10).
pieceValue(_, [5, 3, bishop, black], 10).
pieceValue(_, [6, 3, bishop, black], 5).
pieceValue(_, [7, 3, bishop, black], 0).
pieceValue(_, [8, 3, bishop, black], -10).

pieceValue(_, [1, 2, bishop, black], -10).
pieceValue(_, [2, 2, bishop, black], 0).
pieceValue(_, [3, 2, bishop, black], 0).
pieceValue(_, [4, 2, bishop, black], 0).
pieceValue(_, [5, 2, bishop, black], 0).
pieceValue(_, [6, 2, bishop, black], 0).
pieceValue(_, [7, 2, bishop, black], 0).
pieceValue(_, [8, 2, bishop, black], -10).

pieceValue(_, [1, 1, bishop, black], -20).
pieceValue(_, [2, 1, bishop, black], -10).
pieceValue(_, [3, 1, bishop, black], -10).
pieceValue(_, [4, 1, bishop, black], -10).
pieceValue(_, [5, 1, bishop, black], -10).
pieceValue(_, [6, 1, bishop, black], -10).
pieceValue(_, [7, 1, bishop, black], -10).
pieceValue(_, [8, 1, bishop, black], -20).


% positional piece values for black queen
pieceValue(_, [1, 8, queen, black], -20).
pieceValue(_, [2, 8, queen, black], -10).
pieceValue(_, [3, 8, queen, black], -10).
pieceValue(_, [4, 8, queen, black], -5).
pieceValue(_, [5, 8, queen, black], -5).
pieceValue(_, [6, 8, queen, black], -10).
pieceValue(_, [7, 8, queen, black], -10).
pieceValue(_, [8, 8, queen, black], -20).

pieceValue(_, [1, 7, queen, black], -10).
pieceValue(_, [2, 7, queen, black], 0).
pieceValue(_, [3, 7, queen, black], 5).
pieceValue(_, [4, 7, queen, black], 0).
pieceValue(_, [5, 7, queen, black], 0).
pieceValue(_, [6, 7, queen, black], 0).
pieceValue(_, [7, 7, queen, black], 0).
pieceValue(_, [8, 7, queen, black], -10).

pieceValue(_, [1, 6, queen, black], -10).
pieceValue(_, [2, 6, queen, black], 5).
pieceValue(_, [3, 6, queen, black], 5).
pieceValue(_, [4, 6, queen, black], 5).
pieceValue(_, [5, 6, queen, black], 5).
pieceValue(_, [6, 6, queen, black], 5).
pieceValue(_, [7, 6, queen, black], 0).
pieceValue(_, [8, 6, queen, black], -10).

pieceValue(_, [1, 5, queen, black], 0).
pieceValue(_, [2, 5, queen, black], 0).
pieceValue(_, [3, 5, queen, black], 5).
pieceValue(_, [4, 5, queen, black], 5).
pieceValue(_, [5, 5, queen, black], 5).
pieceValue(_, [6, 5, queen, black], 5).
pieceValue(_, [7, 5, queen, black], 0).
pieceValue(_, [8, 5, queen, black], -5).

pieceValue(_, [1, 4, queen, black], -5).
pieceValue(_, [2, 4, queen, black], 0).
pieceValue(_, [3, 4, queen, black], 5).
pieceValue(_, [4, 4, queen, black], 5).
pieceValue(_, [5, 4, queen, black], 5).
pieceValue(_, [6, 4, queen, black], 5).
pieceValue(_, [7, 4, queen, black], 0).
pieceValue(_, [8, 4, queen, black], -5).

pieceValue(_, [1, 3, queen, black], -10).
pieceValue(_, [2, 3, queen, black], 0).
pieceValue(_, [3, 3, queen, black], 5).
pieceValue(_, [4, 3, queen, black], 5).
pieceValue(_, [5, 3, queen, black], 5).
pieceValue(_, [6, 3, queen, black], 5).
pieceValue(_, [7, 3, queen, black], 0).
pieceValue(_, [8, 3, queen, black], -10).

pieceValue(_, [1, 2, queen, black], -10).
pieceValue(_, [2, 2, queen, black], 0).
pieceValue(_, [3, 2, queen, black], 0).
pieceValue(_, [4, 2, queen, black], 0).
pieceValue(_, [5, 2, queen, black], 0).
pieceValue(_, [6, 2, queen, black], 0).
pieceValue(_, [7, 2, queen, black], 0).
pieceValue(_, [8, 2, queen, black], -10).

pieceValue(_, [1, 1, queen, black], -20).
pieceValue(_, [2, 1, queen, black], -10).
pieceValue(_, [3, 1, queen, black], -10).
pieceValue(_, [4, 1, queen, black], -5).
pieceValue(_, [5, 1, queen, black], -5).
pieceValue(_, [6, 1, queen, black], -10).
pieceValue(_, [7, 1, queen, black], -10).
pieceValue(_, [8, 1, queen, black], -20).


% positional piece values for black king in midgame
pieceValue(_, [1, 8, king, black], 20).
pieceValue(_, [2, 8, king, black], 30).
pieceValue(_, [3, 8, king, black], 10).
pieceValue(_, [4, 8, king, black], 0).
pieceValue(_, [5, 8, king, black], 0).
pieceValue(_, [6, 8, king, black], 10).
pieceValue(_, [7, 8, king, black], 30).
pieceValue(_, [8, 8, king, black], 20).

pieceValue(_, [1, 7, king, black], 20).
pieceValue(_, [2, 7, king, black], 20).
pieceValue(_, [3, 7, king, black], 0).
pieceValue(_, [4, 7, king, black], 0).
pieceValue(_, [5, 7, king, black], 0).
pieceValue(_, [6, 7, king, black], 0).
pieceValue(_, [7, 7, king, black], 20).
pieceValue(_, [8, 7, king, black], 20).

pieceValue(_, [1, 6, king, black], -10).
pieceValue(_, [2, 6, king, black], -20).
pieceValue(_, [3, 6, king, black], -20).
pieceValue(_, [4, 6, king, black], -20).
pieceValue(_, [5, 6, king, black], -20).
pieceValue(_, [6, 6, king, black], -20).
pieceValue(_, [7, 6, king, black], -20).
pieceValue(_, [8, 6, king, black], -10).

pieceValue(_, [1, 5, king, black], -20).
pieceValue(_, [2, 5, king, black], -30).
pieceValue(_, [3, 5, king, black], -30).
pieceValue(_, [4, 5, king, black], -40).
pieceValue(_, [5, 5, king, black], -40).
pieceValue(_, [6, 5, king, black], -30).
pieceValue(_, [7, 5, king, black], -30).
pieceValue(_, [8, 5, king, black], -20).

pieceValue(_, [1, 4, king, black], -30).
pieceValue(_, [2, 4, king, black], -40).
pieceValue(_, [3, 4, king, black], -40).
pieceValue(_, [4, 4, king, black], -50).
pieceValue(_, [5, 4, king, black], -50).
pieceValue(_, [6, 4, king, black], -40).
pieceValue(_, [7, 4, king, black], -40).
pieceValue(_, [8, 4, king, black], -30).

pieceValue(_, [1, 3, king, black], -30).
pieceValue(_, [2, 3, king, black], -40).
pieceValue(_, [3, 3, king, black], -40).
pieceValue(_, [4, 3, king, black], -50).
pieceValue(_, [5, 3, king, black], -50).
pieceValue(_, [6, 3, king, black], -40).
pieceValue(_, [7, 3, king, black], -40).
pieceValue(_, [8, 3, king, black], -30).

pieceValue(_, [1, 2, king, black], -30).
pieceValue(_, [2, 2, king, black], -40).
pieceValue(_, [3, 2, king, black], -40).
pieceValue(_, [4, 2, king, black], -50).
pieceValue(_, [5, 2, king, black], -50).
pieceValue(_, [6, 2, king, black], -40).
pieceValue(_, [7, 2, king, black], -40).
pieceValue(_, [8, 2, king, black], -30).

pieceValue(_, [1, 1, king, black], -30).
pieceValue(_, [2, 1, king, black], -40).
pieceValue(_, [3, 1, king, black], -40).
pieceValue(_, [4, 1, king, black], -50).
pieceValue(_, [5, 1, king, black], -50).
pieceValue(_, [6, 1, king, black], -40).
pieceValue(_, [7, 1, king, black], -40).
pieceValue(_, [8, 1, king, black], -30).


% positional piece values for black rook
pieceValue(_, [1, 8, rook, black], 0).
pieceValue(_, [2, 8, rook, black], 0).
pieceValue(_, [3, 8, rook, black], 0).
pieceValue(_, [4, 8, rook, black], 5).
pieceValue(_, [5, 8, rook, black], 5).
pieceValue(_, [6, 8, rook, black], 0).
pieceValue(_, [7, 8, rook, black], 0).
pieceValue(_, [8, 8, rook, black], 0).

pieceValue(_, [1, 7, rook, black], -5).
pieceValue(_, [2, 7, rook, black], 0).
pieceValue(_, [3, 7, rook, black], 0).
pieceValue(_, [4, 7, rook, black], 0).
pieceValue(_, [5, 7, rook, black], 0).
pieceValue(_, [6, 7, rook, black], 0).
pieceValue(_, [7, 7, rook, black], 0).
pieceValue(_, [8, 7, rook, black], -5).

pieceValue(_, [1, 6, rook, black], -5).
pieceValue(_, [2, 6, rook, black], 0).
pieceValue(_, [3, 6, rook, black], 0).
pieceValue(_, [4, 6, rook, black], 0).
pieceValue(_, [5, 6, rook, black], 0).
pieceValue(_, [6, 6, rook, black], 0).
pieceValue(_, [7, 6, rook, black], 0).
pieceValue(_, [8, 6, rook, black], -5).

pieceValue(_, [1, 5, rook, black], -5).
pieceValue(_, [2, 5, rook, black], 0).
pieceValue(_, [3, 5, rook, black], 0).
pieceValue(_, [4, 5, rook, black], 0).
pieceValue(_, [5, 5, rook, black], 0).
pieceValue(_, [6, 5, rook, black], 0).
pieceValue(_, [7, 5, rook, black], 0).
pieceValue(_, [8, 5, rook, black], -5).

pieceValue(_, [1, 4, rook, black], -5).
pieceValue(_, [2, 4, rook, black], 0).
pieceValue(_, [3, 4, rook, black], 0).
pieceValue(_, [4, 4, rook, black], 0).
pieceValue(_, [5, 4, rook, black], 0).
pieceValue(_, [6, 4, rook, black], 0).
pieceValue(_, [7, 4, rook, black], 0).
pieceValue(_, [8, 4, rook, black], -5).

pieceValue(_, [1, 3, rook, black], -5).
pieceValue(_, [2, 3, rook, black], 0).
pieceValue(_, [3, 3, rook, black], 0).
pieceValue(_, [4, 3, rook, black], 0).
pieceValue(_, [5, 3, rook, black], 0).
pieceValue(_, [6, 3, rook, black], 0).
pieceValue(_, [7, 3, rook, black], 0).
pieceValue(_, [8, 3, rook, black], -5).

pieceValue(_, [1, 2, rook, black], 5).
pieceValue(_, [2, 2, rook, black], 10).
pieceValue(_, [3, 2, rook, black], 10).
pieceValue(_, [4, 2, rook, black], 10).
pieceValue(_, [5, 2, rook, black], 10).
pieceValue(_, [6, 2, rook, black], 10).
pieceValue(_, [7, 2, rook, black], 10).
pieceValue(_, [8, 2, rook, black], 5).

pieceValue(_, [1, 1, rook, black], 0).
pieceValue(_, [2, 1, rook, black], 0).
pieceValue(_, [3, 1, rook, black], 0).
pieceValue(_, [4, 1, rook, black], 0).
pieceValue(_, [5, 1, rook, black], 0).
pieceValue(_, [6, 1, rook, black], 0).
pieceValue(_, [7, 1, rook, black], 0).
pieceValue(_, [8, 1, rook, black], 0).


% positional piece values for white king in end game
pieceValueEnd(_, [1, 8, king, white], 50).
pieceValueEnd(_, [2, 8, king, white], 40).
pieceValueEnd(_, [3, 8, king, white], 30).
pieceValueEnd(_, [4, 8, king, white], 20).
pieceValueEnd(_, [5, 8, king, white], 20).
pieceValueEnd(_, [6, 8, king, white], 30).
pieceValueEnd(_, [7, 8, king, white], 40).
pieceValueEnd(_, [8, 8, king, white], 50).

pieceValueEnd(_, [1, 7, king, white], 30).
pieceValueEnd(_, [2, 7, king, white], 20).
pieceValueEnd(_, [3, 7, king, white], 10).
pieceValueEnd(_, [4, 7, king, white], 0).
pieceValueEnd(_, [5, 7, king, white], 0).
pieceValueEnd(_, [6, 7, king, white], 10).
pieceValueEnd(_, [7, 7, king, white], 20).
pieceValueEnd(_, [8, 7, king, white], 30).

pieceValueEnd(_, [1, 6, king, white], 30).
pieceValueEnd(_, [2, 6, king, white], 10).
pieceValueEnd(_, [3, 6, king, white], -20).
pieceValueEnd(_, [4, 6, king, white], -30).
pieceValueEnd(_, [5, 6, king, white], -30).
pieceValueEnd(_, [6, 6, king, white], -20).
pieceValueEnd(_, [7, 6, king, white], 10).
pieceValueEnd(_, [8, 6, king, white], 30).

pieceValueEnd(_, [1, 5, king, white], 30).
pieceValueEnd(_, [2, 5, king, white], 10).
pieceValueEnd(_, [3, 5, king, white], -30).
pieceValueEnd(_, [4, 5, king, white], -40).
pieceValueEnd(_, [5, 5, king, white], -40).
pieceValueEnd(_, [6, 5, king, white], -30).
pieceValueEnd(_, [7, 5, king, white], 10).
pieceValueEnd(_, [8, 5, king, white], 30).

pieceValueEnd(_, [1, 4, king, white], 30).
pieceValueEnd(_, [2, 4, king, white], 10).
pieceValueEnd(_, [3, 4, king, white], -30).
pieceValueEnd(_, [4, 4, king, white], -40).
pieceValueEnd(_, [5, 4, king, white], -40).
pieceValueEnd(_, [6, 4, king, white], -30).
pieceValueEnd(_, [7, 4, king, white], 10).
pieceValueEnd(_, [8, 4, king, white], 30).

pieceValueEnd(_, [1, 3, king, white], 30).
pieceValueEnd(_, [2, 3, king, white], 10).
pieceValueEnd(_, [3, 3, king, white], -20).
pieceValueEnd(_, [4, 3, king, white], -30).
pieceValueEnd(_, [5, 3, king, white], -30).
pieceValueEnd(_, [6, 3, king, white], -20).
pieceValueEnd(_, [7, 3, king, white], 10).
pieceValueEnd(_, [8, 3, king, white], 30).

pieceValueEnd(_, [1, 2, king, white], 30).
pieceValueEnd(_, [2, 2, king, white], 30).
pieceValueEnd(_, [3, 2, king, white], 0).
pieceValueEnd(_, [4, 2, king, white], 0).
pieceValueEnd(_, [5, 2, king, white], 0).
pieceValueEnd(_, [6, 2, king, white], 0).
pieceValueEnd(_, [7, 2, king, white], 30).
pieceValueEnd(_, [8, 2, king, white], 30).

pieceValueEnd(_, [1, 1, king, white], 50).
pieceValueEnd(_, [2, 1, king, white], 30).
pieceValueEnd(_, [3, 1, king, white], 30).
pieceValueEnd(_, [4, 1, king, white], 30).
pieceValueEnd(_, [5, 1, king, white], 30).
pieceValueEnd(_, [6, 1, king, white], 30).
pieceValueEnd(_, [7, 1, king, white], 30).
pieceValueEnd(_, [8, 1, king, white], 50).


% positional piece values for black king in endgame
pieceValueEnd(_, [1, 8, king, black], -50).
pieceValueEnd(_, [2, 8, king, black], -30).
pieceValueEnd(_, [3, 8, king, black], -30).
pieceValueEnd(_, [4, 8, king, black], -30).
pieceValueEnd(_, [5, 8, king, black], -30).
pieceValueEnd(_, [6, 8, king, black], -30).
pieceValueEnd(_, [7, 8, king, black], -30).
pieceValueEnd(_, [8, 8, king, black], -50).

pieceValueEnd(_, [1, 7, king, black], -30).
pieceValueEnd(_, [2, 7, king, black], -30).
pieceValueEnd(_, [3, 7, king, black], 0).
pieceValueEnd(_, [4, 7, king, black], 0).
pieceValueEnd(_, [5, 7, king, black], 0).
pieceValueEnd(_, [6, 7, king, black], 0).
pieceValueEnd(_, [7, 7, king, black], -30).
pieceValueEnd(_, [8, 7, king, black], -30).

pieceValueEnd(_, [1, 6, king, black], -30).
pieceValueEnd(_, [2, 6, king, black], -10).
pieceValueEnd(_, [3, 6, king, black], 20).
pieceValueEnd(_, [4, 6, king, black], 30).
pieceValueEnd(_, [5, 6, king, black], 30).
pieceValueEnd(_, [6, 6, king, black], 20).
pieceValueEnd(_, [7, 6, king, black], -10).
pieceValueEnd(_, [8, 6, king, black], -30).

pieceValueEnd(_, [1, 5, king, black], -30).
pieceValueEnd(_, [2, 5, king, black], -10).
pieceValueEnd(_, [3, 5, king, black], 30).
pieceValueEnd(_, [4, 5, king, black], 40).
pieceValueEnd(_, [5, 5, king, black], 40).
pieceValueEnd(_, [6, 5, king, black], 30).
pieceValueEnd(_, [7, 5, king, black], -10).
pieceValueEnd(_, [8, 5, king, black], -30).

pieceValueEnd(_, [1, 4, king, black], -30).
pieceValueEnd(_, [2, 4, king, black], -10).
pieceValueEnd(_, [3, 4, king, black], 30).
pieceValueEnd(_, [4, 4, king, black], 40).
pieceValueEnd(_, [5, 4, king, black], 40).
pieceValueEnd(_, [6, 4, king, black], 30).
pieceValueEnd(_, [7, 4, king, black], -10).
pieceValueEnd(_, [8, 4, king, black], -30).

pieceValueEnd(_, [1, 3, king, black], -30).
pieceValueEnd(_, [2, 3, king, black], -10).
pieceValueEnd(_, [3, 3, king, black], 20).
pieceValueEnd(_, [4, 3, king, black], 30).
pieceValueEnd(_, [5, 3, king, black], 30).
pieceValueEnd(_, [6, 3, king, black], 20).
pieceValueEnd(_, [7, 3, king, black], -10).
pieceValueEnd(_, [8, 3, king, black], -30).

pieceValueEnd(_, [1, 2, king, black], -30).
pieceValueEnd(_, [2, 2, king, black], -20).
pieceValueEnd(_, [3, 2, king, black], -10).
pieceValueEnd(_, [4, 2, king, black], 0).
pieceValueEnd(_, [5, 2, king, black], 0).
pieceValueEnd(_, [6, 2, king, black], -10).
pieceValueEnd(_, [7, 2, king, black], -20).
pieceValueEnd(_, [8, 2, king, black], -30).

pieceValueEnd(_, [1, 1, king, black], -50).
pieceValueEnd(_, [2, 1, king, black], -40).
pieceValueEnd(_, [3, 1, king, black], -30).
pieceValueEnd(_, [4, 1, king, black], -20).
pieceValueEnd(_, [5, 1, king, black], -20).
pieceValueEnd(_, [6, 1, king, black], -30).
pieceValueEnd(_, [7, 1, king, black], -40).
pieceValueEnd(_, [8, 1, king, black], -50).
