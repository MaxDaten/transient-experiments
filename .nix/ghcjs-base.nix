{ mkDerivation, aeson, array, attoparsec, base, binary, bytestring
, containers, deepseq, directory, dlist, fetchgit, ghc-prim
, ghcjs-prim, hashable, HUnit, integer-gmp, primitive, QuickCheck
, quickcheck-unicode, random, scientific, stdenv, test-framework
, test-framework-hunit, test-framework-quickcheck2, text, time
, transformers, unordered-containers, vector
}:
mkDerivation {
  pname = "ghcjs-base";
  version = "0.2.0.0";
  src = fetchgit {
    url = "git://github.com/ghcjs/ghcjs-base";
    sha256 = "09h3rc639n4768y75v0dbrys9pnd4da538cdgzx11dzrjm971f60";
    rev = "18f31dec5d9eae1ef35ff8bbf163394942efd227";
    fetchSubmodules = true;
  };
  libraryHaskellDepends = [
    aeson attoparsec base binary bytestring containers deepseq dlist
    ghc-prim ghcjs-prim hashable integer-gmp primitive scientific text
    time transformers unordered-containers vector
  ];
  testHaskellDepends = [
    array base bytestring deepseq directory ghc-prim ghcjs-prim HUnit
    primitive QuickCheck quickcheck-unicode random test-framework
    test-framework-hunit test-framework-quickcheck2 text
  ];
  homepage = "http://github.com/ghcjs/ghcjs-base";
  description = "base library for GHCJS";
  license = stdenv.lib.licenses.mit;
}
