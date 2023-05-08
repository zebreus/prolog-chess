{
  description = "A simple minimax chess engine written in prolog";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-22.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      rec {
        name = "prolog-chess";
        packages.prolog-chess = import ./default.nix { pkgs = nixpkgs.legacyPackages.${system}; };
        packages.default = packages.prolog-chess;

        apps.prolog-chess = { type = "app"; program = "" + packages.prolog-chess + "/bin/prolog-chess"; };
      }
    );
}
