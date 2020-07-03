# Transient & Transient-Universe Experiments with nix

__*Currently not working*__

Sadly ghcjs is broken in nixos/nixpkgs

Do stupid things, fast!

## Using nix

rough unstructured collection of nix + haskell exploration

### Project structure

- `default.nix`: .cabal equivalent, dependencies etc
- `project.nix`: Build targets & overrides of dependencies
- `.nix/*`: specific dependency references

### GHC

Recent ghc:

```bash
nix-env -f '<nixpkgs>' -iA haskell.compiler.ghc864
```
