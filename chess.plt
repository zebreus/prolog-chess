:- begin_tests(helpers).
:- include(chess).

test(otherColorCorrect) :-
  otherColor(black, white),
  otherColor(white, black),
  otherColor(none, none).

test(otherColorNotIncorrect, [fail]) :-
  otherColor(black, black);
  otherColor(none, black);
  otherColor(none, white);
  otherColor(white, white).

test(inBoundsCorrect) :-
  inBounds([1,1]),
  inBounds([1,8]),
  inBounds([8,1]),
  inBounds([8,8]),
  inBounds([4,4]).

test(inBoundsNotIncorrect, [fail]) :-
  inBounds([0,4]);
  inBounds([9,4]);
  inBounds([4,0]);
  inBounds([4,9]);
  inBounds([100,100]);
  inBounds([100,-100]);
  inBounds([-100,100]);
  inBounds([-100,-100]);
  inBounds([0,0]).

test(getDirectionCorrect) :-
  getDirection(white, 1),
  getDirection(black, -1).

test(getDirectionNoneFails, [fail]) :-
  getDirection(none, _).

test(availableColorsCorrect) :-
  availableColors(black),
  availableColors(white).

test(availableColorsNoneFails, [fail]) :-
  availableColors(none).
  
test(availablePiecesContainAll) :-
  availablePiece(king),
  availablePiece(queen),
  availablePiece(rook),
  availablePiece(bishop),
  availablePiece(knight),
  availablePiece(pawn).

:- end_tests(helpers).

:- begin_tests(move).
:- include(chess).

test(moveStaysInBounds, [fail]) :-
  between(1,8,X),
  between(1,8,Y),
  availablePiece(Piece),
  move([[X,Y,Piece,Color]],[X,Y,Piece,Color],ReachedPosition),
  not(inBounds(ReachedPosition)),
  !.

test(moveWhitePawnFree) :-
  move([ [4,6,pawn,white]], [4,6,pawn,white], [4,7]).

test(moveWhitePawnTwoAtInitial) :-
  move([ [4,2,pawn,white]], [4,2,pawn,white], [4,4]).

test(moveWhitePawnInitialOnlyAt, [fail]) :-
  move([ [4,3,pawn,white]], [4,3,pawn,white], [4,5]);
  move([ [4,1,pawn,white]], [4,1,pawn,white], [4,3]);
  move([ [2,4,pawn,white]], [2,4,pawn,white], [2,6]).

test(moveWhitePawnTooFar, [fail]) :-
  move([ [4,8,pawn,white]], [4,8,pawn,white], [4,9]).

test(moveWhitePawnSanityCheck, [fail]) :-
  move([ [4,4,pawn,white]], [4,4,pawn,white], [4,6]);
  move([ [4,4,pawn,white]], [4,4,pawn,white], [4,3]);
  move([ [4,4,pawn,white]], [4,4,pawn,white], [3,3]);
  move([ [4,4,pawn,white]], [4,4,pawn,white], [3,4]);
  move([ [4,4,pawn,white]], [4,4,pawn,white], [3,5]);
  move([ [4,4,pawn,white]], [4,4,pawn,white], [5,3]);
  move([ [4,4,pawn,white]], [4,4,pawn,white], [5,4]);
  move([ [4,4,pawn,white]], [4,4,pawn,white], [5,5]).

test(moveWhitePawnBlocked, [fail]) :-
  move([ [4,6,pawn,white], [4,7,pawn,white]], [4,6,pawn,white], [4,7]);
  move([ [4,6,pawn,white], [4,7,pawn,black]], [4,6,pawn,white], [4,7]).

test(moveWhitePawnBeatNotAvailable, [fail]) :-
  move([ [4,6,pawn,white]], [4,6,pawn,white], [5,7]);
  move([ [4,6,pawn,white]], [4,6,pawn,white], [3,7]);
  move([ [4,6,pawn,white], [5,7,pawn,black]], [4,6,pawn,white], [3, 7]);
  move([ [4,6,pawn,white], [3,7,pawn,black]], [4,6,pawn,white], [5, 7]).

test(moveWhitePawnBeatBlack) :-
  move([ [4,6,pawn,white], [5,7,pawn,black]], [4,6,pawn,white], [5, 7]),
  move([ [4,6,pawn,white], [3,7,pawn,black]], [4,6,pawn,white], [3, 7]).

test(moveWhitePawnDontBeatWhite, [fail]) :-
  move([ [4,6,pawn,white], [5,7,pawn,white]], [4,6,pawn,white], [5, 7]);
  move([ [4,6,pawn,white], [3,7,pawn,white]], [4,6,pawn,white], [3, 7]).

test(moveBlackPawnFree) :-
  move([ [4,6,pawn,black]], [4,6,pawn,black], [4,5]).

test(moveBlackPawnTwoAtInitial) :-
  move([ [4,7,pawn,black]], [4,7,pawn,black], [4,5]).

test(moveBlackPawnInitialOnlyAt, [fail]) :-
  move([ [4,6,pawn,black]], [4,6,pawn,black], [4,4]);
  move([ [4,8,pawn,black]], [4,8,pawn,black], [4,6]);
  move([ [2,5,pawn,black]], [2,5,pawn,black], [2,3]).

test(moveWhitePawnTooFar, [fail]) :-
  move([ [4,1,pawn,black]], [4,1,pawn,black], [4,0]).

test(moveBlackPawnSanityCheck, [fail]) :-
  move([ [4,4,pawn,black]], [4,4,pawn,black], [4,2]);
  move([ [4,4,pawn,black]], [4,4,pawn,black], [4,5]);
  move([ [4,4,pawn,black]], [4,4,pawn,black], [3,3]);
  move([ [4,4,pawn,black]], [4,4,pawn,black], [3,4]);
  move([ [4,4,pawn,black]], [4,4,pawn,black], [3,5]);
  move([ [4,4,pawn,black]], [4,4,pawn,black], [5,3]);
  move([ [4,4,pawn,black]], [4,4,pawn,black], [5,4]);
  move([ [4,4,pawn,black]], [4,4,pawn,black], [5,5]).

test(moveBlackPawnBlocked, [fail]) :-
  move([ [4,6,pawn,black], [4,5,pawn,white]], [4,6,pawn,black], [4,5]);
  move([ [4,6,pawn,black], [4,5,pawn,black]], [4,6,pawn,black], [4,5]).

test(moveBlackPawnBeatNotAvailable, [fail]) :-
  move([ [4,6,pawn,black]], [4,6,pawn,black], [5,5]);
  move([ [4,6,pawn,black]], [4,6,pawn,black], [3,5]);
  move([ [4,6,pawn,black], [5,5,pawn,white]], [4,6,pawn,black], [3, 5]);
  move([ [4,6,pawn,black], [3,5,pawn,white]], [4,6,pawn,black], [5, 5]).

test(moveBlackPawnBeatWhite) :-
  move([ [4,6,pawn,black], [5,5,pawn,white]], [4,6,pawn,black], [5, 5]),
  move([ [4,6,pawn,black], [3,5,pawn,white]], [4,6,pawn,black], [3, 5]).

test(moveBlackPawnDontBeatBlack, [fail]) :-
  move([ [4,6,pawn,black], [5,5,pawn,black]], [4,6,pawn,black], [5, 5]);
  move([ [4,6,pawn,black], [3,5,pawn,black]], [4,6,pawn,black], [3, 5]).

test(moveKing, all(Color = [black, white])) :-
  availableColors(Color),
  move([ [4,4,king,Color]], [4,4,king,Color], [5, 3]),
  move([ [4,4,king,Color]], [4,4,king,Color], [5, 4]),
  move([ [4,4,king,Color]], [4,4,king,Color], [5, 5]),
  move([ [4,4,king,Color]], [4,4,king,Color], [3, 3]),
  move([ [4,4,king,Color]], [4,4,king,Color], [3, 4]),
  move([ [4,4,king,Color]], [4,4,king,Color], [3, 5]),
  move([ [4,4,king,Color]], [4,4,king,Color], [4, 3]),
  move([ [4,4,king,Color]], [4,4,king,Color], [4, 5]).

test(moveKingBeatOtherColor, all(Color = [black, white])) :-
  availableColors(Color),
  otherColor(Color, OtherColor),
  move([ [4,4,king,Color], [5,3,pawn,OtherColor]], [4,4,king,Color], [5, 3]),
  move([ [4,4,king,Color], [5,4,pawn,OtherColor]], [4,4,king,Color], [5, 4]),
  move([ [4,4,king,Color], [5,5,pawn,OtherColor]], [4,4,king,Color], [5, 5]),
  move([ [4,4,king,Color], [3,3,pawn,OtherColor]], [4,4,king,Color], [3, 3]),
  move([ [4,4,king,Color], [3,4,pawn,OtherColor]], [4,4,king,Color], [3, 4]),
  move([ [4,4,king,Color], [3,5,pawn,OtherColor]], [4,4,king,Color], [3, 5]),
  move([ [4,4,king,Color], [4,3,pawn,OtherColor]], [4,4,king,Color], [4, 3]),
  move([ [4,4,king,Color], [4,5,pawn,OtherColor]], [4,4,king,Color], [4, 5]).

test(moveKingNotBeatSameColor, [fail]) :-
  availableColors(Color),
  (
  move([ [4,4,king,Color], [5,3,pawn,Color]], [4,4,king,Color], [5, 3]);
  move([ [4,4,king,Color], [5,4,pawn,Color]], [4,4,king,Color], [5, 4]);
  move([ [4,4,king,Color], [5,5,pawn,Color]], [4,4,king,Color], [5, 5]);
  move([ [4,4,king,Color], [3,3,pawn,Color]], [4,4,king,Color], [3, 3]);
  move([ [4,4,king,Color], [3,4,pawn,Color]], [4,4,king,Color], [3, 4]);
  move([ [4,4,king,Color], [3,5,pawn,Color]], [4,4,king,Color], [3, 5]);
  move([ [4,4,king,Color], [4,3,pawn,Color]], [4,4,king,Color], [4, 3]);
  move([ [4,4,king,Color], [4,5,pawn,Color]], [4,4,king,Color], [4, 5])
  ).


test(moveKnight, all(Color = [black, white])) :-
  availableColors(Color),
  move([ [4,4,knight,Color]], [4,4,knight,Color], [2, 3]),
  move([ [4,4,knight,Color]], [4,4,knight,Color], [2, 5]),
  move([ [4,4,knight,Color]], [4,4,knight,Color], [6, 3]),
  move([ [4,4,knight,Color]], [4,4,knight,Color], [6, 5]),
  move([ [4,4,knight,Color]], [4,4,knight,Color], [3, 2]),
  move([ [4,4,knight,Color]], [4,4,knight,Color], [5, 2]),
  move([ [4,4,knight,Color]], [4,4,knight,Color], [3, 6]),
  move([ [4,4,knight,Color]], [4,4,knight,Color], [5, 6]).

test(moveKnightBeatOtherColor, all(Color = [black, white])) :-
  availableColors(Color),
  otherColor(Color, OtherColor),
  move([ [4,4,knight,Color], [2,3,pawn,OtherColor]], [4,4,knight,Color], [2, 3]),
  move([ [4,4,knight,Color], [2,5,pawn,OtherColor]], [4,4,knight,Color], [2, 5]),
  move([ [4,4,knight,Color], [6,3,pawn,OtherColor]], [4,4,knight,Color], [6, 3]),
  move([ [4,4,knight,Color], [6,5,pawn,OtherColor]], [4,4,knight,Color], [6, 5]),
  move([ [4,4,knight,Color], [3,2,pawn,OtherColor]], [4,4,knight,Color], [3, 2]),
  move([ [4,4,knight,Color], [5,2,pawn,OtherColor]], [4,4,knight,Color], [5, 2]),
  move([ [4,4,knight,Color], [3,6,pawn,OtherColor]], [4,4,knight,Color], [3, 6]),
  move([ [4,4,knight,Color], [5,6,pawn,OtherColor]], [4,4,knight,Color], [5, 6]).

test(moveKnightNotBeatSameColor, [fail]) :-
  availableColors(Color),
  (
  move([ [4,4,knight,Color], [2,3,pawn,Color]], [4,4,knight,Color], [2, 3]);
  move([ [4,4,knight,Color], [2,5,pawn,Color]], [4,4,knight,Color], [2, 5]);
  move([ [4,4,knight,Color], [6,3,pawn,Color]], [4,4,knight,Color], [6, 3]);
  move([ [4,4,knight,Color], [6,5,pawn,Color]], [4,4,knight,Color], [6, 5]);
  move([ [4,4,knight,Color], [3,2,pawn,Color]], [4,4,knight,Color], [3, 2]);
  move([ [4,4,knight,Color], [5,2,pawn,Color]], [4,4,knight,Color], [5, 2]);
  move([ [4,4,knight,Color], [3,6,pawn,Color]], [4,4,knight,Color], [3, 6]);
  move([ [4,4,knight,Color], [5,6,pawn,Color]], [4,4,knight,Color], [5, 6])
  ).

test(moveRookFree, all(Color = [black, white])) :-
  availableColors(Color),
  move([ [4,4,rook,Color]], [4,4,rook,Color], [4, 1]),
  move([ [4,4,rook,Color]], [4,4,rook,Color], [4, 2]),
  move([ [4,4,rook,Color]], [4,4,rook,Color], [4, 3]),
  move([ [4,4,rook,Color]], [4,4,rook,Color], [4, 5]),
  move([ [4,4,rook,Color]], [4,4,rook,Color], [4, 6]),
  move([ [4,4,rook,Color]], [4,4,rook,Color], [4, 7]),
  move([ [4,4,rook,Color]], [4,4,rook,Color], [4, 8]),
  move([ [4,4,rook,Color]], [4,4,rook,Color], [1, 4]),
  move([ [4,4,rook,Color]], [4,4,rook,Color], [2, 4]),
  move([ [4,4,rook,Color]], [4,4,rook,Color], [3, 4]),
  move([ [4,4,rook,Color]], [4,4,rook,Color], [5, 4]),
  move([ [4,4,rook,Color]], [4,4,rook,Color], [6, 4]),
  move([ [4,4,rook,Color]], [4,4,rook,Color], [7, 4]),
  move([ [4,4,rook,Color]], [4,4,rook,Color], [8, 4]).

test(moveRookBeatOtherColor, all(Color = [black, white])) :-
  availableColors(Color),
  otherColor(Color, OtherColor),
  move([ [4,4,rook,Color], [4,1,pawn,OtherColor]], [4,4,rook,Color], [4, 1]),
  move([ [4,4,rook,Color], [4,2,pawn,OtherColor]], [4,4,rook,Color], [4, 2]),
  move([ [4,4,rook,Color], [4,3,pawn,OtherColor]], [4,4,rook,Color], [4, 3]),
  move([ [4,4,rook,Color], [4,5,pawn,OtherColor]], [4,4,rook,Color], [4, 5]),
  move([ [4,4,rook,Color], [4,6,pawn,OtherColor]], [4,4,rook,Color], [4, 6]),
  move([ [4,4,rook,Color], [4,7,pawn,OtherColor]], [4,4,rook,Color], [4, 7]),
  move([ [4,4,rook,Color], [4,8,pawn,OtherColor]], [4,4,rook,Color], [4, 8]),
  move([ [4,4,rook,Color], [1,4,pawn,OtherColor]], [4,4,rook,Color], [1, 4]),
  move([ [4,4,rook,Color], [2,4,pawn,OtherColor]], [4,4,rook,Color], [2, 4]),
  move([ [4,4,rook,Color], [3,4,pawn,OtherColor]], [4,4,rook,Color], [3, 4]),
  move([ [4,4,rook,Color], [5,4,pawn,OtherColor]], [4,4,rook,Color], [5, 4]),
  move([ [4,4,rook,Color], [6,4,pawn,OtherColor]], [4,4,rook,Color], [6, 4]),
  move([ [4,4,rook,Color], [7,4,pawn,OtherColor]], [4,4,rook,Color], [7, 4]),
  move([ [4,4,rook,Color], [8,4,pawn,OtherColor]], [4,4,rook,Color], [8, 4]).

test(moveRookNotBeatSameColor, [fail]) :-
  availableColors(Color),
  (
  move([ [4,4,rook,Color], [4,1,pawn,Color]], [4,4,rook,Color], [4, 1]);
  move([ [4,4,rook,Color], [4,2,pawn,Color]], [4,4,rook,Color], [4, 2]);
  move([ [4,4,rook,Color], [4,3,pawn,Color]], [4,4,rook,Color], [4, 3]);
  move([ [4,4,rook,Color], [4,5,pawn,Color]], [4,4,rook,Color], [4, 5]);
  move([ [4,4,rook,Color], [4,6,pawn,Color]], [4,4,rook,Color], [4, 6]);
  move([ [4,4,rook,Color], [4,7,pawn,Color]], [4,4,rook,Color], [4, 7]);
  move([ [4,4,rook,Color], [4,8,pawn,Color]], [4,4,rook,Color], [4, 8]);
  move([ [4,4,rook,Color], [1,4,pawn,Color]], [4,4,rook,Color], [1, 4]);
  move([ [4,4,rook,Color], [2,4,pawn,Color]], [4,4,rook,Color], [2, 4]);
  move([ [4,4,rook,Color], [3,4,pawn,Color]], [4,4,rook,Color], [3, 4]);
  move([ [4,4,rook,Color], [5,4,pawn,Color]], [4,4,rook,Color], [5, 4]);
  move([ [4,4,rook,Color], [6,4,pawn,Color]], [4,4,rook,Color], [6, 4]);
  move([ [4,4,rook,Color], [7,4,pawn,Color]], [4,4,rook,Color], [7, 4]);
  move([ [4,4,rook,Color], [8,4,pawn,Color]], [4,4,rook,Color], [8, 4])
  ).

test(moveRookNotBeyondOtherPiece, [fail]) :-
  availableColors(Color),
  availableColors(OtherColor),
  (
  move([ [4,4,rook,Color], [5,4,pawn,OtherColor]], [4,4,rook,Color], [6, 4]);
  move([ [4,4,rook,Color], [5,4,pawn,OtherColor]], [4,4,rook,Color], [8, 4]);
  move([ [4,4,rook,Color], [7,4,pawn,OtherColor]], [4,4,rook,Color], [8, 4]);
  move([ [4,4,rook,Color], [3,4,pawn,OtherColor]], [4,4,rook,Color], [2, 4]);
  move([ [4,4,rook,Color], [3,4,pawn,OtherColor]], [4,4,rook,Color], [1, 4]);
  move([ [4,4,rook,Color], [2,4,pawn,OtherColor]], [4,4,rook,Color], [1, 4]);
  move([ [4,4,rook,Color], [4,5,pawn,OtherColor]], [4,4,rook,Color], [4, 6]);
  move([ [4,4,rook,Color], [4,5,pawn,OtherColor]], [4,4,rook,Color], [4, 8]);
  move([ [4,4,rook,Color], [4,7,pawn,OtherColor]], [4,4,rook,Color], [4, 8]);
  move([ [4,4,rook,Color], [4,3,pawn,OtherColor]], [4,4,rook,Color], [4, 2]);
  move([ [4,4,rook,Color], [4,3,pawn,OtherColor]], [4,4,rook,Color], [4, 1]);
  move([ [4,4,rook,Color], [4,2,pawn,OtherColor]], [4,4,rook,Color], [4, 1])
  ).

test(moveRookBeforeOtherPiece, all(Color = _)) :-
  availableColors(Color),
  availableColors(OtherColor),
  move([ [4,4,rook,Color], [8,4,pawn,OtherColor]], [4,4,rook,Color], [7, 4]),
  move([ [4,4,rook,Color], [7,4,pawn,OtherColor]], [4,4,rook,Color], [6, 4]),
  move([ [4,4,rook,Color], [7,4,pawn,OtherColor]], [4,4,rook,Color], [5, 4]),
  move([ [4,4,rook,Color], [2,4,pawn,OtherColor]], [4,4,rook,Color], [3, 4]),
  move([ [4,4,rook,Color], [1,4,pawn,OtherColor]], [4,4,rook,Color], [2, 4]),
  move([ [4,4,rook,Color], [1,4,pawn,OtherColor]], [4,4,rook,Color], [3, 4]),
  move([ [4,4,rook,Color], [4,8,pawn,OtherColor]], [4,4,rook,Color], [4, 7]),
  move([ [4,4,rook,Color], [4,7,pawn,OtherColor]], [4,4,rook,Color], [4, 6]),
  move([ [4,4,rook,Color], [4,7,pawn,OtherColor]], [4,4,rook,Color], [4, 5]),
  move([ [4,4,rook,Color], [4,2,pawn,OtherColor]], [4,4,rook,Color], [4, 3]),
  move([ [4,4,rook,Color], [4,1,pawn,OtherColor]], [4,4,rook,Color], [4, 2]),
  move([ [4,4,rook,Color], [4,1,pawn,OtherColor]], [4,4,rook,Color], [4, 3]).

test(moveBishopFree, all(Color = [black, white])) :-
  availableColors(Color),
  move([ [4,4,bishop,Color]], [4,4,bishop,Color], [1, 1]),
  move([ [4,4,bishop,Color]], [4,4,bishop,Color], [2, 2]),
  move([ [4,4,bishop,Color]], [4,4,bishop,Color], [3, 3]),
  move([ [4,4,bishop,Color]], [4,4,bishop,Color], [5, 5]),
  move([ [4,4,bishop,Color]], [4,4,bishop,Color], [6, 6]),
  move([ [4,4,bishop,Color]], [4,4,bishop,Color], [7, 7]),
  move([ [4,4,bishop,Color]], [4,4,bishop,Color], [8, 8]),
  move([ [4,4,bishop,Color]], [4,4,bishop,Color], [1, 7]),
  move([ [4,4,bishop,Color]], [4,4,bishop,Color], [2, 6]),
  move([ [4,4,bishop,Color]], [4,4,bishop,Color], [3, 5]),
  move([ [4,4,bishop,Color]], [4,4,bishop,Color], [5, 3]),
  move([ [4,4,bishop,Color]], [4,4,bishop,Color], [6, 2]),
  move([ [4,4,bishop,Color]], [4,4,bishop,Color], [7, 1]).

test(moveBishopBeatOtherColor, all(Color = [black, white])) :-
  availableColors(Color),
  otherColor(Color, OtherColor),
  move([ [4,4,bishop,Color], [1,1,pawn,OtherColor]], [4,4,bishop,Color], [1, 1]),
  move([ [4,4,bishop,Color], [5,5,pawn,OtherColor]], [4,4,bishop,Color], [5, 5]),
  move([ [4,4,bishop,Color], [8,8,pawn,OtherColor]], [4,4,bishop,Color], [8, 8]),
  move([ [4,4,bishop,Color], [1,7,pawn,OtherColor]], [4,4,bishop,Color], [1, 7]),
  move([ [4,4,bishop,Color], [5,3,pawn,OtherColor]], [4,4,bishop,Color], [5, 3]),
  move([ [4,4,bishop,Color], [7,1,pawn,OtherColor]], [4,4,bishop,Color], [7, 1]).

test(moveBishopNotBeatSameColor, [fail]) :-
  availableColors(Color),
  (
  move([ [4,4,bishop,Color], [1,1,pawn,Color]], [4,4,bishop,Color], [1, 1]);
  move([ [4,4,bishop,Color], [5,5,pawn,Color]], [4,4,bishop,Color], [5, 5]);
  move([ [4,4,bishop,Color], [8,8,pawn,Color]], [4,4,bishop,Color], [8, 8]);
  move([ [4,4,bishop,Color], [1,7,pawn,Color]], [4,4,bishop,Color], [1, 7]);
  move([ [4,4,bishop,Color], [5,3,pawn,Color]], [4,4,bishop,Color], [5, 3]);
  move([ [4,4,bishop,Color], [7,1,pawn,Color]], [4,4,bishop,Color], [7, 1])
  ).

test(moveBishopNotBeyondOtherPiece, [fail]) :-
  availableColors(Color),
  availableColors(OtherColor),
  (
  move([ [4,4,bishop,Color], [3,3,pawn,OtherColor]], [4,4,bishop,Color], [2, 2]);
  move([ [4,4,bishop,Color], [5,5,pawn,OtherColor]], [4,4,bishop,Color], [6, 6]);
  move([ [4,4,bishop,Color], [5,3,pawn,OtherColor]], [4,4,bishop,Color], [6, 2]);
  move([ [4,4,bishop,Color], [3,5,pawn,OtherColor]], [4,4,bishop,Color], [2, 6]);
  move([ [4,4,bishop,Color], [7,7,pawn,OtherColor]], [4,4,bishop,Color], [8, 8]);
  move([ [4,4,bishop,Color], [3,5,pawn,OtherColor]], [4,4,bishop,Color], [1, 7])
  ).

% Queen tests are rook+bishop tests copied together
test(moveQueenFree, all(Color = [black, white])) :-
  availableColors(Color),
  move([ [4,4,queen,Color]], [4,4,queen,Color], [1, 1]),
  move([ [4,4,queen,Color]], [4,4,queen,Color], [2, 2]),
  move([ [4,4,queen,Color]], [4,4,queen,Color], [3, 3]),
  move([ [4,4,queen,Color]], [4,4,queen,Color], [5, 5]),
  move([ [4,4,queen,Color]], [4,4,queen,Color], [6, 6]),
  move([ [4,4,queen,Color]], [4,4,queen,Color], [7, 7]),
  move([ [4,4,queen,Color]], [4,4,queen,Color], [8, 8]),
  move([ [4,4,queen,Color]], [4,4,queen,Color], [1, 7]),
  move([ [4,4,queen,Color]], [4,4,queen,Color], [2, 6]),
  move([ [4,4,queen,Color]], [4,4,queen,Color], [3, 5]),
  move([ [4,4,queen,Color]], [4,4,queen,Color], [5, 3]),
  move([ [4,4,queen,Color]], [4,4,queen,Color], [6, 2]),
  move([ [4,4,queen,Color]], [4,4,queen,Color], [7, 1]),

  move([ [4,4,queen,Color]], [4,4,queen,Color], [4, 1]),
  move([ [4,4,queen,Color]], [4,4,queen,Color], [4, 2]),
  move([ [4,4,queen,Color]], [4,4,queen,Color], [4, 3]),
  move([ [4,4,queen,Color]], [4,4,queen,Color], [4, 5]),
  move([ [4,4,queen,Color]], [4,4,queen,Color], [4, 6]),
  move([ [4,4,queen,Color]], [4,4,queen,Color], [4, 7]),
  move([ [4,4,queen,Color]], [4,4,queen,Color], [4, 8]),
  move([ [4,4,queen,Color]], [4,4,queen,Color], [1, 4]),
  move([ [4,4,queen,Color]], [4,4,queen,Color], [2, 4]),
  move([ [4,4,queen,Color]], [4,4,queen,Color], [3, 4]),
  move([ [4,4,queen,Color]], [4,4,queen,Color], [5, 4]),
  move([ [4,4,queen,Color]], [4,4,queen,Color], [6, 4]),
  move([ [4,4,queen,Color]], [4,4,queen,Color], [7, 4]),
  move([ [4,4,queen,Color]], [4,4,queen,Color], [8, 4]).


test(moveQueenBeatOtherColor, all(Color = [black, white])) :-
  availableColors(Color),
  otherColor(Color, OtherColor),
  move([ [4,4,queen,Color], [4,1,pawn,OtherColor]], [4,4,queen,Color], [4, 1]),
  move([ [4,4,queen,Color], [4,2,pawn,OtherColor]], [4,4,queen,Color], [4, 2]),
  move([ [4,4,queen,Color], [4,3,pawn,OtherColor]], [4,4,queen,Color], [4, 3]),
  move([ [4,4,queen,Color], [4,5,pawn,OtherColor]], [4,4,queen,Color], [4, 5]),
  move([ [4,4,queen,Color], [4,6,pawn,OtherColor]], [4,4,queen,Color], [4, 6]),
  move([ [4,4,queen,Color], [4,7,pawn,OtherColor]], [4,4,queen,Color], [4, 7]),
  move([ [4,4,queen,Color], [4,8,pawn,OtherColor]], [4,4,queen,Color], [4, 8]),
  move([ [4,4,queen,Color], [1,4,pawn,OtherColor]], [4,4,queen,Color], [1, 4]),
  move([ [4,4,queen,Color], [2,4,pawn,OtherColor]], [4,4,queen,Color], [2, 4]),
  move([ [4,4,queen,Color], [3,4,pawn,OtherColor]], [4,4,queen,Color], [3, 4]),
  move([ [4,4,queen,Color], [5,4,pawn,OtherColor]], [4,4,queen,Color], [5, 4]),
  move([ [4,4,queen,Color], [6,4,pawn,OtherColor]], [4,4,queen,Color], [6, 4]),
  move([ [4,4,queen,Color], [7,4,pawn,OtherColor]], [4,4,queen,Color], [7, 4]),
  move([ [4,4,queen,Color], [8,4,pawn,OtherColor]], [4,4,queen,Color], [8, 4]),

  move([ [4,4,queen,Color], [1,1,pawn,OtherColor]], [4,4,queen,Color], [1, 1]),
  move([ [4,4,queen,Color], [5,5,pawn,OtherColor]], [4,4,queen,Color], [5, 5]),
  move([ [4,4,queen,Color], [8,8,pawn,OtherColor]], [4,4,queen,Color], [8, 8]),
  move([ [4,4,queen,Color], [1,7,pawn,OtherColor]], [4,4,queen,Color], [1, 7]),
  move([ [4,4,queen,Color], [5,3,pawn,OtherColor]], [4,4,queen,Color], [5, 3]),
  move([ [4,4,queen,Color], [7,1,pawn,OtherColor]], [4,4,queen,Color], [7, 1]).

test(moveQueenNotBeatSameColor, [fail]) :-
  availableColors(Color),
  (
  move([ [4,4,queen,Color], [4,1,pawn,Color]], [4,4,queen,Color], [4, 1]);
  move([ [4,4,queen,Color], [4,2,pawn,Color]], [4,4,queen,Color], [4, 2]);
  move([ [4,4,queen,Color], [4,3,pawn,Color]], [4,4,queen,Color], [4, 3]);
  move([ [4,4,queen,Color], [4,5,pawn,Color]], [4,4,queen,Color], [4, 5]);
  move([ [4,4,queen,Color], [4,6,pawn,Color]], [4,4,queen,Color], [4, 6]);
  move([ [4,4,queen,Color], [4,7,pawn,Color]], [4,4,queen,Color], [4, 7]);
  move([ [4,4,queen,Color], [4,8,pawn,Color]], [4,4,queen,Color], [4, 8]);
  move([ [4,4,queen,Color], [1,4,pawn,Color]], [4,4,queen,Color], [1, 4]);
  move([ [4,4,queen,Color], [2,4,pawn,Color]], [4,4,queen,Color], [2, 4]);
  move([ [4,4,queen,Color], [3,4,pawn,Color]], [4,4,queen,Color], [3, 4]);
  move([ [4,4,queen,Color], [5,4,pawn,Color]], [4,4,queen,Color], [5, 4]);
  move([ [4,4,queen,Color], [6,4,pawn,Color]], [4,4,queen,Color], [6, 4]);
  move([ [4,4,queen,Color], [7,4,pawn,Color]], [4,4,queen,Color], [7, 4]);
  move([ [4,4,queen,Color], [8,4,pawn,Color]], [4,4,queen,Color], [8, 4]);

  move([ [4,4,queen,Color], [1,1,pawn,Color]], [4,4,queen,Color], [1, 1]);
  move([ [4,4,queen,Color], [5,5,pawn,Color]], [4,4,queen,Color], [5, 5]);
  move([ [4,4,queen,Color], [8,8,pawn,Color]], [4,4,queen,Color], [8, 8]);
  move([ [4,4,queen,Color], [1,7,pawn,Color]], [4,4,queen,Color], [1, 7]);
  move([ [4,4,queen,Color], [5,3,pawn,Color]], [4,4,queen,Color], [5, 3]);
  move([ [4,4,queen,Color], [7,1,pawn,Color]], [4,4,queen,Color], [7, 1])
  ).

test(moveQueenNotBeyondOtherPiece, [fail]) :-
  availableColors(Color),
  availableColors(OtherColor),
  (
  move([ [4,4,queen,Color], [5,4,pawn,OtherColor]], [4,4,queen,Color], [6, 4]);
  move([ [4,4,queen,Color], [5,4,pawn,OtherColor]], [4,4,queen,Color], [8, 4]);
  move([ [4,4,queen,Color], [7,4,pawn,OtherColor]], [4,4,queen,Color], [8, 4]);
  move([ [4,4,queen,Color], [3,4,pawn,OtherColor]], [4,4,queen,Color], [2, 4]);
  move([ [4,4,queen,Color], [3,4,pawn,OtherColor]], [4,4,queen,Color], [1, 4]);
  move([ [4,4,queen,Color], [2,4,pawn,OtherColor]], [4,4,queen,Color], [1, 4]);
  move([ [4,4,queen,Color], [4,5,pawn,OtherColor]], [4,4,queen,Color], [4, 6]);
  move([ [4,4,queen,Color], [4,5,pawn,OtherColor]], [4,4,queen,Color], [4, 8]);
  move([ [4,4,queen,Color], [4,7,pawn,OtherColor]], [4,4,queen,Color], [4, 8]);
  move([ [4,4,queen,Color], [4,3,pawn,OtherColor]], [4,4,queen,Color], [4, 2]);
  move([ [4,4,queen,Color], [4,3,pawn,OtherColor]], [4,4,queen,Color], [4, 1]);
  move([ [4,4,queen,Color], [4,2,pawn,OtherColor]], [4,4,queen,Color], [4, 1]);

  move([ [4,4,queen,Color], [3,3,pawn,OtherColor]], [4,4,queen,Color], [2, 2]);
  move([ [4,4,queen,Color], [5,5,pawn,OtherColor]], [4,4,queen,Color], [6, 6]);
  move([ [4,4,queen,Color], [5,3,pawn,OtherColor]], [4,4,queen,Color], [6, 2]);
  move([ [4,4,queen,Color], [3,5,pawn,OtherColor]], [4,4,queen,Color], [2, 6]);
  move([ [4,4,queen,Color], [7,7,pawn,OtherColor]], [4,4,queen,Color], [8, 8]);
  move([ [4,4,queen,Color], [3,5,pawn,OtherColor]], [4,4,queen,Color], [1, 7])
  ).

test(moveQueenBeforeOtherPiece, all(Color = _)) :-
  availableColors(Color),
  availableColors(OtherColor),
  move([ [4,4,queen,Color], [8,4,pawn,OtherColor]], [4,4,queen,Color], [7, 4]),
  move([ [4,4,queen,Color], [7,4,pawn,OtherColor]], [4,4,queen,Color], [6, 4]),
  move([ [4,4,queen,Color], [7,4,pawn,OtherColor]], [4,4,queen,Color], [5, 4]),
  move([ [4,4,queen,Color], [2,4,pawn,OtherColor]], [4,4,queen,Color], [3, 4]),
  move([ [4,4,queen,Color], [1,4,pawn,OtherColor]], [4,4,queen,Color], [2, 4]),
  move([ [4,4,queen,Color], [1,4,pawn,OtherColor]], [4,4,queen,Color], [3, 4]),
  move([ [4,4,queen,Color], [4,8,pawn,OtherColor]], [4,4,queen,Color], [4, 7]),
  move([ [4,4,queen,Color], [4,7,pawn,OtherColor]], [4,4,queen,Color], [4, 6]),
  move([ [4,4,queen,Color], [4,7,pawn,OtherColor]], [4,4,queen,Color], [4, 5]),
  move([ [4,4,queen,Color], [4,2,pawn,OtherColor]], [4,4,queen,Color], [4, 3]),
  move([ [4,4,queen,Color], [4,1,pawn,OtherColor]], [4,4,queen,Color], [4, 2]),
  move([ [4,4,queen,Color], [4,1,pawn,OtherColor]], [4,4,queen,Color], [4, 3]).


:- end_tests(move).

% Test all collision related rules
:- begin_tests(collisionDetection).
:- include(chess).

test(collisionDetects) :-
  collision([ [4,6,pawn,white], [4,7,pawn,black]], [4,6], [4,6,pawn,white]),
  collision([ [4,6,pawn,white], [4,7,pawn,black]], [4,7], [4,7,pawn,black]).

test(collisionDetectsFree) :-
  collision([ [4,6,pawn,white], [4,7,pawn,black]], [4,5], []),
  collision([ [4,6,pawn,white], [4,7,pawn,black]], [4,3], []),
  collision([ [4,6,pawn,white], [4,7,pawn,black]], [1,1], []),
  collision([ [4,6,pawn,white], [4,7,pawn,black]], [8,8], []).

test(whiteCanMoveToBlack) :-
  canMoveTo([ [4,6,pawn,white], [4,7,pawn,black]], black, [4,7]).

test(blackCantMoveToBlack, [fail]) :-
  canMoveTo([ [4,6,pawn,white], [4,7,pawn,black]], white, [4,7]).

test(whiteCantMoveToWhite, [fail]) :-
  canMoveTo([ [4,6,pawn,white], [4,7,pawn,black]], black, [4,6]).

test(blackCanMoveToWhite) :-
  canMoveTo([ [4,6,pawn,white], [4,7,pawn,black]], white, [4,6]).

test(cantMoveToNone, [fail]) :-
  canMoveTo([ [4,6,pawn,white], [4,7,pawn,black]], none, [4,6]);
  canMoveTo([ [4,6,pawn,white], [4,7,pawn,black]], none, [4,7]).

test(canMoveToFree) :-
  canMoveTo([ [4,6,pawn,white], [4,7,pawn,black]], none, [4,4]),
  canMoveTo([ [4,6,pawn,white], [4,7,pawn,black]], none, [1,1]),
  canMoveTo([ [4,6,pawn,white], [4,7,pawn,black]], none, [8,8]).

test(nextPieceNorth) :-
  nextPieceNorth([ [4,4,rook,black], [4,3,pawn,black] ], [4,4], [4,9,none,none]),
  nextPieceNorth([ [4,4,rook,black], [4,5,pawn,black] ], [4,4], [4,5,pawn,black]),
  nextPieceNorth([ [4,4,rook,black], [4,6,pawn,black] ], [4,4], [4,6,pawn,black]),
  nextPieceNorth([ [4,4,rook,black], [4,7,pawn,black] ], [4,4], [4,7,pawn,black]),
  nextPieceNorth([ [4,4,rook,black], [4,8,pawn,black] ], [4,4], [4,8,pawn,black]),
  nextPieceNorth([ [4,4,rook,black], [4,8,pawn,black], [4,6,pawn,black] ], [4,4], [4,6,pawn,black]),
  nextPieceNorth([ [4,4,rook,black], [3,6,pawn,black] ], [4,4], [4,9,none,none]).

test(nextPieceNorthOnlyNextPiece, [fail]) :-
  nextPieceNorth([ [4,4,rook,black], [4,5,pawn,black] ], [4,4], [4,9,none,none]).

test(nextPieceEast) :-
  nextPieceEast([ [4,4,rook,black], [3,4,pawn,black] ], [4,4], [9,4,none,none]),
  nextPieceEast([ [4,4,rook,black], [5,4,pawn,black] ], [4,4], [5,4,pawn,black]),
  nextPieceEast([ [4,4,rook,black], [6,4,pawn,black] ], [4,4], [6,4,pawn,black]),
  nextPieceEast([ [4,4,rook,black], [7,4,pawn,black] ], [4,4], [7,4,pawn,black]),
  nextPieceEast([ [4,4,rook,black], [8,4,pawn,black] ], [4,4], [8,4,pawn,black]),
  nextPieceEast([ [4,4,rook,black], [8,4,pawn,black], [6, 4,pawn,black] ], [4,4], [6,4,pawn,black]),
  nextPieceEast([ [4,4,rook,black], [6,3,pawn,black] ], [4,4], [9,4,none,none]).

test(nextPieceEastOnlyNextPiece, [fail]) :-
  nextPieceEast([ [4,4,rook,black], [5,4,pawn,black] ], [4,4], [9,4,none,none]).

test(nextPieceSouthCorrect) :-
  nextPieceSouth([ [4,4,rook,black], [4,5,pawn,black] ], [4,4], [4,0,none,none]),
  nextPieceSouth([ [4,4,rook,black], [4,3,pawn,black] ], [4,4], [4,3,pawn,black]),
  nextPieceSouth([ [4,4,rook,black], [4,2,pawn,black] ], [4,4], [4,2,pawn,black]),
  nextPieceSouth([ [4,4,rook,black], [4,1,pawn,black] ], [4,4], [4,1,pawn,black]),
  nextPieceSouth([ [4,4,rook,black], [4,1,pawn,black], [4,2,pawn,black] ], [4,4], [4,2,pawn,black]),
  nextPieceSouth([ [4,4,rook,black], [3,3,pawn,black] ], [4,4], [4,0,none,none]).

test(nextPieceSouthOnlyNextPiece, [fail]) :-
  nextPieceSouth([ [4,4,rook,black], [4,3,pawn,black] ], [4,4], [4,0,none,none]).

test(nextPieceWest) :-
  nextPieceWest([ [4,4,rook,black], [5,4,pawn,black] ], [4,4], [0,4,none,none]),
  nextPieceWest([ [4,4,rook,black], [3,4,pawn,black] ], [4,4], [3,4,pawn,black]),
  nextPieceWest([ [4,4,rook,black], [2,4,pawn,black] ], [4,4], [2,4,pawn,black]),
  nextPieceWest([ [4,4,rook,black], [1,4,pawn,black] ], [4,4], [1,4,pawn,black]),
  nextPieceWest([ [4,4,rook,black], [4,1,pawn,black], [2,4,pawn,black] ], [4,4], [2,4,pawn,black]),
  nextPieceWest([ [4,4,rook,black], [3,3,pawn,black] ], [4,4], [0,4,none,none]).

test(nextPieceWestOnlyNextPiece, [fail]) :-
  nextPieceWest([ [4,4,rook,black], [3,4,pawn,black] ], [4,4], [0,4,none,none]).

test(nextPieceNorthEast) :-
  nextPieceNorthEast([ [4,4,rook,black], [4,3,pawn,black] ], [4,4], [9,9,none,none]),
  nextPieceNorthEast([ [4,4,rook,black], [6,6,pawn,black] ], [4,4], [6,6,pawn,black]),
  nextPieceNorthEast([ [4,4,rook,black], [7,7,pawn,black], [6,6,pawn,black] ], [4,4], [6,6,pawn,black]),
  nextPieceNorthEast([ [4,4,rook,black], [3,3,pawn,black] ], [4,4], [9,9,none,none]).

test(nextPieceNorthEastOnlyNextPiece, [fail]) :-
  nextPieceNorthEast([ [4,4,rook,black], [5,5,pawn,black] ], [4,4], [9,9,none,none]).

test(nextPieceSouthEast) :-
  nextPieceSouthEast([ [4,4,rook,black], [4,3,pawn,black] ], [4,4], [8,0,none,none]),
  nextPieceSouthEast([ [4,4,rook,black], [6,2,pawn,black] ], [4,4], [6,2,pawn,black]),
  nextPieceSouthEast([ [4,4,rook,black], [6,2,pawn,black], [7,1,pawn,black] ], [4,4], [6,2,pawn,black]),
  nextPieceSouthEast([ [4,4,rook,black], [3,5,pawn,black] ], [4,4], [8,0,none,none]).

test(nextPieceSouthEastOnlyNextPiece, [fail]) :-
  nextPieceSouthEast([ [4,4,rook,black], [5,3,pawn,black] ], [4,4], [8,0,none,none]).

test(nextPieceSouthWest) :-
  nextPieceSouthWest([ [4,4,rook,black], [4,3,pawn,black] ], [4,4], [0,0,none,none]),
  nextPieceSouthWest([ [4,4,rook,black], [2,2,pawn,black] ], [4,4], [2,2,pawn,black]),
  nextPieceSouthWest([ [4,4,rook,black], [1,1,pawn,black], [3,3,pawn,black] ], [4,4], [3,3,pawn,black]),
  nextPieceSouthWest([ [4,4,rook,black], [5,5,pawn,black] ], [4,4], [0,0,none,none]).

test(nextPieceSouthWestOnlyNextPiece, [fail]) :-
  nextPieceSouthWest([ [4,4,rook,black], [3,3,pawn,black] ], [4,4], [0,0,none,none]).

test(nextPieceNorthWest) :-
  nextPieceNorthWest([ [4,4,rook,black], [4,3,pawn,black] ], [4,4], [0,8,none,none]),
  nextPieceNorthWest([ [4,4,rook,black], [2,6,pawn,black] ], [4,4], [2,6,pawn,black]),
  nextPieceNorthWest([ [4,4,rook,black], [2,6,pawn,black], [1,7,pawn,black] ], [4,4], [2,6,pawn,black]),
  nextPieceNorthWest([ [4,4,rook,black], [5,3,pawn,black] ], [4,4], [0,8,none,none]).

test(nextPieceNorthWestOnlyNextPiece, [fail]) :-
  nextPieceNorthWest([ [4,4,rook,black], [3,5,pawn,black] ], [4,4], [0,8,none,none]).

:- end_tests(collisionDetection).
