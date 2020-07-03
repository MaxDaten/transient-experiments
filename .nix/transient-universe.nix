{ mkDerivation, aeson, base, base64-bytestring, bytestring
, case-insensitive, containers, directory, fetchgit, filepath
, hashable, HTTP, iproute, mtl, network, network-info, network-uri
, old-time, process, random, stdenv, stm, TCache, text, time
, transformers, transient, vector, websockets
}:
mkDerivation {
  pname = "transient-universe";
  version = "0.5.2";
  src = fetchgit {
    url = "https://github.com/transient-haskell/transient-stack";
    sha256 = "1bj0hi9rmfi6p6nsvrh3lqn4r5alnpvf69z8wiiamckqp47xamw2";
    rev = "d57f3f6f78eda3fe6b43d4d77e784a61a9aab7fa";
    fetchSubmodules = true;
  };
  postUnpack = "sourceRoot+=/transient-universe; echo source root reset to $sourceRoot";
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [
    aeson base base64-bytestring bytestring case-insensitive containers
    directory filepath hashable HTTP iproute mtl network network-info
    network-uri old-time process random stm TCache text time
    transformers transient vector websockets
  ];
  executableHaskellDepends = [
    aeson base base64-bytestring bytestring case-insensitive containers
    directory filepath hashable HTTP mtl network network-info
    network-uri old-time process random stm TCache text time
    transformers transient vector websockets
  ];
  testHaskellDepends = [
    aeson base base64-bytestring bytestring case-insensitive containers
    directory filepath hashable HTTP mtl network network-info
    network-uri old-time process random stm TCache text time
    transformers transient vector websockets
  ];
  jailbreak = true;
  homepage = "https://github.com/transient-haskell/transient-universe";
  description = "Remote execution and map-reduce: distributed computing for Transient";
  license = stdenv.lib.licenses.mit;
}
