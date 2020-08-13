
%bauer([_,_,_,_, _,_,_,_ ,_,_,_,_ ,X])
testCol(Position) :-
  move([ [4,5,pawn,white], [4,7,pawn,black] ], [4,6,pawn,white], Position).



% move(AllPieces, Piece, Position)
move(AllPieces, [CurrentX, CurrentY, pawn, white], [X, Y]) :-
  X is CurrentX,
  Y is CurrentY+1,
  Y =< 8,
  canMoveTo(AllPieces, black, [X,Y]).

% canMoveTo(+AllPieces, +Color, +Position)
canMoveTo(AllPieces, Color, Position) :-
  collision(AllPieces, Position, CollisionPiece),
  canMoveTo(CollisionPiece, Color).
canMoveTo(CollisionPiece, _) :-
  CollisionPiece = [], !.
canMoveTo(CollisionPiece, Color) :-
  CollisionPiece = [_,_,_,Color].

% collision(+AllPieces, +Position, -Piece)
collision([], _, []) :- !.
collision([ThisPiece | Rest], [X,Y], Piece) :-
  ThisPiece = [ThisX | [ThisY|_] ],
  ThisX = X,
  ThisY = Y,
  Piece = ThisPiece;
  collision(Rest,[X,Y],Piece).


% input(-XStart, -YStart, -XEnd, -YEnd)
input(XStart, YStart, XEnd, YEnd) :-
  write('Please enter your next move [Format: "A2,A4".]:'), nl,
  read(Input),
  string_codes(Input, [InputXS|[InputYS|[_|[InputXE|[InputYE|_]]]]]),
  XStart is InputXS - 64, XEnd is InputXE - 64,
  YStart is InputYS - 48, YEnd is InputYE - 48.
  % write(XStart),write("|"),write(YStart),nl,write(XEnd),write("|"),write(YEnd).
