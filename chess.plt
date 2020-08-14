:- begin_tests(move).
:- include(chess).

test(moveWhitePawnFree) :-
    move([ [4,6,pawn,white]], [4,6,pawn,white], [4,7]).

test(moveWhitePawnTooFar, [fail]) :-
    move([ [4,8,pawn,white]], [4,8,pawn,white], [4,9]).

test(moveWhitePawnSanityCheck) :-
    move([ [4,4,pawn,white]], [4,4,pawn,white], [4,5]).
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
