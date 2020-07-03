

TRANSIENT_STACK=https://github.com/transient-haskell/transient-stack

.PHONY: update-transient
update-transient:
	cabal2nix ${TRANSIENT_STACK} --jailbreak --compiler ghcjs --subpath transient > .nix/transient.nix
	cabal2nix ${TRANSIENT_STACK} --jailbreak --compiler ghcjs --subpath transient-universe > .nix/transient-universe.nix
	cabal2nix ${TRANSIENT_STACK} --jailbreak --compiler ghcjs --subpath transient-universe-tls > .nix/transient-universe-tls.nix
	cabal2nix ${TRANSIENT_STACK} --jailbreak --compiler ghcjs --subpath axiom > .nix/axiom.nix