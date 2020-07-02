# Transient & Transient-Universe Experiments with nix

Do stupid things, fast!

## Using nix

rough unstructured collection of nix + haskell exploration

### Project structure

- `default.nix`: .cabal equivalent, dependencies etc
- `project.nix`: Build targets & overrides of depencencies
- `.nix/*`: specific dependency references

### GHC

Recent ghc:

```
nix-env -f '<nixpkgs>' -iA haskell.compiler.ghc864
```