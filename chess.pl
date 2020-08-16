% otherColor(+ColorA, +ColorB)
otherColor(black, white).
otherColor(white, black).
otherColor(none, none).

% availableColors(-Color)
% All available colors, atm just used for test cases
availableColors(black).
availableColors(white).

% availablePiece(-Piece)
% all available pieces, atm just used for test cases
availablePiece(king).
availablePiece(queen).
availablePiece(rook).
availablePiece(bishop).
availablePiece(knight).
availablePiece(pawn).

% inBounds(+Position)
inBounds([X,Y]) :-
  X > 0,
  Y > 0,
  X < 9,
  Y < 9.

% getDirection(+Color, -Direction)
getDirection(white, 1).
getDirection(black, -1).

% move(AllPieces, Piece, Position)

move(AllPieces, [CurrentX, CurrentY, pawn, Color], [X, Y]) :-
  getDirection(Color, Direction),
  Y is CurrentY+Direction,
  inBounds([CurrentX, Y]), % X should not be able to go oob, because there should be a piece to beat there
  (
    X is CurrentX,
    canMoveTo(AllPieces, none, [X,Y]),
    !;
    otherColor(Color, OtherColor),
    (
      X is CurrentX+1, !;
      X is CurrentX-1
    ),
    collision(AllPieces, [X,Y], [X,Y,_,OtherColor])
  ),
  !.

move(AllPieces, [CurrentX, CurrentY, king, Color], [X, Y]) :-
  otherColor(Color, OtherColor),
  (
    between(-1,1,XMod),
    X is CurrentX + XMod,
    (
      Y is CurrentY + 1;
      Y is CurrentY - 1
    );
    Y is CurrentY,
    (
      X is CurrentX + 1;
      X is CurrentX - 1
    )
  ),
  inBounds([X,Y]),
  canMoveTo(AllPieces, OtherColor, [X,Y]),
  !.

move(AllPieces, [CurrentX, CurrentY, knight, Color], [X,Y]) :-
  otherColor(Color, OtherColor),
  (
    (
      X is CurrentX + 2;
      X is CurrentX - 2
    ),
    (
      Y is CurrentY + 1;
      Y is CurrentY - 1
    );
    (
      X is CurrentX + 1;
      X is CurrentX - 1
    ),
    (
      Y is CurrentY + 2;
      Y is CurrentY - 2
    )
  ),
  inBounds([X,Y]),
  canMoveTo(AllPieces, OtherColor, [X,Y]),
  !.

move(AllPieces, [CurrentX, CurrentY, bishop, Color], [X,Y]) :-
  otherColor(Color, OtherColor),
  between(1,7,Dist),
  (
    (
      X is CurrentX - Dist,
      Y is CurrentY - Dist
    );
    (
      X is CurrentX + Dist,
      Y is CurrentY + Dist
    );
    (
      X is CurrentX + Dist,
      Y is CurrentY - Dist
    );
    (
      X is CurrentX - Dist,
      Y is CurrentY + Dist
    )
  ),
  inBounds([X,Y]),
  canMoveTo(AllPieces, OtherColor, [X,Y]),
  !.

move(AllPieces, [CurrentX, CurrentY, queen, Color], [X,Y]) :-
  otherColor(Color, OtherColor),
  (
    between(1,7,Dist),
    (
      (
        X is CurrentX + Dist;
        X is CurrentX - Dist
      ),
      (
        Y is CurrentY
      );
      (
        Y is CurrentY + Dist;
        Y is CurrentY - Dist
      ),
      (
        X is CurrentX
      )
    );
    between(1,7,DistDiag),
    (
      (
        X is CurrentX - DistDiag,
        Y is CurrentY - DistDiag
      );
      (
        X is CurrentX + DistDiag,
        Y is CurrentY + DistDiag
      );
      (
        X is CurrentX + DistDiag,
        Y is CurrentY - DistDiag
      );
      (
        X is CurrentX - DistDiag,
        Y is CurrentY + DistDiag
      )
    )
  ),
  inBounds([X,Y]),
  canMoveTo(AllPieces, OtherColor, [X,Y]),
  !.

movePieceToPosition(AllPieces, OldX, OldY, Piece, Color, NewX, NewY, NewAllPieces) :-
  select([OldX, OldY, Piece, Color], AllPieces, ReducedAllPieces),
  NewPiece = [NewX, NewY, Piece, Color],
  NewAllPieces = [NewPiece | ReducedAllPieces],
  (
    otherColor(Color, OtherColor);
    otherColor(Color, OtherColor),
    select([OldX, OldY, _, OtherColor], AllPieces, ReducedAllPieces)
  ).

move(AllPieces, [CurrentX, CurrentY, rook, Color], [X,Y]) :-
  otherColor(Color, OtherColor),
  (
    between(1,8,X),
    X \= CurrentX,
    Y = CurrentY;
    between(1,8,Y),
    Y \= CurrentY,
    X = CurrentX
  ),
  nextPieceNorth(AllPieces, [CurrentX,CurrentY], [_, MaxY, _, _]),
  Y =< MaxY,
  nextPieceEast(AllPieces, [CurrentX,CurrentY], [MaxX, _, _, _]),
  X =< MaxX,
  nextPieceSouth(AllPieces, [CurrentX,CurrentY], [_, MinY, _, _]),
  Y >= MinY,
  nextPieceWest(AllPieces, [CurrentX,CurrentY], [MinX, _, _, _]),
  X >= MinX,
  canMoveTo(AllPieces, OtherColor, [X,Y]).

% pieceNorthOf(+AllPieces, +Position, -Piece)
% Checks if Piece is North of Position
pieceNorthOf(AllPieces, [X, Y], Piece) :-
  member(Piece, AllPieces),
  Piece = [X, CheckY, _, _],
  CheckY > Y,
  CheckY =< 9;
  Piece = [X,9,none,none].

pieceEastOf(AllPieces, [X, Y], Piece) :-
  member(Piece, AllPieces),
  Piece = [CheckX, Y, _, _],
  CheckX > X ,
  CheckX =< 9;
  Piece = [9,Y,none,none].

pieceSouthOf(AllPieces, [X, Y], Piece) :-
  member(Piece, AllPieces),
  Piece = [X, CheckY, _, _],
  CheckY < Y,
  CheckY >= 0;
  Piece = [X,0,none,none].

pieceWestOf(AllPieces, [X, Y], Piece) :-
  member(Piece, AllPieces),
  Piece = [CheckX, Y, _, _],
  CheckX < X,
  CheckX >= 0;
  Piece = [0,Y,none,none].

pieceNorthEastOf(AllPieces, [X, Y], Piece) :-
  Dist is min(8-X,8-Y),
  between(1, Dist, Offset),
  PX is X+Offset,
  PY is Y+Offset,
  member(Piece, AllPieces),
  Piece = [PX, PY, _, _];
  Dist is min(8-X,8-Y),
  LastX is X+Dist+1,
  LastY is Y+Dist+1,
  Piece = [LastX,LastY,none,none].

pieceSouthEastOf(AllPieces, [X, Y], Piece) :-
  Dist is min(8-X,Y-1),
  between(1, Dist, Offset),
  PX is X+Offset,
  PY is Y-Offset,
  member(Piece, AllPieces),
  Piece = [PX, PY, _, _];
  Dist is min(8-X,Y-1),
  LastX is X+Dist+1,
  LastY is Y-Dist-1,
  Piece = [LastX,LastY,none,none].

pieceSouthWestOf(AllPieces, [X, Y], Piece) :-
  Dist is min(X-1,Y-1),
  between(1, Dist, Offset),
  PX is X-Offset,
  PY is Y-Offset,
  member(Piece, AllPieces),
  Piece = [PX, PY, _, _];
  Dist is min(X-1,Y-1),
  LastX is X-Dist-1,
  LastY is Y-Dist-1,
  Piece = [LastX,LastY,none,none].

pieceNorthWestOf(AllPieces, [X, Y], Piece) :-
  Dist is min(X-1,8-Y),
  between(1, Dist, Offset),
  PX is X-Offset,
  PY is Y+Offset,
  member(Piece, AllPieces),
  Piece = [PX, PY, _, _];
  Dist is min(X-1,8-Y),
  LastX is X-Dist-1,
  LastY is Y+Dist+1,
  Piece = [LastX,LastY,none,none].

% nextPieceNorth(+AllPieces, +Position, -Piece)
% The closest piece north of the given position
nextPieceNorth(AllPieces, [X, Y], Piece) :-
  findall(C, pieceNorthOf(AllPieces, [X, Y], C), Pieces),
  sort(2, @<, Pieces, SortedPieces),
  SortedPieces = [Piece | _].

nextPieceEast(AllPieces, [X, Y], Piece) :-
  findall(C, pieceEastOf(AllPieces, [X, Y], C), Pieces),
  sort(1, @<, Pieces, SortedPieces),
  SortedPieces = [Piece | _].

nextPieceSouth(AllPieces, [X, Y], Piece) :-
  findall(C, pieceSouthOf(AllPieces, [X, Y], C), Pieces),
  sort(2, @>, Pieces, SortedPieces),
  SortedPieces = [Piece | _].

nextPieceWest(AllPieces, [X, Y], Piece) :-
  findall(C, pieceWestOf(AllPieces, [X, Y], C), Pieces),
  sort(1, @>, Pieces, SortedPieces),
  SortedPieces = [Piece | _].

nextPieceNorthEast(AllPieces, [X, Y], Piece) :-
  findall(C, pieceNorthEastOf(AllPieces, [X, Y], C), Pieces),
  sort(2, @<, Pieces, SortedPieces),
  SortedPieces = [Piece | _].

nextPieceSouthEast(AllPieces, [X, Y], Piece) :-
  findall(C, pieceSouthEastOf(AllPieces, [X, Y], C), Pieces),
  sort(2, @>, Pieces, SortedPieces),
  SortedPieces = [Piece | _].

nextPieceSouthWest(AllPieces, [X, Y], Piece) :-
  findall(C, pieceSouthWestOf(AllPieces, [X, Y], C), Pieces),
  sort(2, @>, Pieces, SortedPieces),
  SortedPieces = [Piece | _].

nextPieceNorthWest(AllPieces, [X, Y], Piece) :-
  findall(C, pieceNorthWestOf(AllPieces, [X, Y], C), Pieces),
  sort(2, @<, Pieces, SortedPieces),
  SortedPieces = [Piece | _].

% canMoveTo(+AllPieces, +Color, +Position)
% Checks if a piece can move to the given Position. Color speciefies a
% color that can be beaten by the moved piece
canMoveTo(AllPieces, Color, Position) :-
  collision(AllPieces, Position, CollisionPiece),
  !,
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
  Piece = ThisPiece, !;
  collision(Rest,[X,Y],Piece).

% input(-XStart, -YStart, -XEnd, -YEnd)
% Gets valid user input
input(XStart, YStart, XEnd, YEnd, Color) :-
  readInput(XStart, YStart, XEnd, YEnd, Color),
  checkInput(XStart, YStart, XEnd, YEnd), !.
input(XStart, YStart, XEnd, YEnd, Color) :-
  write('Invalid input, please check that you have the right format!'),nl,
  input(XStart, YStart, XEnd, YEnd, Color).

% readInput(-XStart, -YStart, -XEnd, -YEnd)
% Reads and parses the input from the user
readInput(XStart, YStart, XEnd, YEnd, Color) :-
  write('Please enter your next move for '),
  write(Color),
  write(' [Format: "A2,A4".]:'), nl,
  read(Input),
  string_codes(Input, [InputXS|[InputYS|[_|[InputXE|[InputYE|_]]]]]),
  XStart is InputXS - 64, XEnd is InputXE - 64,
  YStart is InputYS - 48, YEnd is InputYE - 48.
  %write(XStart),write("|"),write(YStart),nl,write(XEnd),write("|"),write(YEnd).

% checkInput(+XS, +YS, +XE, +YE)
% Ensures, that only valid numbers are used in the input
checkInput(XS, YS, XE, YE) :-
  XS >= 1, XS =< 8,
  YS >= 1, YS =< 8,
  XE >= 1, XE =< 8,
  YE >= 1, YE =< 8.

% printBoard(+AllPieces)
% Outputs the board in a formatted way
printBoard(AllPieces) :- nl,
  write('   _________________________________________________________'), nl,
  printBoardLines(AllPieces, 8),nl,
  write('      A      B      C      D      E      F      G      H'),nl,nl.

printBoardLines(_, 0) :- !.
printBoardLines(AllPieces, YCoord) :-
  write('   |      |      |      |      |      |      |      |      |'), nl,
  write(' '), write(YCoord), write(' |'), printBoardSquares(AllPieces, 1, YCoord), nl,
  write('   |______|______|______|______|______|______|______|______|'), nl,
  NewYCoord is YCoord - 1,
  printBoardLines(AllPieces, NewYCoord).

printBoardSquares(_, 9, _) :- !.
printBoardSquares(AllPieces, XCoord, YCoord) :-
  % This is horribly inefficent, as is goes through AllPieces for every sqare to
  % find if any one is matching, please correct this if you have ideas
  % Use something like member(X, [One])....
  findPieceOnSquare(AllPieces, XCoord, YCoord, Piece, Color),
  printPiece(Piece, Color),
  NewXCoord is XCoord + 1,
  printBoardSquares(AllPieces, NewXCoord, YCoord).

findPieceOnSquare([], _, _, no, piece) :- !.
findPieceOnSquare([[XCoord, YCoord, Piece, Color] | _], XCoord, YCoord, Piece, Color) :- !.
findPieceOnSquare([_ | RestPieces], XCoord, YCoord, Piece, Color) :-
  findPieceOnSquare(RestPieces, XCoord, YCoord, Piece, Color), !.

% printPiece(+Color, +Piece)
% Prints a piece
printPiece('no','piece') :- write('      |'), !.
printPiece(Piece, Color) :-
  printPieceColor(Color),
  printPieceKind(Piece),
  write('|').

% printPieceColor(+Color)
% Prints the color of a piece
printPieceColor(white) :- write(' w_'), !.
printPieceColor(black) :- write(' b_'), !.

% printPieceKind(+Piece)
% Prints the letter representing the piece
printPieceKind(pawn) :- write('pa '), !.
printPieceKind(knight) :- write('KN '), !.
printPieceKind(bishop) :- write('BI '), !.
printPieceKind(rook) :- write('RO '), !.
printPieceKind(queen) :- write('QU '), !.
printPieceKind(king) :- write('KI '), !.

getStartBoard(AllPieces) :-
  AllPieces = [
    [1,8,rook,black], [2,8,knight,black], [3,8,bishop,black], [4,8,queen,black],
    [5,8,king,black], [6,8,bishop,black], [7,8,knight,black], [8,8,rook,black],

    [1,7,pawn,black], [2,7,pawn,black], [3,7,pawn,black], [4,7,pawn,black],
    [5,7,pawn,black], [6,7,pawn,black], [7,7,pawn,black], [8,7,pawn,black],

    [1,2,pawn,white], [2,2,pawn,white], [3,2,pawn,white], [4,2,pawn,white],
    [5,2,pawn,white], [6,2,pawn,white], [7,2,pawn,white], [8,2,pawn,white],

    [1,1,rook,white], [2,1,knight,white], [3,1,bishop,white], [4,1,queen,white],
    [5,1,king,white], [6,1,bishop,white], [7,1,knight,white], [8,1,rook,white]
    ].

startGame :- nl,
  write('Welcome to Chess! You are playing white (and for the moment black too) and start.'),nl,
  getStartBoard(AllPieces),
  gameStep(AllPieces, white).

gameStep(AllPieces, Color) :-
  printBoard(AllPieces),
  input(XStart, YStart, XEnd, YEnd, Color),
  findPieceOnSquare(AllPieces, XStart, YStart, Piece, Color),
  move(AllPieces, [XStart, YStart, Piece, Color], [XEnd, YEnd]),
  movePieceToPosition(AllPieces, XStart, YStart, Piece, Color, XEnd, YEnd, NewAllPieces),
  otherColor(Color, NewColor),
  gameStep(NewAllPieces, NewColor).
