# prolog-chess

A simple minimax chess engine written in swi prolog

You can use the nix package manager to download and start the game:

```
nix run github:zebreus/prolog-chess
```

## Developing

You need to have swi prolog and a C++ compiler installed. You can enter a shell with both using `nix develop .` in the cloned repository.

## Start the game

Load the chess.pl file into swi prolog, then type `startGame.`.

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
