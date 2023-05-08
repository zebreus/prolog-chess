{ pkgs ? import <nixpkgs> { } }:

with pkgs;
stdenv.mkDerivation rec {
  pname = "prolog-chess";
  version = "1.0.0";

  src = ./.;

  nativeBuildInputs = [
    swiProlog
  ];

  installPhase = ''
    mkdir -p $out/opt/prolog-chess
    cp chess.pl $out/opt/prolog-chess/chess.pl
    cp pieceValues.pl $out/opt/prolog-chess/pieceValues.pl
   
    mkdir -p $out/bin
    cat <<EOF > $out/bin/${pname}
    #!/usr/bin/env bash
    
    swipl -O -f $out/opt/prolog-chess/chess.pl -g "startGame, halt."

    EOF
    chmod a+x $out/bin/${pname}
  '';

  meta.mainProgram = "${pname}";
}
