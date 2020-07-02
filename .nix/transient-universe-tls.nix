{ mkDerivation, base, bytestring, cprng-aes, data-default
, directory, fetchgit, mtl, network, stdenv, tls, transient
, transient-universe, x509-store, x509-system
}:
mkDerivation {
  pname = "transient-universe-tls";
  version = "0.2.0.0";
  src = fetchgit {
    url = "https://github.com/transient-haskell/transient-stack";
    sha256 = "1ygpqfsgxc6sbd91fcyi4i78nds1l680krjww9r281rsvmmk3j1l";
    rev = "b10d3912ee430b41a097725a1b4aec1b9a1620c6";
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
