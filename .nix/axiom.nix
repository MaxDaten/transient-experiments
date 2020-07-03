{ mkDerivation, base, bytestring, containers, directory, fetchgit
, ghcjs-perch, mtl, stdenv, transformers, transient
, transient-universe
}:
mkDerivation {
  pname = "axiom";
  version = "0.4.7";
  src = fetchgit {
    url = "https://github.com/transient-haskell/transient-stack";
    sha256 = "1bj0hi9rmfi6p6nsvrh3lqn4r5alnpvf69z8wiiamckqp47xamw2";
    rev = "d57f3f6f78eda3fe6b43d4d77e784a61a9aab7fa";
    fetchSubmodules = true;
  };
  postUnpack = "sourceRoot+=/axiom; echo source root reset to $sourceRoot";
  libraryHaskellDepends = [
    base bytestring containers directory ghcjs-perch mtl transformers
    transient transient-universe
  ];
  jailbreak = true;
  homepage = "https://github.com/transient-haskell/axiom";
  description = "Web EDSL for running in browsers and server nodes using transient";
  license = stdenv.lib.licenses.mit;
}
