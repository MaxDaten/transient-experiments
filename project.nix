{ ghc ? "ghc865"
, ghcjs ? "ghcjs86" 
}:

let
  inherit (pkgs.haskell.lib) enableCabalFlag disableCabalFlag sdistTarball buildStrictly;

  pkgs = builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/20.03.tar.gz";
  };

  jsaddle-src = pkgs.fetchFromGitHub {
    owner = "ghcjs";
    repo = "jsaddle";
    rev = "d569be43f92b9b8c01dc3ee4c41401ab406a2076";
    sha256 = "1m1xxy4l9ii91k1k504qkxh9k1ybprm1m66mkb9dqlwcpyhcccmv";
  };
  jsaddle-dom-src = pkgs.fetchFromGitHub {
    owner = "ghcjs";
    repo = "jsaddle-dom";
    rev = "6ce23c5";
    sha256 = "1wpwf025czibkw6770c99zk7r30j6nh7jdzhzqbi2z824qyqzbnw";
  };
  ghcjs-dom-src = pkgs.fetchFromGitHub {
    owner = "ghcjs";
    repo = "ghcjs-dom";
    rev = "b8e483a";
    sha256 = "06qlbbhjd0mlv5cymp5q0rb69a333l0fcif5zwa83h94dh25c1g7";
  };
  webkit2gtk3-javascriptcore-src = pkgs.fetchFromGitHub {
    owner = "gtk2hs";
    repo = "webkit-javascriptcore";
    rev = "5868624";
    sha256 = "0aj0cvcbnzrdi1ynahpb4034vadfrs99n5qa8dar1srhijv55g8b";
  };

  transientPackages = self: {
    transient = self.callPackage ./.nix/transient.nix { };
    transient-universe = self.callPackage ./.nix/transient-universe.nix { };
    transient-universe-tls = self.callPackage ./.nix/transient-universe.nix { };
    axiom = self.callPackage ./.nix/axiom.nix { };
  };

  config = {
    allowBroken = true;
    allowUnsupportedSystem = true;
    
    packageOverrides = pkgs: rec {
      haskell = pkgs.haskell // {
        packages = pkgs.haskell.packages // {
          
          "${ghcjs}" = pkgs.haskell.packages.${ghcjs}.override {
            overrides = self: super: rec {

              ghcjs-base_0_2_0_0 = self.callPackage ./.nix/ghcjs-base.nix { };
              jsaddle = self.callCabal2nix "jsaddle" "${jsaddle-src}/jsaddle" {};
              ghcjs-dom = self.callCabal2nix "ghcjs-dom" "${ghcjs-dom-src}/ghcjs-dom" {};
              jsaddle-dom = self.callCabal2nix "jsaddle-dom" jsaddle-dom-src {};
              # jsaddle-warp = self.callCabal2nix "jsaddle-warp" "${jsaddle-src}/jsaddle-warp" {};
              # jsaddle-webkit2gtk = self.callCabal2nix "jsaddle-webkit2gtk" "${jsaddle-src}/jsaddle-webkit2gtk" {};
              ghcjs-dom-jsaddle = self.callCabal2nix "ghcjs-dom-jsaddle" "${ghcjs-dom-src}/ghcjs-dom-jsaddle" {};
              ghcjs-dom-jsffi = self.callCabal2nix "ghcjs-dom-jsffi" "${ghcjs-dom-src}/ghcjs-dom-jsffi" {};

              mkDerivation = args: super.mkDerivation (args // {
                doCheck = false;
                doHaddock = false;
                enableLibraryProfiling = false;
                enableExecutableProfiling = false;
                jailbreak = true;
              });

              doctest = null;

              inherit transientPackages;

              network =
                self.callHackage "network" "2.8.0.1" { };

              time =
                self.callHackage "time" "1.9.3" { };
              
              eswf-buzz =
                self.callPackage ./default.nix { };
            };
          };
        };
      };
    };
  };

  nixpkgs = import pkgs { inherit config; };

in 
{
  eswf-buzz-ghcjs = nixpkgs.haskell.packages.${ghcjs}.eswf-buzz;
  # eswf-buzz-ghc = pkgs.haskell.packages."${ghc}".eswf-buzz;
}