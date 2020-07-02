

TRANSIENT_STACK=https://github.com/transient-haskell/transient-stack

.PHONY: update-transient
update-transient:
	cabal2nix ${TRANSIENT_STACK} --jailbreak --subpath transient > .nix/transient.nix
	cabal2nix ${TRANSIENT_STACK} --jailbreak --subpath transient-universe > .nix/transient-universe.nix
	cabal2nix ${TRANSIENT_STACK} --jailbreak --subpath transient-universe-tls > .nix/transient-universe-tls.nix
	cabal2nix ${TRANSIENT_STACK} --jailbreak --subpath axiom > .nix/axiom.nix