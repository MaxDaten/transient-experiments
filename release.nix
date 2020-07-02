let
  inherit (import <nixpkgs> {}) fetchFromGitHub;

  # Update via:
  # `nix-prefetch-git https://github.com/NixOS/nixpkgs-channels --rev refs/heads/master > nixpkgs-latest.json`
  nixpkgs = builtins.fromJSON (builtins.readFile ./nixpkgs-20.03-darwin.json);

  src = fetchFromGitHub {
    owner = "NixOS";
    repo = "nixpkgs";
    inherit (nixpkgs) rev sha256;
  };

  pkgs = import src {};

  site = pkgs.callPackage ./default.nix { };
in site