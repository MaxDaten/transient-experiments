{ mkDerivation, base, bytestring, containers, directory, fetchgit
, mtl, random, stdenv, stm, time, transformers
}:
mkDerivation {
  pname = "transient";
  version = "0.6.4";
  src = fetchgit {
    url = "https://github.com/transient-haskell/transient-stack";
    sha256 = "1ygpqfsgxc6sbd91fcyi4i78nds1l680krjww9r281rsvmmk3j1l";
    rev = "b10d3912ee430b41a097725a1b4aec1b9a1620c6";
    fetchSubmodules = true;
  };
  postUnpack = "sourceRoot+=/transient; echo source root reset to $sourceRoot";
  libraryHaskellDepends = [
    base bytestring containers directory mtl random stm time
    transformers
  ];
  testHaskellDepends = [
    base bytestring containers directory mtl random stm time
    transformers
  ];
  jailbreak = true;
  homepage = "https://github.com/transient-haskell/transient";
  description = "composing programs with multithreading, events and distributed computing";
  license = stdenv.lib.licenses.mit;
}
