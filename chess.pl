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
input(XStart, YStart, XEnd, YEnd) :-
  readInput(XStart, YStart, XEnd, YEnd),
  checkInput(XStart, YStart, XEnd, YEnd), !.
input(XStart, YStart, XEnd, YEnd) :-
  write('Invalid input, please check that you have the right format!'),nl,
  input(XStart, YStart, XEnd, YEnd).

% readInput(-XStart, -YStart, -XEnd, -YEnd)
% Reads and parses the input from the user
readInput(XStart, YStart, XEnd, YEnd) :-
  write('Please enter your next move [Format: "A2,A4".]:'), nl,
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
  % Add further checks here

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
  findPieceOnSquare(AllPieces, XCoord, YCoord, Color, Piece),
  printPiece(Color, Piece),
  NewXCoord is XCoord + 1,
  printBoardSquares(AllPieces, NewXCoord, YCoord).

findPieceOnSquare([], _, _, no, piece) :- !.
findPieceOnSquare([[XCoord, YCoord, Color, Piece] | _], XCoord, YCoord, Color, Piece) :- !.
findPieceOnSquare([_ | RestPieces], XCoord, YCoord, Color, Piece) :-
  findPieceOnSquare(RestPieces, XCoord, YCoord, Color, Piece), !.

% printPiece(+Color, +Piece)
% Prints a piece
printPiece('no','piece') :- write('      |'), !.
printPiece(Color, Piece) :-
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

printStartBoard :-
  AllPieces = [
    [1,8,black,rook], [2,8,black,knight], [3,8,black,bishop], [4,8,black,queen],
    [5,8,black,king], [6,8,black,bishop], [7,8,black,knight], [8,8,black,rook],

    [1,7,black,pawn], [2,7,black,pawn], [3,7,black,pawn], [4,7,black,pawn],
    [5,7,black,pawn], [6,7,black,pawn], [7,7,black,pawn], [8,7,black,pawn],

    [1,2,white,pawn], [2,2,white,pawn], [3,2,white,pawn], [4,2,white,pawn],
    [5,2,white,pawn], [6,2,white,pawn], [7,2,white,pawn], [8,2,white,pawn],

    [1,1,white,rook], [2,1,white,knight], [3,1,white,bishop], [4,1,white,queen],
    [5,1,white,king], [6,1,white,bishop], [7,1,white,knight], [8,1,white,rook]
    ],
  printBoard(AllPieces).
