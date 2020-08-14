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

test(moveWhitePawnFree) :-
    move([ [4,6,pawn,white]], [4,6,pawn,white], [4,7]).

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

:- end_tests(collisionDetection).
