{ mkDerivation, base, bytestring, containers, directory, fetchgit
, ghcjs-perch, mtl, stdenv, transformers, transient
, transient-universe
}:
mkDerivation {
  pname = "axiom";
  version = "0.4.7";
  src = fetchgit {
    url = "https://github.com/transient-haskell/transient-stack";
    sha256 = "1ygpqfsgxc6sbd91fcyi4i78nds1l680krjww9r281rsvmmk3j1l";
    rev = "b10d3912ee430b41a097725a1b4aec1b9a1620c6";
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
