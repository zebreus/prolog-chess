% What are we trying to achive?
%   A chess AI, that is at least somewhat competent
%
% Learing Prolog AI-Programming using Tic Tac Toe
%
% Based on https://courses.cs.washington.edu/courses/cse341/03sp/slides/PrologEx/tictactoe.pl.txt
% and      https://github.com/jaunerc/minimax-prolog/blob/master/minimax.pl
%
% To start a game type
start :- write('To play an X, type the number you wish to place and .'),nl,nl,
    Board = [1, 2, 3, 4, 5, 6, 7, 8, 9],
    showBoard(Board),
    play('X', Board).

% Defining win / draw states
draw(Board) :-
    aggregate_all(count, member('O', Board), CountO),
    aggregate_all(count, member('X', Board), CountX),
    Count is CountX + CountO,
    Count >= 9.
% Row
win(Board, Player) :- Board = [Player, Player, Player, _, _, _, _, _, _].
win(Board, Player) :- Board = [_, _, _, Player, Player, Player, _, _, _].
win(Board, Player) :- Board = [_, _, _, _, _, _, Player, Player, Player].
% Column
win(Board, Player) :- Board = [Player, _, _, Player, _, _, Player, _, _].
win(Board, Player) :- Board = [_, Player, _, _, Player, _, _, Player, _].
win(Board, Player) :- Board = [_, _, Player, _, _, Player, _, _, Player].
% Diagonal
win(Board, Player) :- Board = [Player, _, _, _, Player, _, _, _, Player].
win(Board, Player) :- Board = [_, _, Player, _, Player, _, Player, _, _].

move(Player, [N,B,C,D,E,F,G,H,I], N, [Player,B,C,D,E,F,G,H,I]).
move(Player, [A,N,C,D,E,F,G,H,I], N, [A,Player,C,D,E,F,G,H,I]).
move(Player, [A,B,N,D,E,F,G,H,I], N, [A,B,Player,D,E,F,G,H,I]).
move(Player, [A,B,C,N,E,F,G,H,I], N, [A,B,C,Player,E,F,G,H,I]).
move(Player, [A,B,C,D,N,F,G,H,I], N, [A,B,C,D,Player,F,G,H,I]).
move(Player, [A,B,C,D,E,N,G,H,I], N, [A,B,C,D,E,Player,G,H,I]).
move(Player, [A,B,C,D,E,F,N,H,I], N, [A,B,C,D,E,F,Player,H,I]).
move(Player, [A,B,C,D,E,F,G,N,I], N, [A,B,C,D,E,F,G,Player,I]).
move(Player, [A,B,C,D,E,F,G,H,N], N, [A,B,C,D,E,F,G,H,Player]).
move(Player, Board, _, Newboard) :- write('Illegal move.'),nl,
                                    read(N),move(Player, Board, N, Newboard).

possibleMove([1,B,C,D,E,F,G,H,I], [Player,B,C,D,E,F,G,H,I], Player).
possibleMove([A,2,C,D,E,F,G,H,I], [A,Player,C,D,E,F,G,H,I], Player).
possibleMove([A,B,3,D,E,F,G,H,I], [A,B,Player,D,E,F,G,H,I], Player).
possibleMove([A,B,C,4,E,F,G,H,I], [A,B,C,Player,E,F,G,H,I], Player).
possibleMove([A,B,C,D,5,F,G,H,I], [A,B,C,D,Player,F,G,H,I], Player).
possibleMove([A,B,C,D,E,6,G,H,I], [A,B,C,D,E,Player,G,H,I], Player).
possibleMove([A,B,C,D,E,F,7,H,I], [A,B,C,D,E,F,Player,H,I], Player).
possibleMove([A,B,C,D,E,F,G,8,I], [A,B,C,D,E,F,G,Player,I], Player).
possibleMove([A,B,C,D,E,F,G,H,9], [A,B,C,D,E,F,G,H,Player], Player).

showBoard([A,B,C,D,E,F,G,H,I]) :- write([A,B,C]), nl,write([D,E,F]),nl,write([G,H,I]),nl,nl.

%Play a turn
play(_, Board) :- draw(Board), write('The game is a draw!').
play('X', Board) :- win(Board, 'O'), write('Computer O wins!').
play('O', Board) :- win(Board, 'X'), write('Player X wins!').
play('X', Board) :-
    read(N),
    move('X', Board, N, Newboard),
    nl,
    showBoard(Newboard),
    play('O', Newboard).
play('O', Board) :-
    startMinMax(Board, Newboard),
    showBoard(Newboard),
    play('X', Newboard).

startMinMax(Board, BestBoard) :-
  findall(X, possibleMove(Board, X, 'O'), AvailableBoards),
  minMaxAlg(max, AvailableBoards, BestBoard, _).

% evalBoard(+Board, -Value)
evalBoard([], 0).
evalBoard(Board, Value) :-
  win(Board, 'O'),
  Value is 1.
evalBoard(Board, Value) :-
  win(Board, 'X'),
  Value is -1.
evalBoard(Board, Value) :-
  draw(Board),
  Value is 0.

%compareBoard(+MinMax, +BoardA, +ValueA, +BoardB, +ValueB, -BetterBoard, -BetterValue)
compareBoard(max, BoardA, ValueA, _, ValueB, BoardA, ValueA) :-
  ValueB =< ValueA.
compareBoard(max, _, ValueA, BoardB, ValueB, BoardB, ValueB) :-
  ValueB > ValueA.
compareBoard(min, BoardA, ValueA, _, ValueB, BoardA, ValueA) :-
  ValueB >= ValueA.
compareBoard(min, _, ValueA, BoardB, ValueB, BoardB, ValueB) :-
  ValueB < ValueA.

% Chooses best move
% minMaxAlg(+MinMax, +AllBoards, -BestBoard, -BestValue)
minMaxAlg(min, [], [], 2).
minMaxAlg(max, [], [], -2).
minMaxAlg(MinMax, [FirstBoard | RestBoards], BestBoard, BestValue) :-
  evalBoard(FirstBoard, Value),
  minMaxAlg(MinMax, RestBoards, OtherBestBoard, OtherBestValue),
  compareBoard(MinMax, FirstBoard, Value, OtherBestBoard, OtherBestValue, BestBoard, BestValue).

minMaxAlg(MinMax, [FirstBoard | RestBoards], BestBoard, BestValue) :-
  minMaxAlg(MinMax, RestBoards, NeighbourBestBoard, NeighbourBestValue),
  swapMinMax(MinMax,SwappedMinMax),
  translatePlayer(SwappedMinMax, Player),
  findall(X, possibleMove(FirstBoard, X, Player), AvailableBoards),
  minMaxAlg(SwappedMinMax, AvailableBoards, _, OtherBestValue),
  compareBoard(MinMax, NeighbourBestBoard, NeighbourBestValue, FirstBoard, OtherBestValue, BestBoard, BestValue).

% swapMinMax(+MinOrMax, TheOther)
% Changes the MinMax atom.
swapMinMax(max, min).
swapMinMax(min, max).

translatePlayer(min, 'X').
translatePlayer(max, 'O').
