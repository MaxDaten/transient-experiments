{ mkDerivation, base, bytestring, cprng-aes, data-default
, directory, fetchgit, mtl, network, stdenv, tls, transient
, transient-universe, x509-store, x509-system
}:
mkDerivation {
  pname = "transient-universe-tls";
  version = "0.2.0.0";
  src = fetchgit {
    url = "https://github.com/transient-haskell/transient-stack";
    sha256 = "1bj0hi9rmfi6p6nsvrh3lqn4r5alnpvf69z8wiiamckqp47xamw2";
    rev = "d57f3f6f78eda3fe6b43d4d77e784a61a9aab7fa";
    fetchSubmodules = true;
  };
  postUnpack = "sourceRoot+=/transient-universe-tls; echo source root reset to $sourceRoot";
  libraryHaskellDepends = [
    base bytestring cprng-aes data-default directory mtl network tls
    transient transient-universe x509-store x509-system
  ];
  jailbreak = true;
  homepage = "http://github.com/transient-haskell/transient-universe-tls";
  description = "transient with secure communications";
  license = stdenv.lib.licenses.bsd3;
}
