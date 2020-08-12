% What are we trying to achive?
%   A chess AI, that is at least somewhat competent
%
% How are we going to achive it?
%   Writing the game and AI in Prolog
%   For the AI maybe using MiniMax with Alpha Beta Pruning
%
% Why?
%   To learn how to write AI (in particular MiniMax) in Prolog
%
%
%
% Learing Prolog AI-Programming using Tic Tac Toe
%
% Loosely based on
% https://courses.cs.washington.edu/courses/cse341/03sp/slides/PrologEx/tictactoe.pl.txt
%
% The minimax algorithm help us to fine the best move from a created search 
%	tree. To a given deepth the recursive tree of all possive move is search and the 
%	position is evaluated at the ending leaves of the tree.
%	
%	we try to either minimise or maximize the outcome at eah level by returning 
%	either the smallest or the largest value of the child to the parent node.
%	(Minimax).
%
%
% To start a game type
% start.

% Defining win / draw states
win(Board, Player) :- rowwin(Board, Player).
win(Board, Player) :- colwin(Board, Player).
win(Board, Player) :- diawin(Board, Player).
draw(Board) :-
    aggregate_all(count, member('O', Board), CountO),
    aggregate_all(count, member('X', Board), CountX),
    Count is CountX + CountO,
    Count >= 9.

rowwin(Board, Player) :- Board = [Player, Player, Player, _, _, _, _, _, _].
rowwin(Board, Player) :- Board = [_, _, _, Player, Player, Player, _, _, _].
rowwin(Board, Player) :- Board = [_, _, _, _, _, _, Player, Player, Player].

colwin(Board, Player) :- Board = [Player, _, _, Player, _, _, Player, _, _].
colwin(Board, Player) :- Board = [_, Player, _, _, Player, _, _, Player, _].
colwin(Board, Player) :- Board = [_, _, Player, _, _, Player, _, _, Player].

diawin(Board, Player) :- Board = [Player, _, _, _, Player, _, _, _, Player].
diawin(Board, Player) :- Board = [_, _, Player, _, Player, _, Player, _, _].

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

% Non-existent com, as he does nothing at all
% comMove(Board, Newboard) :- Newboard = Board.

% Most simple com, as he takes the next open spot
comMove([1,B,C,D,E,F,G,H,I], ['O',B,C,D,E,F,G,H,I]).
comMove([A,2,C,D,E,F,G,H,I], [A,'O',C,D,E,F,G,H,I]).
comMove([A,B,3,D,E,F,G,H,I], [A,B,'O',D,E,F,G,H,I]).
comMove([A,B,C,4,E,F,G,H,I], [A,B,C,'O',E,F,G,H,I]).
comMove([A,B,C,D,5,F,G,H,I], [A,B,C,D,'O',F,G,H,I]).
comMove([A,B,C,D,E,6,G,H,I], [A,B,C,D,E,'O',G,H,I]).
comMove([A,B,C,D,E,F,7,H,I], [A,B,C,D,E,F,'O',H,I]).
comMove([A,B,C,D,E,F,G,8,I], [A,B,C,D,E,F,G,'O',I]).
comMove([A,B,C,D,E,F,G,H,9], [A,B,C,D,E,F,G,H,'O']).

% ***MiniMax*** com, NOT AVAILABLE YET
% this is the most difficult
% but also most imortant part for our chess AI

start :- write('To play an X, tswiype the number you wish to place and .'),nl,nl,
    Board = [1, 2, 3, 4, 5, 6, 7, 8, 9],
    showBoard(Board),
    playX(Board).

showBoard([A,B,C,D,E,F,G,H,I]) :- write([A,B,C]), nl,write([D,E,F]),nl,write([G,H,I]),nl,nl.

playX(Board) :- win(Board, 'O'), write('Computer O wins!').
playX(Board) :- draw(Board), write('The game is a draw!').
playX(Board) :-
    read(N),
    move('X', Board, N, Newboard),nl,
    showBoard(Newboard),
    playO(Newboard).

playO(Board) :- win(Board, 'X'), write('Player X wins!').
playO(Board) :- draw(Board), write('The game is a draw!').
playO(Board) :-
    comMove(Board, Newboard),
    showBoard(Newboard),
    playX(Newboard).
