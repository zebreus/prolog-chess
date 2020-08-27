# prolog-chess
A simple minimax chess engine written in swi prolog

## Start the game
Load the chess.pl file, then type `startGame.`.

## Run unit tests
You can load the unit test file with 
```prolog
load_test_files([]).
```
You can run the unit tests with
```prolog
run_tests
```
Here is a simple command, to start swipl and run the tests:
```bash
swipl -t "load_test_files([]), run_tests." -s chess.pl
```
