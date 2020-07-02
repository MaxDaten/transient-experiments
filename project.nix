{ compiler ? "ghc882" }:

let
  config = {
    packageOverrides = pkgs: rec {
      haskell = pkgs.haskell // {
        packages = pkgs.haskell.packages // {
          "${compiler}" = pkgs.haskell.packages."${compiler}".override {
            overrides = self: super: rec {
              
              transient = 
                self.callPackage ./.nix/transient.nix { };

              transient-universe = 
                self.callPackage ./.nix/transient-universe.nix { };
              
              transient-universe-tls = 
                self.callPackage ./.nix/transient-universe.nix { };
              
              axiom =
                self.callPackage ./.nix/axiom.nix { };
              
              network =
                self.callPackage ./.nix/network.nix { };

              project =
                self.callPackage ./default.nix { };
            
            };
          };
        };
      };
    };
  };

  pkgs = import <nixpkgs> { inherit config; };

in
  {
    master = pkgs.haskell.packages.${compiler}.project;
  }