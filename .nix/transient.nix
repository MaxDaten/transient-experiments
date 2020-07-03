{ mkDerivation, base, bytestring, containers, directory, fetchgit
, mtl, random, stdenv, stm, time, transformers
}:
mkDerivation {
  pname = "transient";
  version = "0.6.4";
  src = fetchgit {
    url = "https://github.com/transient-haskell/transient-stack";
    sha256 = "1bj0hi9rmfi6p6nsvrh3lqn4r5alnpvf69z8wiiamckqp47xamw2";
    rev = "d57f3f6f78eda3fe6b43d4d77e784a61a9aab7fa";
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
